# Botri Infrastructure

Central infrastructure and operational automation layer for the Botri Workspace.

## Ownership

This repository owns AWS/EC2 infrastructure automation, deployment orchestration, runtime verification, operational evidence, and environment contracts.

It does **not** own application business logic or market-data storage.

## Repository boundaries

- `botri-market-data` — canonical market-data ingestion, storage, retention, recovery, integrity, and data-access contracts.
- `iqbinary-deriv-lab` — trading/signal application logic and research.
- `botri-infrastructure` — shared AWS/EC2 execution and operational automation.

## Automation model

```text
GitHub repository / Issue / PR
            |
            v
   botri-infrastructure
            |
     GitHub Actions
            |
     AWS OIDC (no keys)
            |
      AWS Systems Manager
            |
           EC2
            |
   machine-readable evidence
            |
            v
      GitHub artifacts
```

SSH is not part of the normal automation path.

## Safety levels

1. **READ** — identity, git state, service status, health, logs, database/schema checks.
2. **WRITE** — approved synchronization/configuration/deployment operations.
3. **RUNTIME** — restart/reload operations, explicitly selected by workflow input.
4. **DESTRUCTIVE** — migrations, deletion, reset, destructive recovery. Never implicit.

## Runtime-data rule

EC2 runtime data, including SQLite databases, logs, credentials, and generated artifacts, never belongs in Git.

## Status

Foundation reset underway. The existing infrastructure repository is being replaced by this clean control-plane baseline through a reviewed PR. AWS account/IAM/SSM configuration remains an external environment step and is documented separately.
