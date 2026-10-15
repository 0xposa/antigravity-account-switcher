---
name: antigravity-switcher
description: Native Antigravity Model & Account Switcher with Zero-Interruption Auto-Rotation. Handles /antigravity-switcher, /model-switcher, /model-rotation, /account-switcher, and /switch-account.
---

# Antigravity Switcher Skill

## MANDATORY AGENT BEHAVIOR:
- **GUNAKAN TOOL `ask_question`** untuk menampilkan dialog modal interaktif saat slash command dipanggil.
- **DO NOT** output conversational filler (e.g. "Sure!", "How can I help you?", "I am preparing options...").
- **DO NOT** hardcode fixed model lists or assume static accounts. Always read real accounts and active model dynamically using `agy-switcher --status-json` or `agy-switcher --list-json`.

## 1. WHEN /model-switcher, /model-rotation, OR MODEL SELECTION IS TRIGGERED:
1. Run `agy-switcher --status-json` in background to read current active model, effort, accounts list, and model rotation pool.
2. Call `ask_question` tool with:
   - Question 1: "Pilih model aktif yang ingin digunakan:"
     - `options`: List of available models (mark active with `(Aktif)`).
     - `is_multi_select`: `false`
   - Question 2: "Pilih tingkat Reasoning Effort:"
     - `options`: `["Low", "Medium", "High"]`
     - `is_multi_select`: `false`
   - Question 3: "Pilih model yang IKUT SERTA dalam rotasi kuota otomatis (Auto-Rotation Pool):"
     - `options`: List of model names.
     - `is_multi_select`: `true`
3. After user submits response:
   - Run `agy-switcher --set-model "<chosen_model>"`.
   - Run `agy-switcher --set-effort "<chosen_effort>"`.
   - Update model rotation toggles via `agy-switcher --toggle-model "<model>"`.
   - Confirm concisely with updated status.

## 2. WHEN /account-switcher, /switch-account, OR ACCOUNT SWITCHING IS TRIGGERED:
1. Run `agy-switcher --list-json` to retrieve current accounts.
2. Call `ask_question` tool with:
   - `question`: "Pilih akun Google Antigravity yang ingin Anda gunakan:"
   - `options`: List of account emails (mark active with `(Aktif)`).
   - `is_multi_select`: `false`
3. After user submits response:
   - Extract email from selection (strip ` (Aktif)`).
   - Run `agy-switcher --switch "<chosen_email>"`.
   - Confirm concisely: `Switched active account to: <chosen_email>`.

## ZERO-INTERRUPTION AUTO-ROTATION PROTOCOL (CRITICAL):
When an API error occurs on the active model (such as `HTTP 429`, `ResourceExhausted`, `Quota exceeded`, or `Rate limit reached`):
1. **Tier 1 (Rotasi Akun)**:
   Immediately run:
   ```bash
   agy-switcher --rotate
   ```
   (`agy-switcher` rotates to the next available account marked `✅ on`).
2. **Tier 2 (Rotasi Model - jika seluruh akun habis kuota)**:
   If all accounts are exhausted, rotate to the next enabled model in the model pool (`[✅ ON]`):
   ```bash
   agy-switcher --nav-model down
   ```
3. Briefly notify:
   > 🔄 *Quota limit reached. Auto-rotated to: `<new_target>`. Resuming task...*
4. Immediately retry and continue the interrupted task without stopping or asking the user to manually intervene.
