---
name: switch-account
description: Native Antigravity Account Switcher. Use when /switch-account or /account-switcher is triggered.
---

# Account Switcher Skill

## MANDATORY AGENT BEHAVIOR:
- **GUNAKAN TOOL `ask_question`** untuk menampilkan dialog pilihan akun interaktif.
- **DO NOT** output conversational filler.
- Read real accounts dynamically using `agy-switcher --list-json`.

## EXECUTION WHEN /switch-account OR /account-switcher IS TRIGGERED:
1. Run `agy-switcher --list-json` to retrieve the current accounts.
2. Call `ask_question` tool with:
   - `question`: "Pilih akun Google Antigravity yang ingin Anda gunakan:"
   - `options`: List of account emails (append ` (Aktif)` to the currently active email).
   - `is_multi_select`: `false`
3. After the user responds:
   - Extract the email from the chosen option (strip ` (Aktif)` if present).
   - Run `agy-switcher --switch "<chosen_email>"`.
   - Confirm concisely: `Switched active account to: <chosen_email>`.
