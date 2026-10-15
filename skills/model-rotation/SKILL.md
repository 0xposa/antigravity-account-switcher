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

## USER INTERACTION HANDLERS:
- **Navigasi Model Up / Down (`up`, `down`, `atas`, `bawah`, `↑`, `↓`)**:
  Run `agy-switcher --nav-model <up|down>` to move cursor to previous/next model, then immediately print the updated interface.
- **Navigasi Effort Left / Right (`left`, `right`, `kiri`, `kanan`, `←`, `→`)**:
  Run `agy-switcher --nav-effort <left|right>` to shift effort (low <-> medium <-> high), then immediately print the updated interface.
- **Toggle Keikutsertaan Model dalam Rotasi (`toggle <nomor/nama>`, `off <nomor/nama>`, `on <nomor/nama>`)**:
  Run `agy-switcher --toggle-model "<target>"`, then immediately print the updated interface.
- **Pilih Model Langsung (`1`, `2`, `3`, `Claude`, `Opus`, `Argon`, dll.)**:
  Run `agy-switcher --set-model "<target>"`, then immediately print the updated interface.
- **Toggle Akun dalam Rotasi (`toggle <email>`, `off <email>`, `on <email>`)**:
  Run `agy-switcher --toggle <email>`, then immediately print the updated interface.

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
