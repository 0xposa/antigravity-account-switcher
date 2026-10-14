---
name: switch-account
description: Native Antigravity Account Switcher. Use when /switch-account or /account-switcher is triggered.
---

# Account Switcher Skill

## MANDATORY AGENT BEHAVIOR:
- **DO NOT** call the `ask_question` tool.
- **DO NOT** output conversational filler.
- Read real accounts dynamically using `agy-switcher --list-json`.

## EXECUTION WHEN /switch-account OR /account-switcher IS TRIGGERED:
1. Run `agy-switcher --list-json` to retrieve the current accounts.
2. Output the exact interface format below:

```text
chose account 

> <currently_active_email> (current)
  <other_account_1>
  <other_account_2>
  <other_account_3>
```

## USER SELECTION HANDLER:
When user specifies which account to use (e.g. typing email or account number):
1. Run `agy-switcher --switch "<chosen_account>"`.
2. Confirm concisely: `Switched active account to: <chosen_account>`.
