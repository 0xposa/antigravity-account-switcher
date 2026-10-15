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
2. Output the exact interface format below with 1-based numbering for each account:

```text
chose account 

  1. <email_1>
  2. <email_2>
> 3. <currently_active_email> (current)
  4. <email_4>
```
*(Indicator `>` and `(current)` marks the currently active account. Every account must have its 1-based number: `1.`, `2.`, `3.`, etc. matching the order in `agy-switcher --list-json`).*

## USER SELECTION HANDLER:
When user specifies which account to use by typing the account number (e.g. `1`, `2`, `3`) or email/partial email:
1. Extract the number or email target.
2. Run `agy-switcher --switch "<number_or_email>"`.
3. Confirm concisely: `Switched active account to: <chosen_account>`.
