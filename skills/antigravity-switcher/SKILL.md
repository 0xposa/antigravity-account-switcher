---
name: antigravity-switcher
description: Native Antigravity Model & Account Switcher with Zero-Interruption Auto-Rotation. Handles /antigravity-switcher, /model-switcher, /model-rotation, /account-switcher, and /switch-account.
---

# Antigravity Switcher Skill

## MANDATORY AGENT BEHAVIOR:
- **DO NOT** call the `ask_question` tool.
- **DO NOT** output conversational filler (e.g. "Sure!", "How can I help you?", "I am preparing options...").
- **DO NOT** hardcode fixed model lists or assume static accounts. Always read real accounts and active model dynamically using `agy-switcher --status-json`.

## 1. WHEN /model-switcher, /model-rotation, OR MODEL SELECTION IS TRIGGERED:
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

### Model Selection & Pool Handlers:
- If user specifies a model name (e.g. `Claude Sonnet 4.6`, `Opus`, `Argon`), update `"model"` key in `~/.gemini/antigravity-cli/settings.json` immediately.
- If user requests to toggle an account (e.g. `toggle <email>`, `off <email>`, `on <email>`), run `agy-switcher --toggle <email>`.

## 2. WHEN /account-switcher, /switch-account, OR ACCOUNT SWITCHING IS TRIGGERED:
1. Run `agy-switcher --list-json` to retrieve current accounts.
2. Immediately print the exact native CLI interface below:

```text
chose account 

> <currently_active_email> (current)
  <other_account_1>
  <other_account_2>
  <other_account_3>
```

### Account Switch Handler:
When user specifies an account (e.g. typing email or account number):
1. Run `agy-switcher --switch "<chosen_account>"`.
2. Confirm concisely: `Switched active account to: <chosen_account>`.

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
