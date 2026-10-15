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

## 2. Slash Commands Handling (`/antigravity-switcher`, `/model-switcher`, `/account-switcher`)
- **GUNAKAN TOOL `ask_question`**. Tampilkan dialog modal interaktif agar user bisa langsung memilih model, tingkat effort, keikutsertaan rotasi, atau akun aktif melalui antarmuka visual pilihan.
- **`/model-switcher`** (atau `/model-rotation`, `/antigravity-switcher`):
  Ambil status real-time dengan `agy-switcher --status-json`, lalu panggil `ask_question` untuk memilih model aktif, tingkat effort, dan model pool yang ikut serta dalam rotasi otomatis. Terapkan konfigurasi setelah user memilih.
- **`/account-switcher`** (atau `/switch-account`):
  Ambil daftar akun dengan `agy-switcher --list-json` lalu panggil `ask_question` untuk memilih akun yang akan diaktifkan. Jalankan `agy-switcher --switch "<email_terpilih>"` setelah user memilih.

## 3. Termux Management
- Pengelolaan akun di luar Antigravity (menambah akun baru atau menghapus akun) dilakukan melalui CLI Termux:
  ```bash
  agy-switcher
  ```
