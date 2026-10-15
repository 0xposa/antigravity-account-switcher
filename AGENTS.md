# Antigravity Workspace Guidelines & Auto-Rotation Rules

## 1. Automatic Account Rotation on Quota Limit / Rate Limit (HTTP 429)
- **Zero Interruption Policy**: Saat model yang sedang digunakan terkena batas limit (Rate limit reached, Quota exceeded, ResourceExhausted, HTTP 429):
  1. AI harus **otomatis** menjalankan perintah background:
     ```bash
     agy-switcher --rotate
     ```
  2. Laporkan secara singkat ke user email akun baru yang aktif:
     > 🔄 *Quota limit reached. Auto-rotated to account: `<new_email>`. Resuming task...*
  3. Langsung lanjutkan tugas atau panggilan tools yang tertunda tanpa meminta user mengganti akun secara manual.

## 2. Slash Commands Handling (`/account-switcher`, `/switch-account`, `/antigravity-switcher`)
- **GUNAKAN TOOL `ask_question`**. Tampilkan dialog modal interaktif agar user bisa langsung memilih akun yang akan diaktifkan dari daftar akun tersimpan.
- Ambil daftar akun real-time dengan `agy-switcher --list-json`, lalu panggil `ask_question` dengan daftar email akun (berikan tanda ` (Aktif)` pada akun yang sedang aktif).
- Jalankan `agy-switcher --switch "<email_terpilih>"` setelah user memilih.

## 3. Termux Management
- Pengelolaan akun di luar Antigravity (menambah akun baru atau menghapus akun) dilakukan melalui CLI Termux:
  ```bash
  agy-switcher
  ```
