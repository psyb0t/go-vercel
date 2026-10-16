// Package vercel is a Go client for the Vercel REST API, generated with
// oapi-codegen from the OpenAPI document Vercel publishes.
package vercel

//go:generate bash scripts/fetch-spec.sh openapi.json
//go:generate bash scripts/patch-spec.sh
//go:generate go tool oapi-codegen --config=config.yaml api/openapi.json
//go:generate bash scripts/split-gen.sh
