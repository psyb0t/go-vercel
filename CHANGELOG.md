# Changelog

All notable changes per release. Versions follow [semver](https://semver.org).

## v0.5.0, 2026-10-21

- Added flag label endpoints `ListFlagLabels`, `ListFlagLabelCounts` and `LookupFlagLabels` (with `WithBody`) on `Client` and `ClientWithResponses`, with their `New...Request` builders, `Parse...Response` functions, `ListFlagLabelsParams`, `ListFlagLabelCountsParams`, `LookupFlagLabelsParams`, `LookupFlagLabelsJSONBody` and response types.
- Added webhook event type constants `ListEventTypeNameMessageboardChannelCreated`, `ListEventTypeNameMessageboardChannelUpdated`, `ListEventTypeNameMessageboardPrivateChannelCreated` and `ListEventTypeNameMessageboardPrivateChannelUpdated`, plus the matching `ListEventTypeReplacedBy...` constants.
- Removed the messageboard space constants `ListEventTypeNameMessageboardSpaceCreated`, `ListEventTypeNameMessageboardSpaceUpdated`, `ListEventTypeNameMessageboardPrivateSpaceCreated` and `ListEventTypeNameMessageboardPrivateSpaceUpdated`, and their `ListEventTypeReplacedBy...` counterparts. Vercel renamed spaces to channels.
- The `GetProjectBoxes` response renamed daemon replicas to instances. The `...DaemonsConfigConfiguredReplicas` and `...DaemonsConfigReplicas` types and the `...DaemonsReplicasItemsAlive` enum are removed, and `...DaemonsConfigConfiguredInstances`, `...DaemonsConfigInstances` and `...DaemonsInstancesItemsAlive` replace them. `GetProjectBoxesResponse.JSON200` and `GetJSON200` changed type.
- Check run source selection: the `Selection3` types are removed from the `CreateDeploymentCheckRun`, `GetDeploymentCheckRun`, `ListCheckRuns`, `ListDeploymentCheckRuns` and `UpdateDeploymentCheckRun` response bodies, along with their `As`, `From` and `Merge` methods. `Selection2.Job` changed from `string` to a typed enum with `FailIfNoMatch` and `Job` constants, so `Selection2` is no longer comparable with `==`.
- `BuyCredits200JSONResponseBody1PurchaseIntentConfiguration6.Options` gained `PlanItemPrices` and `FromPlan.AdditionalSubscriptions` and `FromPlan.PlanItemPrices`, which changed its type.
- The `JSON200` field and `GetJSON200` method changed type on `CreateProjectResponse`, `DeleteProjectAvatarResponse`, `GetProjectResponse`, `UpdateProjectResponse`, `UploadProjectAvatarResponse`, `UpdateMicrofrontendsResponse` and `GetMicrofrontendsInGroupResponse`. `GetProjects200JSONResponseBody2.Projects` changed type too.
- The module now requires Go 1.26.10 in `go.mod`, up from 1.26.9, to pick up the fix for GO-2026-6809 in `crypto/x509`. The development image uses the same toolchain.
- Generated from spec version 0.0.1.

## v0.4.0, 2026-10-20

- Added `GetProjectBoxes`, `PutProjectDaemonInstances` (with `WithBody`) and `RestartProjectDaemonInstance` on `Client` and `ClientWithResponses`, with their `New...Request` builders, `Parse...Response` functions, `GetProjectBoxesParams`, `PutProjectDaemonInstancesParams`, `RestartProjectDaemonInstanceParams` and response types.
- Added `ListEventTypeNameXaaUpdated` and `ListEventTypeReplacedByXaaUpdated`, and a new `UserEvent_Payload` variant with `FromUserEventPayload495` and `MergeUserEventPayload495`.
- `UserEventPayload488` lost `App`, `AppName`, `AtTTL`, `AuthMethod`, `Geolocation`, `GrantType`, `Ip`, `SessionId`, `TokenPrefix`, `UserAgent` and other fields. It gained `Next` and `Previous`, and `Scope` changed from `string` to `UserEventPayload488Scope`. The type is no longer comparable with `==`.
- `UserEventPayload489`, `UserEventPayload490` and `UserEventPayload491` lost fields such as `Domain`, `ProjectId`, `AppName`, `Policy`, `After` and `Before`, along with their enum types.
- `UserEventPayload492` lost all its fields and enum types, and is no longer comparable with `==`. `UserEventPayload493` lost `ActorTokenId`, `Expired`, `Leaked`, `LogoutSource`, `Reason`, `Revoked` and `TokenType`, and its `Origin` and `Scope` fields changed from pointers to plain values. `UserEventPayload494` lost `DeletedCount`.
- The `Builder` field on the `Services0` and `Services1` types for `CancelDeployment200JSONResponseBody`, `CreateDeployment200JSONResponseBody1` and `GetDeployment200JSONResponseBody1` changed type, as did their `Functions` fields.
- The `JSON200` field and `GetJSON200` method changed type on `CancelDeploymentResponse`, `CreateProjectResponse`, `DeleteProjectAvatarResponse`, `GetProjectResponse`, `UpdateProjectResponse`, `UploadProjectAvatarResponse`, `UpdateMicrofrontendsResponse` and `GetMicrofrontendsInGroupResponse`. `GetProjects200JSONResponseBody2.Projects` and `Team.DefaultDeploymentProtection` changed type too.
- Generated from spec version 0.0.1.

## v0.3.0, 2026-10-19

- `RunSessionCommandParams.CmdId` is removed. `RunSessionCommand`, `RunSessionCommandWithResponse` and their `WithBody` variants no longer send a `cmdId` query parameter, and code that still sets that field no longer compiles.
- `UserEventPayload79.Data` changed from a plain struct to a union type, `UserEvent_Payload_79_Data`. It now holds either `UserEventPayload79Data0` (`PlanSlug` of `v0_business` or `v0_teams`, with an optional `Reason` of `non-payment`) or `UserEventPayload79Data1` (`PlanSlug` of `hobby`, no `Reason`). Removed `UserEventPayload79DataPlanSlug`, `UserEventPayload79DataPlanSlugV0Business`, `UserEventPayload79DataPlanSlugV0Teams`, `UserEventPayload79DataReason` and `UserEventPayload79DataReasonNonPayment`. `UserEventPayload79` is no longer comparable with `==`.
- The invoice returned by `GetInvoice` and `GetInvoiceWithResponse` gained four optional fields: `OutstandingTotal`, `PaidTotal`, `PendingRefundTotal` and `RefundedTotal`. The doc comments on `RefundReason`, `RefundTotal`, `RefundedAt` and `State` on the same type were rewritten to describe how refunds, outstanding amounts and state interact.
- The doc comments on `WriteSessionCommandStdin`, `WriteSessionCommandStdinWithBody` and their `WithResponse` variants dropped the note about resend safety when a response omits `bytesWritten`.

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
