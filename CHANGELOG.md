# Changelog

All notable changes per release. Versions follow [semver](https://semver.org).

## v0.10.0, 2026-10-27

- Removed the `...ResourceConfigElasticBuildMachineLabel` string type and its `...Standard`, `...Enhanced` and `...Turbo` constants from the project response bodies. This covers `CreateProject200JSONResponseBody`, `GetProject200JSONResponseBody`, `DeleteProjectAvatar200JSONResponseBody`, `GetMicrofrontendsInGroup200JSONResponseBody` and `GetProjects200JSONResponseBody0`, 1 and 2, for both `ResourceConfig` and `DefaultResourceConfig`.
- Added three machine variants in their place, for example `CreateProject200JSONResponseBodyResourceConfigElasticBuildMachine0`, `...Machine1` and `...Machine2`. Each has its own `Cores`, `Memory` and `Label` types with fixed values: 4 cores, 8192 memory and `Standard`; 8 cores, 16384 memory and `Enhanced`; 30 cores, 61440 memory and `Turbo`.
- Changed the anonymous struct types of `JSON200` and `GetJSON200` on `CreateProjectResponse`, `GetProjectResponse`, `DeleteProjectAvatarResponse` and `GetMicrofrontendsInGroupResponse`. Code that assigns these to explicitly typed values must be updated.
- Changed `GetProjects200JSONResponseBody0` and the `Projects` fields of `GetProjects200JSONResponseBody1` and `GetProjects200JSONResponseBody2`. The related `AsGetProjects200JSONResponseBody0`, `FromGetProjects200JSONResponseBody0` and `MergeGetProjects200JSONResponseBody0` methods use the new element type.
- Added the `Details` and `Summary` fields to `UserEvent`, and the `UserEventDetailsDisplay` type with the `UserEventDetailsDisplayInline` constant.
- The rest of the diff reorders generated code across the `client_*.gen.go` files.

## v0.9.1, 2026-10-27

- The development image is based on Debian (`golang:1.26.10-trixie`) instead of Alpine. Alpine keeps only the latest build of each package, so the exact pins broke the image build whenever a package was updated. System packages now come from the snapshot.debian.org date the base image was built from, which keeps them fixed for a given base image digest. jq 1.8.2, shellcheck 0.11.0 and shfmt 3.13.1 keep their versions, and Semgrep runs in its own virtual environment.

## v0.9.0, 2026-10-26

- Replaced the `V0` bool field and the `DriveV0`, `NamedSandboxV0`, `SessionV0` and `SnapshotV0` types (with their `...False` and `...True` constants) with a `WorkloadType` field and the string types `DriveWorkloadType`, `NamedSandboxWorkloadType`, `SessionWorkloadType` and `SnapshotWorkloadType`. Each has `...WorkloadTypeSandbox` and `...WorkloadTypeV0` constants.
- Removed `JSON500` and `GetJSON500` from `ListProjectConnectorConnectionsResponse`.
- Changed the anonymous struct types of `JSON200` and `GetJSON200` on `CancelDeploymentResponse`, `CreateProjectResponse`, `GetProjectResponse`, `UpdateProjectResponse`, `DeleteProjectAvatarResponse`, `UploadProjectAvatarResponse`, `UpdateMicrofrontendsResponse`, `GetMicrofrontendsInGroupResponse`, `GetDeploymentsResponse` and `GenerateRouteResponse`. Code that assigns these to explicitly typed values must be updated.
- Changed `ProjectSettings` on `CreateDeployment200JSONResponseBody1` and `GetDeployment200JSONResponseBody1`, `Projects` on `GetProjects200JSONResponseBody2`, and `CurrentRoute` on `GenerateRouteJSONBody` and `GenerateRouteJSONRequestBody`.
- Added the `GenerateRoute200JSONResponseBodyRouteCaseSensitive` bool type with `...False` and `...True` constants.
- Generated from spec version 0.0.1.

## v0.8.0, 2026-10-24

- Removed the `App` and `Integration` fields and the `...Creator1TypeApp`, `...Creator2TypeIntegration` and `...Creator3TypeSystem` types from the project creator unions in `CreateProject`, `GetProject`, `GetProjects`, `UpdateProject`, `DeleteProjectAvatar`, `UploadProjectAvatar`, `UpdateMicrofrontends` and `GetMicrofrontendsInGroup` responses. Added `From...Creator4` and `Merge...Creator4` methods on the matching `..._Creator` types.
- Reshaped the `UserEventPayload` types again. Removed `UserEventPayload112.Set`, `UserEventPayload112.UnmarshalJSON`, `UserEventPayload252.Set`, `UserEventPayload252.UnmarshalJSON`, `UserEvent_Payload.FromUserEventPayload122` and `UserEvent_Payload.MergeUserEventPayload122`, plus many other `UserEventPayloadNNN` types and their `As`, `From` and `Merge` methods.
- Changed field types on many `UserEventPayload` types, for example `UserEventPayload127.DeploymentId` from `*string` to `string`, `UserEventPayload129.Mode` and `PreviousMode` to pointers, `UserEventPayload149.DestinationId` and `DestinationName` from `string` to `*string`, and `UserEventPayload175.Target` to `*[]UserEventPayload175Target`.
- Added `JSON500` and `GetJSON500` to the connector responses `DeleteConnectorResponse`, `DeleteConnectorProjectConnectionResponse`, `GetConnectorResponse`, `GetConnectorProjectConnectionResponse`, `ListConnectorsResponse`, `ListConnectorProjectConnectionsResponse`, `ListProjectConnectorConnectionsResponse`, `ReplaceConnectorTriggerDestinationsResponse` and `UpsertConnectorProjectConnectionResponse`.
- Added webhook event type constants `ListEventTypeNameMessageboardProjectChannelCreated`, `ListEventTypeNameMessageboardProjectPrivateChannelCreated`, `ListEventTypeNameProjectGitCredentialAttestationCreated`, `ListEventTypeNameProjectGitCredentialAttestationDeleted`, `ListEventTypeNameProjectGitCredentialGrantAttested` and `ListEventTypeNameProjectGitCredentialGrantAttestationRevoked`, plus the matching `ListEventTypeReplacedBy...` constants.
- Generated from spec version 0.0.1.

## v0.7.0, 2026-10-23

- Added `UpdateApiKeyQuota` and `UpdateApiKeyQuotaWithBody` on `Client` and `ClientInterface`, and `UpdateApiKeyQuotaWithResponse` and `UpdateApiKeyQuotaWithBodyWithResponse` on `ClientWithResponses` and `ClientWithResponsesInterface`. Added `NewUpdateApiKeyQuotaRequest`, `NewUpdateApiKeyQuotaRequestWithBody`, `ParseUpdateApiKeyQuotaResponse`, `UpdateApiKeyQuotaJSONBody` and `UpdateApiKeyQuotaJSONBodyAlertThresholds`.
- Added `UserId` and `GroupId` to `CountEvents200JSONResponseBodyData0`, `CountPageviews200JSONResponseBodyData0` and the `Data_1_Item` types of `AggregateEvents` and `AggregatePageviews`. `AggregateEvents200JSONResponseBodyData0` and `AggregatePageviews200JSONResponseBodyData0` changed type, as did their `As`, `From` and `Merge` methods.
- Added webhook event type constants `ListEventTypeNameStartupTermsAccepted`, `ListEventTypeNameMessageboardProjectGranted`, `ListEventTypeNameMessageboardProjectRevoked`, `ListEventTypeNameMessageboardPrivateProjectGranted` and `ListEventTypeNameMessageboardPrivateProjectRevoked`, plus the matching `ListEventTypeReplacedBy...` constants.
- `UserEventPayload` types were renumbered and reshaped again. `UserEventPayload121` and its `AsUserEventPayload121`, `FromUserEventPayload121` and `MergeUserEventPayload121` methods are removed. `UserEventPayload119`, `UserEventPayload498`, `UserEventPayload499`, `UserEventPayload500` and their `As`, `From` and `Merge` methods on `UserEvent_Payload` are added. Many `UserEventPayloadNNN` types lost fields, for example `UserEventPayload108`, `UserEventPayload104` and `UserEventPayload106`, and many `UserEvent_Payload_N_...` helper types were renamed. `UserEventPayload103.Host` changed from `string` to `*string`.
- `PutProjectDaemonInstancesJSONBody` and `PutProjectDaemonInstancesJSONRequestBody` changed from `map[string]int` to `map[string]*int`.
- The `JSON200` field and `GetJSON200` method changed type on `CreateProjectResponse`, `DeleteProjectAvatarResponse`, `GetProjectResponse`, `UpdateProjectResponse`, `UploadProjectAvatarResponse`, `UpdateMicrofrontendsResponse`, `GetMicrofrontendsInGroupResponse`, `CreateIntegrationStoreDirectResponse`, `CreateStorageStoresBlobResponse` and `GetStorageStoresByIdResponse`. `GetProjects200JSONResponseBody2.Projects` changed type too.
- Added `SecretsOutdated` types and a `True` constant under the project metadata of the `CreateIntegrationStoreDirect`, `CreateStorageStoresBlob` and `GetStorageStoresById` responses.
- Generated from spec version 0.0.1.

## v0.6.0, 2026-10-22

- Added `IncludeDeliveryStats` to `GetDrainParams`, `GetDrainsParams` and `GetAllLogDrainsParams`. Drain responses from `GetDrain`, `GetDrains`, `GetAllLogDrains`, `CreateDrain` and `UpdateDrain` gained a `DeliveryStats` field with `Healthy`, `Failing` and `Unknown` state constants and a `N24h` window constant.
- `GetDrainResponse.JSON200` and `GetJSON200` changed from `*GetDrain200JSONResponseBody` to an inline struct, so the `GetDrain200JSONResponseBody0`, `GetDrain200JSONResponseBody1` types and their `Delivery`, `FilterV2`, `Sampling`, `Source` and `Status` enum types are removed. `GetDrain200JSONResponseBodyDisabledReason` and its constants replace the old per-variant ones.
- The `Drains0` and `Drains1` types of `GetAllLogDrains200JSONResponseBody1` and `GetDrains200JSONResponseBody` changed type, as did the matching `As...`, `From...` and `Merge...` methods.
- The `BuildMachine` type under `ResourceConfig` in the `CancelDeployment` and `CreateDeployment` responses is now split into `BuildMachine0` (elastic selection) and `BuildMachine1` (fixed selection). The old purchase type, machine selection type and selection source types and constants are removed and replaced per variant. `N14cpu28gb` is a new purchase type constant.
- `CancelDeployment` `Services0` and `Services1` builder configs gained `DaemonBindings` format and type constants.
- Added `AppHome` and `RichPreviews` to `ConnectConnectorCreateData7`, `ConnectConnectorUpdateData5`.
- Added `ListEventTypeNameOrganizationSsoDeleted` and `ListEventTypeReplacedByOrganizationSsoDeleted`.
- `UserEventPayload` types were renumbered and reshaped. `UserEventPayload119`, `AsUserEventPayload119`, `FromUserEventPayload119` and `MergeUserEventPayload119` are removed, and `UserEventPayload118`, `UserEventPayload496`, `UserEventPayload497` and their `As`, `From` and `Merge` methods on `UserEvent_Payload` are added. Many `UserEvent_Payload_N_...` helper types were renamed to new numbers, and many `UserEventPayload` fields and enum types were added, removed or changed type.
- The `JSON200` field and `GetJSON200` method changed type on `GenerateFirewallRuleResponse`, `GetConnectorTokenResponse` and `CancelDeploymentResponse`.
- Generated from spec version 0.0.1.

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
