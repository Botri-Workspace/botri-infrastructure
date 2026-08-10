# Botri Infrastructure

> **Infrastructure-as-code and operational infrastructure layer for Botri Workspace systems.**

## Purpose

`botri-infrastructure` provides the infrastructure foundation required to deploy, operate, and support Botri services and environments.

## Scope

Infrastructure responsibilities may include:

- deployment configuration
- server / host setup
- environment provisioning
- service configuration
- operational automation
- infrastructure documentation
- repeatable environment definitions

## Boundary

```text
Botri Applications / Services
          ↓
Botri Infrastructure
          ↓
Compute / Network / Runtime Environment
```

This repository does not own application business logic, canonical knowledge, or workspace governance.

## Operational principles

1. Infrastructure should be reproducible where practical.
2. Secrets must remain outside source control.
3. Production-impacting changes require explicit validation.
4. Environment-specific configuration should be identifiable.
5. Operational assumptions should be documented.
6. Infrastructure changes should remain traceable through Git history and Pull Requests.

## Relationship to other repositories

- Applications remain in their product repositories.
- Governance remains in `botri-governance`.
- Workspace automation may be coordinated through `bwms-core` / `Botri-Command-Centre`.
- Infrastructure-specific implementation belongs here.

## Status

**Active infrastructure repository.**

## Change guidance

Before changing infrastructure, identify:

- affected environment;
- affected services;
- rollback / recovery path;
- secret/configuration dependencies;
- validation required after deployment.

---

**Dashboard maintenance rule:** keep this README aligned with the actual infrastructure providers, deployment mechanisms, environments, and operational automation in the repository.
