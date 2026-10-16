# go-vercel

[![Go Reference](https://pkg.go.dev/badge/github.com/psyb0t/go-vercel.svg)](https://pkg.go.dev/github.com/psyb0t/go-vercel)
[![CI](https://github.com/psyb0t/go-vercel/actions/workflows/pipeline.yml/badge.svg?branch=main)](https://github.com/psyb0t/go-vercel/actions/workflows/pipeline.yml)
[![version](https://raw.githubusercontent.com/psyb0t/go-vercel/badges/version.svg)](https://github.com/psyb0t/go-vercel/tags)
[![license](https://raw.githubusercontent.com/psyb0t/go-vercel/badges/license.svg)](LICENSE)
[![imported by](https://raw.githubusercontent.com/psyb0t/go-vercel/badges/importers.svg)](https://github.com/psyb0t/go-vercel/blob/badges/importers.md)

Unofficial Go client for the [Vercel REST API](https://vercel.com/docs/rest-api), generated with [oapi-codegen](https://github.com/oapi-codegen/oapi-codegen) from the OpenAPI document Vercel publishes at `https://openapi.vercel.sh/`.

The package is `vercel`, in the repository root. The `client_NNN.gen.go` files are generated. Don't edit it by hand, regenerate it.

## Install

```sh
go get github.com/psyb0t/go-vercel
```

## Usage

Every endpoint in the spec has a typed method on `ClientWithResponses`. The base URL is `https://api.vercel.com`.

```go
package main

import (
	"context"
	"net/http"
	"os"

	vercel "github.com/psyb0t/go-vercel"
)

func main() {
	auth := vercel.WithRequestEditorFn(func(_ context.Context, req *http.Request) error {
		req.Header.Set("Authorization", "Bearer "+os.Getenv("VERCEL_TOKEN"))

		// Requests act on your personal account unless they name a team.
		if teamID := os.Getenv("VERCEL_TEAM_ID"); teamID != "" {
			query := req.URL.Query()
			query.Set("teamId", teamID)
			req.URL.RawQuery = query.Encode()
		}

		return nil
	})

	client, err := vercel.NewClientWithResponses("https://api.vercel.com", auth)
	if err != nil {
		panic(err)
	}

	res, err := client.GetProjectsWithResponse(context.Background(), &vercel.GetProjectsParams{})
	if err != nil {
		panic(err)
	}

	_ = res.JSON200
}
```

The same code lives in `example_test.go`, so it is compiled on every `make test`.

Many responses are `oneOf` unions. Decode them with the generated `As...` methods, for example `res.JSON200.User.AsAuthUser()` on `GetAuthUserWithResponse`.

## Auth

Vercel authenticates with a bearer token in the `Authorization` header. Create one under Account Settings, Tokens. To act on a team, pass its ID as the `teamId` query parameter. Most operations also have a `TeamId` field on their params struct, so you can set it per call instead of in the request editor above.

## Agent integrations

The [skill](.agents/skills/go-vercel) teaches a coding agent how to use go-vercel when it writes Go. It works in any agent that reads `.agents/skills/`, and installs natively in the clients below.

### Claude Code

```bash
claude plugin marketplace add psyb0t/agents
claude plugin install go-vercel@psyb0t
```

### Codex

```bash
codex plugin marketplace add psyb0t/agents
codex plugin add go-vercel@psyb0t
```

Codex also picks the skill up with no install in any checkout of this repo.

### OpenClaw

The skill is published to ClawHub on every release:

```bash
openclaw skills install @psyb0t/go-vercel
```

## Regenerating

Vercel's spec is not committed. `make generate` downloads the current OpenAPI document into the gitignored `api/` directory and regenerates the client:

```sh
make generate
```

`gen.go` declares the steps, so `make generate` is just `go generate ./...`:

- `scripts/fetch-spec.sh` downloads `openapi.json` from `https://openapi.vercel.sh/`.
- `scripts/patch-spec.sh` fixes the parts of the spec oapi-codegen can't generate, on the downloaded copy only:
  - `Team.limited` gets its own type name, so it no longer clashes with the `TeamLimited` schema.
  - `null` is dropped from enum values. The schemas stay nullable.
  - Array members of a `oneOf` lose the enum on their items, so the array and its item type don't get the same name. The plain string member keeps the enum.
  - Query parameters sent twice, as `exclude_ids` and `exclude-ids`, get a `Hyphenated` suffix on the hyphenated field.
  - `nullable` is dropped from `additionalProperties` on schemas that also have `properties`.
- oapi-codegen runs with `config.yaml` and writes `client.gen.go`.
- `scripts/split-gen.sh` splits that file, over 500k lines, into `client_NNN.gen.go` files of about 20k lines each. In one file, golangci-lint's wrapcheck runs for hours.

Even split, the package is large: `make lint` takes about half an hour, most of it in the `unused` linter.

## Development

Every command runs in the `Dockerfile.dev` image. The host needs only Docker and Make.

```sh
make help      # list targets
make dep       # go mod tidy + vendor
make lint      # shellcheck, shfmt, go fix, golangci-lint
make test      # go test -race
make sec       # gitleaks, govulncheck, semgrep
make generate  # download the spec and regenerate
```

## License

[MIT](LICENSE). The generated code comes from Vercel's published API specification. The specification itself is not redistributed here. This project is not affiliated with Vercel.
