# Permissions and authority

The orchestrator separates preparing work from acting on the outside world.

## Usually safe to prepare

- Read and classify in-scope material.
- Research public sources.
- Analyze data supplied for the task.
- Create drafts and local artifacts.
- Propose changes and decision options.
- Run reversible, scoped validation.

## Require specific user authorization

- Publish content or make a repository public.
- Send email, messages, forms, or proposals.
- Spend money or accept a paid commitment.
- Change permissions, credentials, integrations, or external services.
- Share private, confidential, or proprietary information.
- Delete, overwrite, or make valuable material difficult to recover.

Authorization applies to the concrete action requested. It does not become a permanent permission.

Subagents must report when a bounded assignment reaches one of these boundaries. The root decides how to proceed and asks the user when new authority is required.
