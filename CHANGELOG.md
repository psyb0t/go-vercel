# Changelog

All notable changes per release. Versions follow [semver](https://semver.org).

## v0.1.0, 2026-10-16

- Added `vercel`, a REST client generated with oapi-codegen from Vercel's OpenAPI document (OpenAPI 3.0.3, spec version 0.0.1, 332 paths).
- `make generate` downloads the current spec from `https://openapi.vercel.sh/`, patches the parts oapi-codegen can't generate with `scripts/patch-spec.sh`, and regenerates the client. The spec is not committed.
- Added the `go-vercel` agent skill: `claude plugin install go-vercel@psyb0t`, `codex plugin add go-vercel@psyb0t`, `openclaw skills install @psyb0t/go-vercel`.
