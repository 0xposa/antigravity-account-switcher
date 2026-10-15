---
name: antigravity-switcher
description: Native Antigravity Multi-Account Switcher with Zero-Interruption Auto-Rotation on Limit (HTTP 429). Handles /antigravity-switcher, /account-switcher, and /switch-account.
---

# Antigravity Switcher Skill

## MANDATORY AGENT BEHAVIOR:
- **GUNAKAN TOOL `ask_question`** untuk menampilkan dialog modal interaktif saat slash command akun dipanggil.
- **DO NOT** output conversational filler (e.g. "Sure!", "How can I help you?", "I am preparing options...").
- Read real accounts dynamically using `agy-switcher --list-json`.

## 1. WHEN /account-switcher, /switch-account, OR /antigravity-switcher IS TRIGGERED:
1. Run `agy-switcher --list-json` in background to retrieve current accounts.
2. Call `ask_question` tool with:
   - `question`: "Pilih akun Google Antigravity yang ingin Anda gunakan:"
   - `options`: List of account emails (mark active with ` (Aktif)`).
   - `is_multi_select`: `false`
3. After user submits response:
   - Extract email from selection (strip ` (Aktif)` if present).
   - Run `agy-switcher --switch "<chosen_email>"`.
   - Confirm concisely: `Switched active account to: <chosen_email>`.

## 2. ZERO-INTERRUPTION AUTO-ROTATION PROTOCOL (CRITICAL):
When an API error occurs on the active model (such as `HTTP 429`, `ResourceExhausted`, `Quota exceeded`, or `Rate limit reached`):
1. AI must **automatically** run background command:
   ```bash
   agy-switcher --rotate
   ```
   (`agy-switcher` automatically selects the next available account marked `✅ on`).
2. Briefly notify:
   > 🔄 *Quota limit reached. Auto-rotated to account: `<new_email>`. Resuming task...*
3. Immediately retry and continue the interrupted task without stopping or asking the user to manually intervene.
