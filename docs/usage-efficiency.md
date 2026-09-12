# Usage efficiency

This project exists to help people get serious work from Codex without spending their available usage on unnecessary context, agents, or model escalation.

## What consumes usage

Prompts, files, conversation history, tool results, reasoning, and responses all contribute to usage. A multi-agent workflow can multiply that load because each specialist needs instructions and returns material that the root must read and integrate.

The orchestrator controls the parts it can influence:

1. Keep small tasks in Direct mode.
2. Load only sources relevant to the current outcome.
3. Give each specialist a narrow assignment instead of the full project history.
4. Prefer Luna for bounded, high-volume execution.
5. Use Terra when the work requires everyday judgment or integration.
6. Add Sol only when ambiguity, consequence, or an independent challenge justifies it.
7. Stop researching and verifying after the acceptance criteria pass.

These practices align with OpenAI's current guidance to control prompt size, limit source material, define the required output, keep `AGENTS.md` focused, limit unnecessary MCP servers, and use smaller models for routine tasks. See the official [ChatGPT pricing and usage guidance](https://learn.chatgpt.com/docs/pricing).

## What this project does not promise

It does not promise a fixed percentage of saved tokens, messages, credits, time, or money. Similar tasks can consume different amounts of usage depending on context, reasoning, tools, retrieval, caching, and whether the work runs locally or in the cloud.

Efficiency is therefore measured, not assumed. Use the [benchmarking protocol](benchmarking.md) to compare adaptive routing with a root-only run on your own tasks.

## A practical stop rule

The root should stop adding work when all four conditions are true:

- the requested deliverable exists
- the acceptance criteria pass
- material uncertainty is visible
- no unresolved defect would change the user's decision or ability to use the result

More review after that point is optional work and should require a concrete reason.
