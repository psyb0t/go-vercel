#!/bin/bash
# Patches the downloaded Vercel spec in api/ so oapi-codegen can generate it.
# Runs between fetch-spec.sh and oapi-codegen in `go generate`. Every fix is a
# jq filter below; the spec itself stays upstream's, patched only on disk.
set -euo pipefail
trap 'on_error "$?" "$LINENO"' ERR

LOG_FILE="${LOG_FILE:-/tmp/$(basename "$0" .sh).log}"
exec > >(tee -a "$LOG_FILE") 2>&1

SPEC_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/api/openapi.json"
readonly SPEC_FILE

# 1. Team.limited is an inline enum, which oapi-codegen names TeamLimited. That
#    collides with the TeamLimited component schema, so the enum gets its own
#    name.
# 2. Nullable enums list null as a value. oapi-codegen turns that into a
#    `<nil>` constant that does not compile, so null is dropped from every enum
#    (the schema stays nullable) and an enum left empty is removed.
# 3. A oneOf of "array of enum" and "enum" makes oapi-codegen give the array
#    and its item type the same name. The enum is dropped from such array
#    items, so the array member decodes as []string; the plain member keeps it.
# 4. Some operations take the same query parameter twice, once with "_" and
#    once with "-" (exclude_ids and exclude-ids). Both map to one Go field
#    name, so the hyphenated one gets a Hyphenated suffix.
# 5. A schema with both properties and nullable additionalProperties makes
#    oapi-codegen emit a map of pointers with value-typed accessors, which does
#    not compile. nullable is dropped from such additionalProperties.
# shellcheck disable=SC2016 # $names and $name are jq variables, not shell
readonly PATCH_FILTER='
  def pascal: split("-") | map(split("_")) | add
    | map((.[:1] | ascii_upcase) + .[1:]) | join("");

  .components.schemas.Team.properties.limited["x-go-type-name"] = "TeamLimitedFlag"
  | walk(
      if type == "object" and (.enum | type) == "array" and (.enum | any(. == null))
      then .enum |= map(select(. != null))
        | if (.enum | length) == 0 then del(.enum) else . end
      else . end
    )
  | walk(
      if type == "object" and (.oneOf | type) == "array"
      then .oneOf |= map(
          if .type == "array" and (.items.enum != null)
          then .items |= del(.enum) else . end
        )
      else . end
    )
  | walk(
      if type == "object" and .properties != null
        and (.additionalProperties | type) == "object"
      then .additionalProperties |= del(.nullable)
      else . end
    )
  | .paths[][] |= (
      if type == "object" and (.parameters | type) == "array"
      then (.parameters | map(.name? // empty)) as $names
        | .parameters |= map(
            (.name? // "") as $name
            | if ($name | contains("-"))
              and ($names | index($name | gsub("-"; "_")) != null)
            then .["x-go-name"] = ((.name | pascal) + "Hyphenated")
            else . end
          )
      else . end
    )
'

on_error() {
	local exit_code="$1"
	local line="$2"

	printf '{"level":"ERROR","file":"%s","line":%d,"msg":"command failed","exit_code":%d}\n' \
		"${BASH_SOURCE[1]}" "$line" "$exit_code" >&2
}

log() {
	local level="$1"
	shift

	jq -nc \
		--arg time "$(date -u '+%Y-%m-%dT%H:%M:%SZ')" \
		--arg level "$level" \
		--arg file "${BASH_SOURCE[1]##*/}" \
		--arg line "${BASH_LINENO[0]}" \
		--arg func "${FUNCNAME[1]:-main}" \
		--arg msg "$*" \
		'{time:$time,level:$level,file:$file,line:($line|tonumber),func:$func,msg:$msg}' >&2
}

main() {
	if [[ ! -f "$SPEC_FILE" ]]; then
		log ERROR "spec not found, run fetch-spec.sh first path=${SPEC_FILE}"
		exit 1
	fi

	local tmp
	tmp="$(mktemp "${SPEC_FILE}.XXXXXX")"
	# shellcheck disable=SC2064 # expand tmp now, the local is gone when EXIT fires
	trap "rm -f -- '${tmp}'" EXIT

	jq "$PATCH_FILTER" "$SPEC_FILE" >"$tmp"
	chmod 0644 "$tmp"
	mv -- "$tmp" "$SPEC_FILE"
	log INFO "patched spec path=${SPEC_FILE}"
}

main "$@"
