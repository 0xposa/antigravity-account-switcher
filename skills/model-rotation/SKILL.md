---
name: model-rotation
description: Native Antigravity Model & Auto-Rotation Switcher. Use when /model-rotation or /model-switcher is triggered.
---

# Model Rotation & Quota Auto-Failover Skill

## MANDATORY AGENT BEHAVIOR:
- **DO NOT** call the `ask_question` tool.
- **DO NOT** output conversational filler (e.g. "Sure!", "How can I help you?", "I am preparing options...").
- **DO NOT** hardcode fixed model lists or assume static accounts. Always read real accounts and active model dynamically using `agy-switcher --status-json`.

## EXECUTION WHEN /model-rotation OR /model-switcher IS TRIGGERED:
1. Run `agy-switcher --status-json` in background to read current active model, accounts list, and rotation ON/OFF flags.
2. Immediately print the exact native CLI interface below (rendered in clean text format):

```text
Chose model rotation 

account active (<total_accounts> accounts installed, <on_count> enabled for auto-rotation)

<email_1> = ✅ on
<email_2> = ⛔ off
<email_3> = ✅ on

  Search:
          ────────────────────

> <current_active_model>             (current)
  Claude Sonnet 4.6 (Thinking)
  Claude Opus 4.6 (Thinking)
  GPT-OSS 120B (Medium)
  Gemini 4 Argon

  Effort  ◂        ●━━━━━━━━━━━━━━◉──────────────○        ▸
                        low                 medium                       high
```

## USER INTERACTION HANDLERS:
- If user specifies a model name (e.g. `Claude Sonnet 4.6`, `Opus`, `Argon`), update `"model"` key in `~/.gemini/antigravity-cli/settings.json` immediately.
- If user requests to toggle an account (e.g. `toggle <email>`, `off <email>`, `on <email>`), run `agy-switcher --toggle <email>`.
- If user selects an effort level, update `effort` configuration accordingly.

## ZERO-INTERRUPTION AUTO-ROTATION PROTOCOL (CRITICAL):
When an API error occurs on the active model (such as `HTTP 429`, `ResourceExhausted`, `Quota exceeded`, or `Rate limit reached`):
1. Immediately run:
   ```bash
   agy-switcher --rotate
   ```
   (Note: `agy-switcher` will automatically select ONLY from accounts marked as `✅ on`. Accounts marked `⛔ off` are excluded from auto-rotation).
2. Briefly notify:
   > 🔄 *Quota limit reached. Auto-rotated to account: `<new_email>`. Resuming task...*
3. Immediately retry and continue the interrupted task without stopping or asking the user to manually intervene.
