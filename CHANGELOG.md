# Changelog

All notable changes per release. Versions follow [semver](https://semver.org).

## v0.2.0, 2026-10-17

- Added organization management: `CreateOrganization`, `GetOrganization`, `ListOrganizations`, `UpdateOrganization`, `AddOrganizationTeam`, `ListOrganizationTeams` and `RemoveOrganizationTeam`, each with a `WithBody` and a `WithResponse` variant on `Client` and `ClientWithResponses`. Added the backing types `Organization`, `OrganizationTeam` and `OrganizationTeamListItem`.
- Added three webhook event types: `connect-cancel-mcp-event-subscription`, `connect-create-mcp-event-subscription` and `organization-name-update`, with matching `ListEventTypeName` and `ListEventTypeReplacedBy` constants and a new `UserEventPayload494` payload.
- Those three new entries sit inside Vercel's webhook payload union, so every generated `UserEventPayloadNNN` type after them now carries a different number than in v0.1.3. Code that names a `UserEventPayloadNNN` type directly, for example in a type switch on `UserEvent_Payload`, needs the new number.
- Removed `(*UserEventPayload247).Set` and `(*UserEventPayload247).UnmarshalJSON` along with that type; the same payload is now generated as `UserEventPayload248`.
- Some payload fields changed between required and optional as part of the same renumbering, for example `UserEventPayload240.Justification` is now a plain `string` instead of `*string`. Check any field you read directly against the regenerated type rather than assuming its old number or shape still applies.

## v0.1.3, 2026-10-17

- Documentation only. The agent skill explains how to look up every endpoint, parameter and model with `go doc` or on pkg.go.dev, and declares its license.
- The skill no longer lists the API credentials under OpenClaw's `requires.env`, which kept OpenClaw from loading it until they were set. It requires only `go`; the credentials are still documented as what your program reads.
- The README points to the full API reference, and the examples in the README and the skill were checked against the current code.

## v0.1.2, 2026-10-17

- Documentation only. The README and `AGENTS.md` describe the daily regeneration workflow: what it checks, how it fixes failing checks, how it picks the next version and which paths a fix may not touch.

## v0.1.1, 2026-10-16

- `make sec` skips semgrep's `go-unsafe-deserialization-interface` rule. oapi-codegen emits `json.Unmarshal` into `interface{}` for schemas with free-form `additionalProperties`, so the rule failed every scan of the generated client.
- Pinned `shfmt` to 3.13.1-r3 in the development image, because Alpine removed the earlier revision.

## v0.1.0, 2026-10-16

- Added `vercel`, a REST client generated with oapi-codegen from Vercel's OpenAPI document (OpenAPI 3.0.3, spec version 0.0.1, 332 paths).
- `make generate` downloads the current spec from `https://openapi.vercel.sh/`, patches the parts oapi-codegen can't generate with `scripts/patch-spec.sh`, and regenerates the client. The spec is not committed.
- Added the `go-vercel` agent skill: `claude plugin install go-vercel@psyb0t`, `codex plugin add go-vercel@psyb0t`, `openclaw skills install @psyb0t/go-vercel`.
