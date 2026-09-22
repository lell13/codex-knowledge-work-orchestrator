# Model selection

These profiles target the GPT-6 Astra, Sol, and Luna lineup. The rule is to meet a quality target first, then use the lightest model and reasoning setting that reliably meets it. This is a routing hypothesis to test, not a promise of token savings.

| Model | Best fit here | Typical starting effort |
| --- | --- | --- |
| GPT-6 Luna | Focused retrieval, extraction, formatting, bounded production, and checklist verification | low for checks; medium for clear briefs |
| GPT-6 Sol | Everyday root coordination, writing, analysis, synthesis, and integration | medium |
| GPT-6 Astra | Hard cross-source synthesis, ambiguous or consequential decisions, and independent challenge when the benefit is material | medium |

The recommended `plus-efficient` profile uses Sol as the root, Luna for bounded specialists, and Astra as a conditional reviewer. The `plus-economy` profile uses a Luna root with conditional Sol escalation. The `plus-quality` profile uses Astra as the root for unusually demanding work.

## Route before delegating

1. Use **Direct** for a coherent request the root can finish and verify.
2. Use **Team** only when an independent, bounded workstream improves speed, evidence, or quality.
3. Use **Assurance** when a targeted verifier or independent reviewer would catch a material failure.
4. Escalate model or effort only after a concrete signal: conflicting evidence, unresolved ambiguity, failed verification, or meaningful consequence.

An analyst on the same model as the root is useful only when a separate evidence or calculation pass is genuinely independent. Agent count is not a quality metric; each delegation adds context and a handoff.

## ChatGPT Plus and availability

OpenAI's [Codex model selection guide](https://developers.openai.com/api/docs/guides/model-selection) presents Luna, Sol, and Astra as the current three-tier choice. Its [pricing and usage page](https://learn.chatgpt.com/docs/pricing) lists GPT-6 Sol and Luna in Plus and includes estimated GPT-6 Astra usage in its Plus table. That page also retains credit-rate entries for GPT-5.6 Terra; the presence of a legacy rate does not mean Terra should remain in this repository's active profiles.

Published message ranges are estimates, not fixed quotas. Availability can differ by account, surface, rollout, and time. Check the model selector and usage dashboard before installing a profile. An API price is separate from the included ChatGPT Plus allowance.
