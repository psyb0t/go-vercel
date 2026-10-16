# Go code

Refines `~/.claude/rule-details/working-with-generated-code.md` and `~/.claude/rule-details/coding-style.md`.

- **GO1** `client_NNN.gen.go` files are generated. Never edit them by hand. Change `config.yaml` or the scripts in `scripts/` and run `make generate`.
- **GO2** When oapi-codegen can't generate the spec, fix the downloaded copy with a jq filter in `scripts/patch-spec.sh`, with a numbered comment saying what breaks and why. The fix is generic over the shape, not tied to one schema, unless only one schema has it.
- **GO3** `gen.go` holds only the package doc comment and the `//go:generate` lines, in order: fetch, patch, oapi-codegen, split.
- **GO4** The spec in `api/` is downloaded, gitignored and never committed.
- **GO5** `make lint` passes with zero issues. Hand-written files keep lines at most 80 columns, the `.golangci.yml` limit. Generated files are excluded through `generated: lax`.
