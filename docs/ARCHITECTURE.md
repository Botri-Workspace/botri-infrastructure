# Architecture

## Canonical ownership

`botri-infrastructure` is the control/execution plane for infrastructure operations. Consumer repositories declare application-level deployment contracts; they do not embed AWS credentials, SSH automation, or shared EC2 control logic.

## Cross-repository contract

A deployment request identifies:

- `target_repository`
- `target_ref`
- `environment`
- `ec2_instance_id` (provided by GitHub Environment/variable, never committed)
- `application_path`
- `runtime_action` (`none`, `restart`, or `reload`)

The infrastructure workflow validates the request, authenticates to AWS with OIDC, invokes SSM, captures the command result, and publishes evidence.

## EC2 contract

The target host must have:

- SSM Agent connected to AWS Systems Manager;
- an instance role permitting required SSM operations;
- Git installed;
- access to the target repository;
- the expected application directory;
- the application runtime/service manager installed where required.

## Application boundary

Infrastructure may execute deployment lifecycle commands, but it must not contain application source code. Application repositories remain the source of truth.

## Data boundary

Market data remains owned by `botri-market-data`. Infrastructure may perform safe verification against runtime data when a workflow explicitly requests it, but it does not migrate, synthesize, or own the data model.

## Evidence

Every write/runtime operation records workflow run, target, ref, environment, command identifier, exit/result status, and relevant output as workflow artifacts or summaries.

## Failure rule

A failed verification or deployment must fail the workflow. No automatic fallback to SSH, destructive reset, historical data rebuild, or credential injection is permitted.
