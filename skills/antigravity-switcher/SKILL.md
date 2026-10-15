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
1. Run `agy-switcher --status-json` in background to read current active model, effort, accounts list, and model rotation pool.
2. Immediately print the exact native CLI interface below (rendered in clean text format):

```text
Chose model rotation 

account active (<total_accounts> accounts installed, <on_count> enabled for auto-rotation)

<email_1> = ✅ on
<email_2> = ⛔ off
<email_3> = ✅ on

Model Pool (Keikutsertaan Auto-Rotation & Pilihan Model):
  [↑/↓ Atas/Bawah]: Pilih model aktif
  [←/→ Kiri/Kanan]: Atur Effort Level (Low / Medium / High)
  [Toggle <nomor> / on/off <nomor>]: Ubah status ikut serta (✅ ON / ⛔ OFF)

> 1. [✅ ON]  <model_1_full_name>             (current)
  2. [✅ ON]  <model_2_full_name>
  3. [⛔ OFF] <model_3_full_name>
  4. [✅ ON]  <model_4_full_name>
  5. [✅ ON]  <model_5_full_name>

  Effort  ◂        <effort_bar>        ▸
                        low                 medium                       high
```
*(Effort bar: low = `◉━━━━━━━━━━━━━━○──────────────○`, medium = `○━━━━━━━━━━━━━━◉──────────────○`, high = `○━━━━━━━━━━━━━━○──────────────◉`).*

### Model Selection, Pool, & Navigation Handlers:
- **Navigasi Model Up / Down (`up`, `down`, `atas`, `bawah`, `↑`, `↓`)**: Run `agy-switcher --nav-model <up|down>` then reprint the updated interface.
- **Navigasi Effort Left / Right (`left`, `right`, `kiri`, `kanan`, `←`, `→`)**: Run `agy-switcher --nav-effort <left|right>` then reprint the updated interface.
- **Toggle Model Rotasi (`toggle <nomor/nama>`, `off <nomor/nama>`, `on <nomor/nama>`)**: Run `agy-switcher --toggle-model "<target>"` then reprint the updated interface.
- **Pilih Model Langsung (`1`, `2`, `Claude`, `Opus`, `Argon`, dll.)**: Run `agy-switcher --set-model "<target>"` then reprint the updated interface.
- **Toggle Akun (`toggle <email>`, `off <email>`, `on <email>`)**: Run `agy-switcher --toggle <email>` then reprint the updated interface.

## 2. WHEN /account-switcher, /switch-account, OR ACCOUNT SWITCHING IS TRIGGERED:
1. Run `agy-switcher --list-json` to retrieve current accounts.
2. Immediately print the exact native CLI interface below with 1-based numbering:

```text
chose account 

  1. <email_1>
  2. <email_2>
> 3. <currently_active_email> (current)
  4. <email_4>
```
*(Indicator `>` and `(current)` marks the currently active account. Every account must have its 1-based number: `1.`, `2.`, `3.`, etc. matching the order in `agy-switcher --list-json`).*

### Account Switch Handler:
When user specifies an account by typing the account number (e.g. `1`, `2`, `3`) or email/partial email:
1. Extract the number or email target.
2. Run `agy-switcher --switch "<number_or_email>"`.
3. Confirm concisely: `Switched active account to: <chosen_account>`.

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
