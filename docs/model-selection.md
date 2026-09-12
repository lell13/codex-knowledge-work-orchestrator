# Model selection

The profiles follow a simple rule: use the least expensive model that can reliably own the decision at hand.

## Roles in the current Codex lineup

| Model | Best fit in this project | Avoid using it for |
| --- | --- | --- |
| GPT-5.6 Luna | Fast, bounded execution: retrieval, extraction, drafting, and checklist verification | Owning ambiguous or consequential decisions by default |
| GPT-5.6 Terra | Everyday judgment: orchestration, analysis, synthesis, and artifact integration | Repeating high-volume mechanical work that Luna can handle |
| GPT-5.6 Sol | Hard reasoning and independent review when the consequence justifies escalation | Routine production or mandatory review of every task |

The recommended `plus-efficient` profile therefore uses Terra as the root, Luna for most specialists, and Sol as a conditional reviewer.

## Why not spawn every role?

Agent count is not a quality metric. Each delegation adds a handoff, consumes context, and creates another result the root must reconcile. A role should enter only when it improves speed, evidence, specialization, or assurance.

## ChatGPT Plus context

OpenAI currently lists Luna, Terra, and Sol as included with ChatGPT Plus. Published usage ranges are estimates, can vary by task, and should not be treated as guaranteed quotas. For current availability and limits, use the official [ChatGPT pricing and usage page](https://learn.chatgpt.com/docs/pricing).

Model capabilities and product limits can change. Profiles in this repository are versioned assumptions, not permanent claims about the platform.
