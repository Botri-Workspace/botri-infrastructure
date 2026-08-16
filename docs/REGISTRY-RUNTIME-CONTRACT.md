# Runtime ↔ Botri Registry Contract

## Purpose

`botri-infrastructure` is the canonical infrastructure boundary for AWS/EC2 runtime resources. The registry records ownership and consumption relationships; it does not store credentials or mutable runtime state.

## Registry metadata for runtime resources

Each registered runtime resource should identify:

- resource identity/type;
- environment;
- canonical infrastructure owner;
- consuming repositories/services;
- access mechanism;
- deployment/verification procedure;
- monitoring/health procedure;
- secret dependency by name/reference only;
- lifecycle and retirement path.

## Access boundary

GitHub repository workflows should reach AWS through the approved IAM/OIDC/SSM path. Direct credentials in repository files are prohibited.

## Control boundary

`botri-control-plane` owns system-level control semantics. `botri-automation-engine` owns repeatable automation. `botri-infrastructure` owns the infrastructure implementation and operational baseline.

## Repository relationship

A product repository may declare that it consumes an EC2/SSM resource, but it does not become the owner of the infrastructure implementation merely by deploying to it.

## Safety

Infrastructure mutations require explicit target, environment, preconditions, validation and evidence. Registry metadata is not authorization for destructive operations.

## Linked centralization work

- `Botri-Workspace/botri-registry#7`
- `Botri-Workspace/botri-registry#3`
