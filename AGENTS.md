# Antigravity Workspace Guidelines & Auto-Rotation Rules

## 1. Automatic Account Rotation on Quota Limit / Rate Limit (HTTP 429)
- **Zero Interruption Policy**: Saat model yang sedang digunakan terkena batas limit (Rate limit reached, Quota exceeded, ResourceExhausted, HTTP 429):
  1. AI harus **otomatis** menjalankan perintah background:
     ```bash
     agy-switcher --rotate
     ```
  2. Laporkan secara singkat ke user email akun baru yang aktif.
  3. Langsung lanjutkan tugas atau panggilan tools yang tertunda tanpa meminta user mengganti akun secara manual.

## 2. Slash Commands Handling
- **`/model-switcher`** (atau `/model-rotasi`):
  Tampilkan interaktif modal pilihan model menggunakan tool `ask_question`. Update model di `~/.gemini/antigravity-cli/settings.json` saat dipilih.
- **`/account-switcher`**:
  Ambil daftar akun dengan `agy-switcher --list-json` lalu tampilkan interaktif modal pilihan akun menggunakan tool `ask_question`. Jalankan `agy-switcher --switch "<pilihan>"` setelah user memilih.

## 3. Termux Management
- Pengelolaan akun di luar Antigravity (menambah akun baru atau menghapus akun) dilakukan melalui CLI Termux:
  ```bash
  agy-switcher
  ```
