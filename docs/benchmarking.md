# Benchmarking

The project does not claim that orchestration is automatically faster, cheaper, or better. Measure it.

## Minimum protocol

Choose at least three realistic tasks:

1. A small, clear artifact suitable for Direct mode.
2. A research-heavy task with independent source gathering.
3. A consequential task that benefits from verification.

Run each task at least twice with:

- Root only.
- `plus-efficient` adaptive routing.
- One alternative profile when relevant.

Record:

| Field | What to capture |
| --- | --- |
| Outcome quality | Blind rubric score and material errors |
| Human correction | Minutes and number of corrections |
| Wall time | Start to usable deliverable |
| Usage | Five-hour and weekly window delta when available |
| Delegation | Agents spawned and why |
| Verification value | Defects found that changed the result |

Keep prompts, source material, Codex version, profile, and acceptance criteria stable. Publish raw results or a reproducible summary. Treat a single run as an example, not a benchmark.
