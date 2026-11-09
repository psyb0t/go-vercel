# Changelog

All notable changes per release. Versions follow [semver](https://semver.org).

## v0.24.0, 2026-11-09

- Breaking: removed `(*UserEventPayload262).Set` and `(*UserEventPayload262).UnmarshalJSON`. Added `(*UserEventPayload264).Set` and `(*UserEventPayload264).UnmarshalJSON`.
- Breaking: reshaped many `UserEventPayload` types again. Fields and their enum types and constants are removed, for example `UserEventPayload160.SrcImages`, `UserEventPayload164.EdgeConfigDigest`, `UserEventPayload168.FromAccount`, `UserEventPayload175.ProjectId` and `UserEventPayload179.Value`. `UserEventPayload162`, `UserEventPayload163`, `UserEventPayload172` and others are no longer comparable.
- Breaking: changed field types, for example `UserEventPayload167.EdgeConfigDigest` from `*string` to `string`, `UserEventPayload178.Key` from `string` to `*string`, and `UserEventPayload179.ProjectId` from `*[]string` to `*string`.
- Breaking: removed helper types such as `UserEvent_Payload_175_Target`, `UserEvent_Payload_221_Factors` and `UserEvent_Payload_347_RollbackDescription_Principal`.
- Added fields on other `UserEventPayload` types, for example `UserEventPayload160.DriveName`, `UserEventPayload161.SnapshotId` and `UserEventPayload164.ProjectName`.
- Added the event types `ListEventTypeNameDriveCreated`, `ListEventTypeNameDriveDeleted`, `ListEventTypeNameDriveSnapshotCreated` and `ListEventTypeNameDriveSnapshotDeleted`, with their `ListEventTypeReplacedBy...` counterparts.
- Added the `gzip` compression constants for log drain delivery, for example `CreateDrainJSONBodyDelivery2CompressionGzip` and `UpdateDrainJSONBodyDelivery2CompressionGzip`.
- Added status variant 12 for Vercel CI invocations, for example `GetVercelCiInvocation200JSONResponseBodyInvocationStatus12` with its `As`, `From` and `Merge` methods, and `ListVercelCiInvocationsParamsStatusAwaitingApproval`.
- Generated from spec version 0.0.1.

## v0.23.0, 2026-11-08

- Breaking: added the optional field `TokenSetKey` (`*string`) to the store secrets items in `CreateIntegrationStoreDirectResponse.JSON200`. It holds the token set key that `name` is built from and is absent for env vars outside the token set.
- Because the response uses anonymous struct types, the types of `CreateIntegrationStoreDirectResponse.JSON200` and `GetJSON200` change. Code that spells out those struct types must be updated.

## v0.22.0, 2026-11-07

- Breaking: removed `UserEvent_Payload.FromUserEventPayload126` and `MergeUserEventPayload126`. `Set` and `UnmarshalJSON` are removed from `UserEventPayload116` and `UserEventPayload260`.
- Breaking: reshaped many `UserEventPayload` types again. Fields and their enum types and constants are removed, for example `UserEventPayload100.DocumentId`, `UserEventPayload103.BuildsEnabled`, `UserEventPayload114.ClientId` and `UserEventPayload120.PasswordProtection`. `UserEventPayload116` loses `AdditionalProperties`, `Get`, `MarshalJSON` and `MetricName`. `UserEventPayload102` and `UserEventPayload117` are no longer comparable.
- Breaking: `UserEventPayload103.Configuration.Name` changed from `*string` to `string`.
- Breaking: removed helper types such as `UserEvent_Payload_127_Job`, `UserEvent_Payload_219_Factors` and `UserEvent_Payload_345_RollbackDescription_Principal`.
- Breaking: changed the anonymous struct in `JSON200` and `GetJSON200` of `CreateProjectResponse`, `GetProjectResponse`, `UpdateProjectResponse`, `UpdateMicrofrontendsResponse`, `DeleteProjectAvatarResponse` and `UploadProjectAvatarResponse`. The `GetProjects200JSONResponseBody0` element type and `GetProjects200JSONResponseBody1.Projects` and `GetProjects200JSONResponseBody2.Projects` changed too, so `AsGetProjects200JSONResponseBody0`, `FromGetProjects200JSONResponseBody0` and `MergeGetProjects200JSONResponseBody0` use a new struct shape.
- Added fields and enum constants on other `UserEventPayload` types, for example `UserEventPayload100.GitOwnerName`, `UserEventPayload115.TokenCount`, `UserEventPayload138.Initiator`, `UserEventPayload201.Configurations` and `UserEventPayload388.Url`.
- Generated from spec version 0.0.1.

## v0.21.0, 2026-11-06

- Breaking: removed `UserEvent_Payload.AsUserEventPayload125`, `FromUserEventPayload125` and `MergeUserEventPayload125`. `Set` and `UnmarshalJSON` are removed from `UserEventPayload113` and `UserEventPayload257`.
- Breaking: reshaped many `UserEventPayload` types again. Fields and their enum types and constants are removed, for example `UserEventPayload10.ChannelId`, `UserEventPayload100.BuildsEnabled`, `UserEventPayload111.ProjectId`, `UserEventPayload117.PasswordProtection` and `UserEventPayload118.SsoProtection`. `UserEventPayload113` loses `AdditionalProperties`, `Get`, `MarshalJSON` and `MetricName`. `UserEventPayload101` and `UserEventPayload116` are no longer comparable.
- Breaking: changed the anonymous struct in `JSON200` and `GetJSON200` of `CreateProjectResponse`, `GetProjectResponse`, `UpdateProjectResponse`, `UpdateMicrofrontendsResponse`, `DeleteProjectAvatarResponse`, `UploadProjectAvatarResponse`, `GetMicrofrontendsInGroupResponse` and `GetProjectBoxesResponse`, and in `GetProjects200JSONResponseBody2.Projects`. Code that names these struct types must change.
- Added `crashLooping` types and constants for project boxes, for example `GetProjectBoxes200JSONResponseBodyDaemonsStatusCrashLooping` and `GetProjectBoxes200JSONResponseBodyDaemonsInstancesItemsProcessCrashLoopingTrue`.
- Added the event types `ListEventTypeNameScheduleCreated`, `ListEventTypeNameScheduleDeleted`, `ListEventTypeNameScheduleDisabled`, `ListEventTypeNameScheduleEnabled`, `ListEventTypeNameScheduleInvoked`, `ListEventTypeNameScheduleUpdated`, `ListEventTypeNameAiAgentUsageBilling` and `ListEventTypeNameProjectGitCredentialTokenMinted`, with their `ListEventTypeReplacedBy...` and `UserEventType...` counterparts.
- Added new `UserEventPayload` helper types such as `UserEvent_Payload_127_Job`, `UserEvent_Payload_219_Factors` and `UserEvent_Payload_345_RollbackDescription_Principal`.
- The rest of the diff reorders generated code across the `client_*.gen.go` files and adds `client_025.gen.go` content.
- Generated from spec version 0.0.1.

## v0.20.0, 2026-11-05

- Breaking: `UserEventPrincipal2.Email` and `UserEventVia2.Email` are removed, along with the constants `UserEventPrincipal2TypeExternal`, `UserEventPrincipal3TypeSystem`, `UserEventVia2TypeExternal` and `UserEventVia3TypeSystem`. The external variant moved to `UserEventPrincipal3` and `UserEventVia3`, which gain `Email`, `Id`, `Name` and `UserEventPrincipal3TypeExternal`, `UserEventVia3TypeExternal`.
- `UserEventPrincipal2` and `UserEventVia2` now describe integrations: new `Avatar`, `Slug`, `UserEventPrincipal2TypeIntegration` and `UserEventVia2TypeIntegration`.
- Added `UserEventPrincipal4` and `UserEventVia4` for the system variant, with `UserEventPrincipal4TypeSystem`, `UserEventVia4TypeSystem`, `UserEvent_Principal.AsUserEventPrincipal4`, `FromUserEventPrincipal4`, `MergeUserEventPrincipal4` and the matching `UserEvent_Via_Item` methods.
- Breaking: the `GetProjects200JSONResponseBody0` and `GetProjects200JSONResponseBody1.Projects` element types changed, so `GetProjects200JSONResponseBody.AsGetProjects200JSONResponseBody0`, `FromGetProjects200JSONResponseBody0` and `MergeGetProjects200JSONResponseBody0` use a new struct shape.
- Added `...ResponseHeader` condition type constants to the firewall config response and request bodies (`GetFirewallConfig200JSONResponseBody`, `PutFirewallConfig200JSONResponseBody`, `UpdateFirewallConfigJSONBody0Value` and similar).
- Added `ResponseMissing` firewall route types and values to the `GetProjects` responses, for example `GetProjects200JSONResponseBody0SecurityFirewallRoutesResponseMissingType`.
- Added `AiGatewayBudgetUpdated` webhook event types, for example `CreateWebhookJSONBodyEventsAiGatewayBudgetUpdated`.
- Added `ListBillingChargesParams.OrgId`.

## v0.19.0, 2026-11-05

- Development image package installation uses HTTPS and bounded retries for signed snapshot indexes and package downloads.
- Breaking: regenerated Vercel specification 0.0.1. Numbered UserEventPayload types and their union helpers changed with the upstream event list. Consumers using these variants must select the current generated types rather than relying on earlier numeric suffixes.
- Added AI Gateway rule models and deployment route fallback fields.

## v0.18.0, 2026-11-03

- Removed and reshaped many `UserEventPayload` types. `UserEventPayload122` is removed, along with `UserEvent_Payload.FromUserEventPayload122` and `MergeUserEventPayload122`. `Set` and `UnmarshalJSON` are removed from `UserEventPayload114` and `UserEventPayload256`, and `UserEventPayload114` also loses `AdditionalProperties`, `Get`, `MarshalJSON` and `MetricName`.
- Removed fields and enum types from `UserEventPayload102` through `UserEventPayload125` and neighbouring payloads, for example `UserEventPayload102.BuildsEnabled`, `UserEventPayload112.ClientId`, `UserEventPayload118.PasswordProtection`, `UserEventPayload119.SsoProtection` and `UserEventPayload124.DeploymentId`, with their `...True`, `...False` and other constants. `UserEventPayload113` and `UserEventPayload124` are no longer comparable. `UserEventPayload100.Configuration.Name` changes from `string` to `*string`.
- Changed the type of `UserEvent_Payload_183_ConfigVersion` from a union struct to `float32`.
- Changed the anonymous struct in `JSON200` and `GetJSON200` of `CreateProjectResponse`, `GetProjectResponse`, `UpdateProjectResponse`, `UpdateMicrofrontendsResponse`, `DeleteProjectAvatarResponse`, `UploadProjectAvatarResponse`, `GetMicrofrontendsInGroupResponse` and `CreateIntegrationStoreDirectResponse`, and `GetProjects200JSONResponseBody2.Projects`. Code that names these struct types must change.
- Added the `integration-tokens-grant` policy variant for KMS issuers: types such as `CreateKmsIssuerJSONBodyPolicy2` and `CreateKmsIssuerPolicy201JSONResponseBody2`, with `From...`, `Merge...` and `As...` methods on the matching policy union types.
- Added credential type types for integration stores, such as `CreateIntegrationStoreDirect200JSONResponseBodyStoreCredentialTypes` with `Oidc` and `Static` variants and transition types.
- Added `DefaultForNextjsTracing` to the drain and log drain source types, and `CreateProject200JSONResponseBodyRollbackDescriptionPrincipal0` types.
- Added many new `UserEventPayload` types and fields. Most of the rest of the diff reorders and renumbers generated code across the `client_*.gen.go` files.
- Generated from spec version 0.0.1.

## v0.17.0, 2026-11-02

- Added the flags project connection endpoints: `CreateFlagsProjectConnection` and `CreateFlagsProjectConnectionWithBody`, `DeleteFlagsProjectConnection` and `GetFlagsProjectConnections` on `Client` and `ClientInterface`, and `CreateFlagsProjectConnectionWithResponse`, `CreateFlagsProjectConnectionWithBodyWithResponse`, `DeleteFlagsProjectConnectionWithResponse` and `GetFlagsProjectConnectionsWithResponse` on `ClientWithResponses` and `ClientWithResponsesInterface`. Custom implementations of the two interfaces must add the new methods.
- Added the matching request builders `NewCreateFlagsProjectConnectionRequest`, `NewCreateFlagsProjectConnectionRequestWithBody`, `NewDeleteFlagsProjectConnectionRequest` and `NewGetFlagsProjectConnectionsRequest`, and the parsers `ParseCreateFlagsProjectConnectionResponse`, `ParseDeleteFlagsProjectConnectionResponse` and `ParseGetFlagsProjectConnectionsResponse`.
- Added the types `CreateFlagsProjectConnectionJSONBody`, `CreateFlagsProjectConnectionJSONRequestBody`, `CreateFlagsProjectConnectionParams`, `CreateFlagsProjectConnectionResponse`, `DeleteFlagsProjectConnectionParams`, `DeleteFlagsProjectConnectionResponse`, `GetFlagsProjectConnectionsParams`, `GetFlagsProjectConnectionsResponse` and `GetFlagsProjectConnections200JSONResponseBody` with its `0` and `1` variants. `GetFlagsProjectConnectionsParamsRole` has the constants `GetFlagsProjectConnectionsParamsRoleConsumer` and `GetFlagsProjectConnectionsParamsRoleSource`.
- Changed the anonymous project struct in `JSON200` and `GetJSON200` of `CreateProjectResponse`, `GetProjectResponse`, `UpdateProjectResponse`, `UpdateMicrofrontendsResponse`, `DeleteProjectAvatarResponse`, `UploadProjectAvatarResponse` and `GetMicrofrontendsInGroupResponse`, and `GetProjects200JSONResponseBody2.Projects`. Code that names these struct types must change.
- Added a `HealthCheck` job to the anonymous struct of `Team.DefaultProjectJobs`, so code that names that struct type must change.
- The rest of the diff reorders generated code across the `client_*.gen.go` files and adds `client_029.gen.go`.
- Generated from spec version 0.0.1.

## v0.16.0, 2026-11-01

- Removed `UserEventPayload406.ProjectId` and `UserEventPayload406.ProjectName`.
- Changed `UserEventPayload406.DeploymentId` and `UserEventPayload406.Environment` from `string` to `*string`. Both are null for a repository's findings.
- Added `UserEventPayload406.TargetId`, `TargetKind` and `TargetName`, with the `UserEventPayload406TargetKind` type and the `UserEventPayload406TargetKindProject` and `UserEventPayload406TargetKindRepository` constants.
- The rest of the diff moves generated enum code between the `client_*.gen.go` files.
- Generated from spec version 0.0.1.

## v0.15.0, 2026-10-31

- Replaced `ConnectConnectorTypeAwsAlpha` and `ConnectConnectorCreateResultTypeAwsAlpha` with `ConnectConnectorTypeAwsOidc` and `ConnectConnectorCreateResultTypeAwsOidc`. The value changes from `aws-alpha` to `aws-oidc`.
- Added a `DiscoveryLayout` field to the KMS issuer responses: `CreateKmsIssuerResponse.JSON201`, `GetKmsIssuerResponse.JSON200`, `ListKmsIssuersResponse.JSON200`, `RevokeKmsSigningKeyResponse.JSON200` and `UpdateKmsIssuerResponse.JSON200`, with the `...DiscoveryLayout` types and `...DiscoveryLayoutConnect` and `...DiscoveryLayoutKms` constants. The anonymous struct types of these fields and their `GetJSON200` and `GetJSON201` getters change, so code that names them must change.
- Moved `Set` and `UnmarshalJSON` from `UserEventPayload255` to `UserEventPayload256`. `UserEvent_Payload` gains `FromUserEventPayload509` and `MergeUserEventPayload509`.
- Reshaped many `UserEventPayload` types from `UserEventPayload239` onward. Fields shifted between neighbouring types, for example `UserEventPayload239.ConnectionType` and `OrganizationSlug` are removed, `UserEventPayload239` gains `Next`, `Previous`, `TeamId` and `TeamName`, and `UserEventPayload240.Enforced` is removed while `UserEventPayload241.Enforced` is added. Their enum types and constants move with them.
- Changed field types on several payloads, for example `UserEventPayload248.Justification`, `UserEventPayload269.Current`, `UserEventPayload300.Next` and `UserEventPayload312.RequireVerifiedCommits`.
- Added the event type `ListEventTypeNameOrganizationTeamDsyncUpdate` with `ListEventTypeReplacedByOrganizationTeamDsyncUpdate`.
- The rest of the diff reorders generated code across the `client_*.gen.go` files and adds `client_029.gen.go`.
- Generated from spec version 0.0.1.

## v0.14.0, 2026-10-30

- Added the `DisconnectConnectorProjectEnvironment` method on `Client` and `ClientInterface`, and `DisconnectConnectorProjectEnvironmentWithResponse` on `ClientWithResponses` and `ClientWithResponsesInterface`. Also added `NewDisconnectConnectorProjectEnvironmentRequest`, `ParseDisconnectConnectorProjectEnvironmentResponse`, `DisconnectConnectorProjectEnvironmentParams`, `DisconnectConnectorProjectEnvironmentResponse` and the `DisconnectConnectorProjectEnvironmentParamsEnvironment0` and `...Environment1` types. Custom implementations of the two interfaces must add the new methods.
- Added `GitComments` and `GitProviderOptions` to `UpdateProjectJSONBody` and `UpdateProjectJSONRequestBody`, with the `UpdateProjectJSONBodyGitProviderOptionsCreateDeployments` type and its `...Disabled` and `...Enabled` constants.
- Added `CodeChannels` to `ConnectConnectorCreateData7` and `ConnectConnectorUpdateData5`.
- Reshaped many `UserEventPayload` types again. `UserEventPayload201` to `UserEventPayload216` lose most of their fields, for example `UserEventPayload201.Queries`, `UserEventPayload210.ProjectId` and `UserEventPayload216.Username`, along with their enum types. `UserEventPayload304` to `UserEventPayload313` lose fields such as `GitProvider`, `OnCommit` and `ProjectName`. `UserEventPayload300.Next` and `Previous` now hold `FunctionDefaultMemoryType`, and `UserEventPayload301.Next` and `Previous` now hold `FunctionDefaultRegions`.
- Changed field types: `UserEventPayload213.LogDrainUrl` from `string` to `*string` and `UserEventPayload311.RequireVerifiedCommits` to a pointer. `UserEventPayload203`, `UserEventPayload205` and `UserEventPayload301` are no longer comparable.
- Moved `Set` and `UnmarshalJSON` from `UserEventPayload254` to `UserEventPayload255`. `UserEvent_Payload` gains `FromUserEventPayload507`, `FromUserEventPayload508`, `MergeUserEventPayload507` and `MergeUserEventPayload508`.
- Added the event types `ListEventTypeNameAiSecurityReview`, `ListEventTypeNameIntegrationSecretRotated` and `ListEventTypeNameIntegrationPreviousSecretRevoked`, with their `ListEventTypeReplacedBy...` and `UserEventType...` counterparts.
- The rest of the diff reorders generated code across the `client_*.gen.go` files.
- Generated from spec version 0.0.1.

## v0.13.0, 2026-10-29

- Removed `GetConfiguration200JSONResponseBody0.TransferRequest` and the types behind it: `GetConfiguration200JSONResponseBody0TransferRequest0`, `GetConfiguration200JSONResponseBody0TransferRequest1` and `GetConfiguration200JSONResponseBody_0_TransferRequest`, with their `Kind` and `BillingPlan` enums and constants.
- Added the `UpdateConditionalBypass` and `UpdateConditionalBypassWithBody` methods on `Client` and `ClientInterface`, plus `UpdateConditionalBypassWithResponse` and `UpdateConditionalBypassWithBodyWithResponse` on `ClientWithResponses` and `ClientWithResponsesInterface`. Also added `NewUpdateConditionalBypassRequest`, `NewUpdateConditionalBypassRequestWithBody` and `ParseUpdateConditionalBypassResponse`, with the `UpdateConditionalBypass200JSONResponseBody...` condition `Type`, `Op` and `Neg` types and constants.
- Reshaped many `UserEventPayload` types again. `UserEventPayload407` to `UserEventPayload419` lose most of their fields, for example `UserEventPayload407.TeamId`, `UserEventPayload407.RemovedUsers` and `UserEventPayload419.NewPlan`. `UserEventPayload412.Enabled` changes from `*UserEventPayload412Enabled` to `UserEventPayload412Enabled`, `UserEventPayload413.Enabled` becomes a pointer and `UserEventPayload413Enabled` changes from `string` to `bool`. `UserEventPayload416` is no longer comparable.
- Removed `UserEvent_Payload_442_Next_AdditionalProperties` and `UserEvent_Payload_442_Previous_AdditionalProperties`.
- Added `...SourceProjectOverviewRecommendedIntegrations` types for `CreateIntegrationStoreDirectJSONBody`, `GetBillingPlansParams`, `GetConfiguration200JSONResponseBody0` to `2` and `GetConfigurations200JSONResponseBody0` and `1`.
- Added the event types `ListEventTypeNameFirewallConditionalBypassUpdated` and `ListEventTypeNameTeamRuntimeCacheUpdated`, with their `ListEventTypeReplacedBy...` counterparts.
- Generated from spec version 0.0.1.

## v0.12.0, 2026-10-29

- Changed the `Options` field of `BuyCredits200JSONResponseBody2OrbSubscriptionIntentConfiguration0` and `...Configuration1`: `ResourceIds` is removed from both.
- Added `BuyCredits200JSONResponseBody2OrbSubscriptionIntentConfiguration4` for the adjust plan item quantity intent, with its `Output` effective behavior and pricing source types, plus `AsBuyCredits200JSONResponseBody2OrbSubscriptionIntentConfiguration4`, `From...` and `Merge...` on `BuyCredits200JSONResponseBody_2_OrbSubscriptionIntent_Configuration`.
- Changed the anonymous JSON body type of `CreateAiGatewayByokCredentialResponse.JSON201`, `GetAiGatewayByokCredentialResponse.JSON200`, `ListAiGatewayByokCredentialsResponse.JSON200` and `UpdateAiGatewayByokCredentialResponse.JSON200`, and of their `GetJSON...` methods.
- Renumbered many `UserEventPayloadNNN` types. For example `UserEventPayload113` and `UserEventPayload253` lose `Set` and `UnmarshalJSON`, `UserEventPayload114` and `UserEventPayload254` gain them, and `UserEvent_Payload` loses `FromUserEventPayload123` and `MergeUserEventPayload123` but gains the `From...` and `Merge...` methods for `UserEventPayload122`, `503`, `504` and `505`.
- Changed field types on many `UserEventPayload` types, such as `UserEventPayload128.DeploymentId` (`*string` to `string`), `UserEventPayload130.Mode` and `PreviousMode` (now pointers), `UserEventPayload150.DestinationId` and `DestinationName` (now `*string`), `UserEventPayload174.Key` (now `*string`) and `UserEventPayload183.ConfigVersion`. Several types such as `UserEventPayload114`, `125` and `128` are no longer comparable.
- Moved the `Client` field from `UserEventPayload396` to `UserEventPayload397`.
- Added `UserEventPayload102.BuildsEnabled` and `UserEventPayload102.Passive`.
- Added the event types `ListEventTypeNameTeamDataCacheUserDisabledUpdated`, `ListEventTypeNameVercelAgentSecurityFindingCreated` and their `ListEventTypeReplacedBy...` counterparts.

## v0.11.0, 2026-10-28

- Added the AI Gateway BYOK credential endpoints `ListAiGatewayByokCredentials`, `GetAiGatewayByokCredential`, `CreateAiGatewayByokCredential`, `UpdateAiGatewayByokCredential` and `DeleteAiGatewayByokCredential`, plus the `WithBody` variants for create and update. They are on `Client`, `ClientInterface`, `ClientWithResponses` and `ClientWithResponsesInterface`, the latter two as `...WithResponse` methods.
- Removed the `...ResourceConfigElasticBuildMachine2` `Cores`, `Memory` and `Label` types and their `N30`, `N61440` and `Turbo` constants from the project response bodies, for both `ResourceConfig` and `DefaultResourceConfig`. This covers `CreateProject`, `GetProject`, `UpdateProject`, `DeleteProjectAvatar`, `UploadProjectAvatar`, `UpdateMicrofrontends`, `GetMicrofrontendsInGroup` and `GetProjects`. A `...ElasticBuildMachine3` variant with `From...` and `Merge...` methods is added in its place.
- Changed the `JSON200` field and `GetJSON200` method types on `CreateProjectResponse`, `GetProjectResponse`, `UpdateProjectResponse`, `DeleteProjectAvatarResponse`, `UploadProjectAvatarResponse`, `UpdateMicrofrontendsResponse` and `GetMicrofrontendsInGroupResponse`, and `GetProjects200JSONResponseBody2.Projects`. Code that assigns these to explicitly typed values must be updated.
- Changed the `Builder` field type on `Services0` and `Services1` of `CancelDeployment200JSONResponseBody`, `CreateDeployment200JSONResponseBody1` and `GetDeployment200JSONResponseBody1`. Daemon liveness probes gained `HttpGet` scheme types with `HTTP` and `HTTPS` constants.
- Reshaped many `UserEventPayload` types again, including `UserEventPayload412`, `UserEventPayload413`, `UserEventPayload495`, `UserEventPayload496`, `UserEventPayload499` and `UserEventPayload500`. Removed `UserEvent_Payload_438_Next_AdditionalProperties` and `UserEvent_Payload_438_Previous_AdditionalProperties`.
- Added the `ListEventTypeNameConnectBrandingUpdated` and `ListEventTypeReplacedByConnectBrandingUpdated` constants.
- The rest of the diff reorders generated code across the `client_*.gen.go` files and adds `client_029.gen.go`.
- Generated from spec version 0.0.1.

## v0.10.1, 2026-10-28

- Updated Semgrep in the development image to 1.182.1 and refreshed its locked dependencies. certifi 2026.10.23 drops the emSign root CAs whose intermediate keys were compromised (GHSA-6q48-6c7w-9gw2).
- Dependabot no longer opens pull requests for `mcp` or the OpenTelemetry packages in `requirements-semgrep.txt`. Semgrep pins their versions itself, so bumping one of them on its own cannot install.
- Updated kin-openapi, which the code generator uses, from 0.142.0 to 0.149.0. The newer version fixes several panics on malformed specs reported in GitHub security advisories.
- The security scan merges its two gitleaks runs into one SARIF run. GitHub code scanning rejects a report with two runs from the same tool, so no scan results had been uploaded.

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
