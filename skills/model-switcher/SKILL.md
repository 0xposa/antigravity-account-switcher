---
name: model-rotation
description: Native Antigravity Model & Auto-Rotation Switcher. Use when /model-rotation or /model-switcher is triggered.
---

# Model Rotation & Quota Auto-Failover Skill

## MANDATORY AGENT BEHAVIOR:
- **GUNAKAN TOOL `ask_question`** untuk menampilkan dialog pilihan model, effort, dan keikutsertaan rotasi interaktif.
- **DO NOT** output conversational filler.
- Read real status dynamically using `agy-switcher --status-json`.

## EXECUTION WHEN /model-rotation OR /model-switcher IS TRIGGERED:
1. Run `agy-switcher --status-json` in background to read current active model, effort, accounts list, and model rotation pool.
2. Call `ask_question` tool with interactive questions:
   - Question 1: "Pilih model aktif yang ingin digunakan:"
     - `options`: List of available models (e.g. "Gemini 3.8 Flash", "Claude Sonnet 4.6 (Thinking)", "Claude Opus 4.6 (Thinking)", "GPT-OSS 120B (Medium)", "Gemini 4 Argon"), marking the current model with `(Aktif)`.
     - `is_multi_select`: `false`
   - Question 2: "Pilih tingkat Reasoning Effort:"
     - `options`: `["Low", "Medium", "High"]`
     - `is_multi_select`: `false`
   - Question 3: "Pilih model yang IKUT SERTA dalam rotasi kuota otomatis (Auto-Rotation Pool):"
     - `options`: List of model names.
     - `is_multi_select`: `true`
3. After user submits choices:
   - Set active model via `agy-switcher --set-model "<chosen_model>"`.
   - Set effort level via `agy-switcher --set-effort "<chosen_effort>"`.
   - Adjust enabled rotation models via `agy-switcher --toggle-model "<model>"`.
   - Confirm concisely with updated status summary.

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
