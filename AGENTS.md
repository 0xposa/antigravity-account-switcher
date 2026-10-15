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
- **DILARANG MENGGUNAKAN TOOL `ask_question`**. Tampilkan antarmuka native text CLI secara langsung sesuai format di skill `antigravity-switcher`.
- **`/model-switcher`** (atau `/model-rotation`, `/antigravity-switcher`):
  Ambil status real-time dengan `agy-switcher --status-json`, lalu tampilkan layout pilihan model (dengan nomor urut, status keikutsertaan [✅ ON]/[⛔ OFF], dan indikator slider effort) serta status akun aktif secara langsung. Tangani perintah navigasi `up`/`down` (pindah model), `left`/`right` (ubah effort), `toggle <nomor>` (ikut serta rotasi), dan pilihan model langsung.
- **`/account-switcher`** (atau `/switch-account`):
  Ambil daftar akun dengan `agy-switcher --list-json` lalu tampilkan daftar akun dengan nomor urut (1, 2, 3...) secara langsung sesuai format skill. Saat user memilih (mengetik nomor akun atau email), jalankan `agy-switcher --switch "<nomor_atau_email>"`.

## 3. Termux Management
- Pengelolaan akun di luar Antigravity (menambah akun baru atau menghapus akun) dilakukan melalui CLI Termux:
  ```bash
  agy-switcher
  ```
