# AWS setup

## One-time account-side setup

The first production use requires AWS-side configuration. Keep all values environment-scoped and outside Git.

### 1. EC2

The target EC2 instance must be managed by AWS Systems Manager and show as a connected managed node.

### 2. IAM instance role

The EC2 role needs the minimum SSM permissions required for managed-node operation. Do not grant broad administrator permissions to the instance merely for deployment.

### 3. GitHub OIDC deploy role

Create an IAM role trusted by GitHub's OIDC provider. Restrict the trust policy to the Botri organization and the intended repository/workflow/environment. The role should allow only the SSM APIs required by the workflows.

No long-lived AWS access key is required in GitHub.

### 4. GitHub Environment

Create an environment such as `production` and store/configure:

- `AWS_ROLE_ARN` — repository/environment variable;
- `AWS_REGION` — repository/environment variable;
- `EC2_INSTANCE_ID` — environment variable or protected variable.

Protect production with required reviewers before enabling runtime mutation.

### 5. EC2 application contract

Each consumer repository must already exist on the EC2 host at its declared application path. The infrastructure workflow only synchronizes and operates the requested application; it does not copy runtime databases into Git.

### 6. Required SSM verification

Before enabling write operations, run the read-only verification workflow and confirm:

- AWS caller identity;
- target instance identity;
- SSM connectivity;
- host identity;
- Git repository remote/branch/HEAD;
- PM2/service status where applicable;
- filesystem and runtime health.

### 7. Migration rule

The old application-owned EC2 workflow in `iqbinary-deriv-lab` is retired. Do not recreate an equivalent workflow there. Consumer repositories should only reference the centralized infrastructure workflow/contract.

## Security rule

Never commit AWS credentials, instance secrets, `.env` files, runtime database files, PM2 dumps, or generated host inventories.
