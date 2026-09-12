---
name: knowledge-work-orchestrator
description: Coordinate substantial non-coding knowledge work in Codex with adaptive Direct, Team, and Assurance modes. Use for research, analysis, decisions, documents, spreadsheets, presentations, content, or business operations that may benefit from bounded subagents. Do not invoke for simple questions or small localized edits.
---

# Knowledge Work Orchestrator

Produce a correct, usable deliverable with the smallest team that materially improves the outcome.

The user's explicit instructions and authority boundaries take precedence over this skill.

## Classify before delegating

Choose one mode:

- **Direct:** the root completes the task when it is small, coherent, and locally verifiable.
- **Team:** use one or two specialists when independent workstreams improve evidence, speed, or artifact quality.
- **Assurance:** add targeted verification or independent review for consequential, public, financial, sensitive, or difficult-to-reverse outputs.

Do not spawn agents merely because roles are available. Delegation has to provide a concrete benefit.

Read [modes.md](references/modes.md) when the correct mode is unclear.

## Protect the user's usage

Treat available context and agent turns as a budget.

- Load only the sources required for the current outcome.
- Do not send full project history to a specialist when a scoped brief is sufficient.
- Prefer Luna for bounded execution and Terra for everyday judgment.
- Escalate to Sol only after a concrete trigger, not as ceremony.
- Do not repeat searches, reviews, or tests after the acceptance criteria pass unless new evidence or a defect justifies another pass.
- If two approaches are similarly reliable, choose the one with fewer handoffs and less duplicated context.

The goal is to reduce avoidable usage, not to claim a guaranteed token saving.

## Preserve root ownership

The root owns:

1. the user's actual outcome and audience
2. scope, assumptions, and authority boundaries
3. mode and role selection
4. decisions that affect the overall direction
5. synthesis and conflict resolution
6. final artifact quality and verification
7. the user-facing result

Subagents return evidence or bounded artifacts. They do not redefine the goal.

## Select roles by work, not ceremony

- **researcher:** current facts, source retrieval, evidence extraction, and provenance
- **analyst:** comparisons, calculations, scenarios, and judgment-heavy synthesis
- **maker:** a bounded document, table, slide outline, content draft, or other artifact
- **verifier:** requirements, citations, calculations, formulas, completeness, and internal consistency
- **reviewer:** independent challenge of material reasoning, risk, or omissions

Use the active profile's model assignments. Escalate only after a concrete signal such as unresolved ambiguity, conflicting evidence, repeated verification failure, or material consequence.

## Give every subagent a bounded contract

Include:

- Objective: one concrete outcome
- Scope: exact sources, files, artifact section, or question
- Context: only what is needed
- Constraints: what must remain unchanged and which actions are prohibited
- Deliverable: expected output and level of detail
- Acceptance criteria: how the parent will judge success

Use [delegation-contract.md](references/delegation-contract.md) when preparing a complex assignment.

## Parallelism

Run tasks in parallel only when they do not depend on each other's conclusions and do not edit the same artifact surface. Prefer one writer for each file or artifact section.

Keep concurrent subagents at or below the profile limit. Most Team-mode tasks need one or two specialists, not a full roster.

## Research integrity

- Prefer primary and authoritative sources when current facts matter.
- Distinguish sourced facts, calculations, inferences, and open questions.
- Preserve links or precise source references needed for review.
- Do not turn weak or conflicting evidence into certainty.
- Never invent metrics, quotes, customers, testimonials, or personal experiences.

## Artifact verification

Verify the deliverable according to its actual type. Read [artifact-verification.md](references/artifact-verification.md) before validating a spreadsheet, presentation, formal document, research report, decision memo, or public content package.

Use a Sol reviewer only when an independent reasoning pass is materially useful. Skip review for routine, reversible work that already has sufficient verification.

## Authority boundary

Preparation does not authorize external action. Unless the user specifically authorized the concrete action, stop before:

- publishing or sending material
- contacting another person or organization
- spending money or accepting a commitment
- changing permissions, credentials, integrations, or services
- sharing private, confidential, or proprietary information
- deleting, overwriting, or making valuable material difficult to recover

Complete all safe, reviewable preparation before asking for additional authority.

## Completion

Before finishing:

1. integrate relevant subagent results
2. resolve material conflicts
3. verify the artifact against the request
4. state what was verified and what could not be verified
5. confirm no required subagent is still running
6. present the result, not orchestration theater
