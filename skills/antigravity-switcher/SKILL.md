---
name: antigravity-switcher
description: Mengaktifkan dan menonaktifkan fitur Zero-Interruption Auto-Rotation pada batas kuota (HTTP 429). Trigger dengan /antigravity-switcher.
---

# Antigravity Switcher Skill (Auto-Rotation Manager)

## MANDATORY AGENT BEHAVIOR:
- **GUNAKAN TOOL `ask_question`** untuk menampilkan dialog modal interaktif saat slash command `/antigravity-switcher` dipanggil.
- **DO NOT** output conversational filler (e.g. "Sure!", "How can I help you?", "I am preparing options...").
- Cek status auto-rotation saat ini dengan `agy-switcher --auto-rotate-status`.

## 1. WHEN /antigravity-switcher IS TRIGGERED:
1. Jalankan `agy-switcher --auto-rotate-status` di background untuk mengetahui status saat ini (`ENABLED` atau `DISABLED`).
2. Panggil tool `ask_question` dengan:
   - `question`: "Pilih status Zero-Interruption Auto-Rotation:"
   - `options`:
     - Jika status saat ini `ENABLED`:
       - `1. Aktifkan (Aktif)`
       - `2. Nonaktifkan`
     - Jika status saat ini `DISABLED`:
       - `1. Aktifkan`
       - `2. Nonaktifkan (Aktif)`
   - `is_multi_select`: `false`
3. Setelah user memilih respon:
   - Jika pilihan mengandung `Aktifkan` atau `1`:
     - Jalankan `agy-switcher --auto-rotate on`.
     - Konfirmasi secara singkat: `✅ Zero-Interruption Auto-Rotation berhasil diaktifkan.`
   - Jika pilihan mengandung `Nonaktifkan` atau `2`:
     - Jalankan `agy-switcher --auto-rotate off`.
     - Konfirmasi secara singkat: `⛔ Zero-Interruption Auto-Rotation berhasil dinonaktifkan.`

## 2. ZERO-INTERRUPTION AUTO-ROTATION PROTOCOL (CRITICAL):
Ketika terjadi error kuota/rate limit pada model yang aktif (`HTTP 429`, `ResourceExhausted`, `Quota exceeded`, atau `Rate limit reached`):
1. Periksa status auto-rotation di background:
   ```bash
   agy-switcher --auto-rotate-status
   ```
2. **Jika ENABLED**:
   - AI harus **otomatis** menjalankan background command:
     ```bash
     agy-switcher --rotate
     ```
   - Beritahu singkat:
     > 🔄 *Quota limit reached. Auto-rotated to account: `<new_email>`. Resuming task...*
   - Langsung lanjutkan tugas atau pemanggilan tool yang tertunda tanpa interupsi.
3. **Jika DISABLED**:
   - Jangan rotasi akun otomatis.
   - Laporkan ke user:
     > ⚠️ *Batas kuota/rate limit tercapai. Fitur Zero-Interruption Auto-Rotation sedang dinonaktifkan. Silakan gunakan `/switcher-account` untuk mengganti akun secara interaktif atau `/antigravity-switcher` untuk mengaktifkan auto-rotation kembali.*
