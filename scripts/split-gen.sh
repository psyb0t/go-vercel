#!/bin/bash
# Splits the generated client.gen.go into client_NNN.gen.go files of about
# LINES_PER_FILE lines each. One 500k-line file makes golangci-lint run for
# hours: wrapcheck walks the whole file once per returned error. Splits happen
# only at top-level declarations, every file gets the original import block,
# and goimports drops the imports a file does not use.
set -euo pipefail
trap 'on_error "$?" "$LINENO"' ERR

LOG_FILE="${LOG_FILE:-/tmp/$(basename "$0" .sh).log}"
exec > >(tee -a "$LOG_FILE") 2>&1

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
readonly ROOT_DIR
readonly SOURCE_FILE="${ROOT_DIR}/client.gen.go"
readonly OUTPUT_PREFIX="${ROOT_DIR}/client_"
readonly LINES_PER_FILE=20000

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
	if [[ ! -f "$SOURCE_FILE" ]]; then
		log ERROR "generated file not found path=${SOURCE_FILE}"
		exit 1
	fi

	# Old parts go by exact name, counting up from 001 until one is missing.
	local part=1 old
	while old="$(printf '%s%03d.gen.go' "$OUTPUT_PREFIX" "$part")" && [[ -f "$old" ]]; do
		rm -f -- "$old"
		part=$((part + 1))
	done

	# The header is everything up to the end of the import block. A new file
	# starts at a column-0 comment or declaration that follows a blank line,
	# which in gofmt output is always a top-level boundary.
	awk -v prefix="$OUTPUT_PREFIX" -v max="$LINES_PER_FILE" '
		function open_next() {
			if (out != "") close(out)
			part++
			out = sprintf("%s%03d.gen.go", prefix, part)
			printf "%s", header > out
			count = 0
		}
		in_header {
			header = header $0 "\n"
			if ($0 == ")") { in_header = 0; open_next() }
			next
		}
		count >= max && prev == "" && /^(\/\/|func |type |var |const )/ {
			open_next()
		}
		{ print > out; count++; prev = $0 }
		BEGIN { in_header = 1; part = 0; out = "" }
	' "$SOURCE_FILE"

	rm -f -- "$SOURCE_FILE"
	go tool goimports -w "${OUTPUT_PREFIX}"[0-9]*.gen.go
	log INFO "split generated client files=$(find "$ROOT_DIR" -maxdepth 1 -name 'client_*.gen.go' | wc -l)"
}

main "$@"
