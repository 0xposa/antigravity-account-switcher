---
name: switcher-account
description: Native Antigravity Account Switcher. Mengganti akun Google Antigravity secara interaktif menggunakan dialog modal. Trigger dengan /switcher-account.
---

# Switcher Account Skill

## MANDATORY AGENT BEHAVIOR:
- **GUNAKAN TOOL `ask_question`** untuk menampilkan dialog modal interaktif saat command `/switcher-account` dipanggil.
- **DO NOT** output conversational filler (e.g. "Sure!", "How can I help you?", "I am preparing options...").
- Ambil daftar akun real-time secara dinamis menggunakan `agy-switcher --list-json`.

## EXECUTION WHEN /switcher-account IS TRIGGERED:
1. Jalankan `agy-switcher --list-json` di background untuk mengambil daftar akun saat ini.
2. Panggil tool `ask_question` dengan:
   - `question`: "Pilih akun Google Antigravity yang ingin Anda gunakan:"
   - `options`: Daftar email akun dari output JSON (tandai akun aktif dengan akhiran ` (Aktif)`).
   - `is_multi_select`: `false`
3. Setelah user memilih respon:
   - Ambil email dari pilihan yang dipilih (hapus string ` (Aktif)` jika ada).
   - Jalankan `agy-switcher --switch "<chosen_email>"`.
   - Konfirmasi secara singkat: `Switched active account to: <chosen_email>`.
