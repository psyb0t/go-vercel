# Changelog

All notable changes per release. Versions follow [semver](https://semver.org).

## v0.1.2, 2026-10-17

- Documentation only. The README and `AGENTS.md` describe the daily regeneration workflow: what it checks, how it fixes failing checks, how it picks the next version and which paths a fix may not touch.

## v0.1.1, 2026-10-16

- `make sec` skips semgrep's `go-unsafe-deserialization-interface` rule. oapi-codegen emits `json.Unmarshal` into `interface{}` for schemas with free-form `additionalProperties`, so the rule failed every scan of the generated client.
- Pinned `shfmt` to 3.13.1-r3 in the development image, because Alpine removed the earlier revision.

## v0.1.0, 2026-10-16

- Added `vercel`, a REST client generated with oapi-codegen from Vercel's OpenAPI document (OpenAPI 3.0.3, spec version 0.0.1, 332 paths).
- `make generate` downloads the current spec from `https://openapi.vercel.sh/`, patches the parts oapi-codegen can't generate with `scripts/patch-spec.sh`, and regenerates the client. The spec is not committed.
- Added the `go-vercel` agent skill: `claude plugin install go-vercel@psyb0t`, `codex plugin add go-vercel@psyb0t`, `openclaw skills install @psyb0t/go-vercel`.
