# Testing

Refines `~/.claude/rule-details/go/writing-tests.md`.

- **TST1** Tests are black-box, in package `vercel_test`, and use only the exported API.
- **TST2** REST calls are tested against `httptest`, checking the method, path, `Authorization` header, query parameters and the decoded response. No test calls the live Vercel API.
- **TST3** `example_test.go` holds the README usage example verbatim, so `make test` compiles it. Change both together.
- **TST4** Tests run with `-race` through `make test`.
