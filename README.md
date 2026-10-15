# 🚀 Antigravity Switcher (`agy-switcher`)

> **Solusi Multi-Akun & Rotasi Otomatis saat Limit untuk Google Antigravity CLI (`agy`)**  
> **Multi-Account Manager & Zero-Interruption Auto-Rotation for Google Antigravity CLI (`agy`)**  
> Dibuat oleh / Created by **[@0xposa](https://x.com/0xposa)** di X (Twitter).

[![Twitter Follow](https://img.shields.io/twitter/follow/0xposa?style=social)](https://x.com/0xposa)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Termux%20%7C%20Linux-green.svg)]()

---

## 🌐 Pilih Bahasa / Select Language
- 🇮🇩 [Bahasa Indonesia](#-bahasa-indonesia)
- 🇬🇧 [English](#-english)

---

# 🇮🇩 Bahasa Indonesia

## 💡 Latar Belakang & Masalah
Google Antigravity CLI (`agy`) secara bawaan hanya menyimpan satu sesi login aktif di `~/.gemini/antigravity-cli/antigravity-oauth-token`. Masalah umum yang sering dialami pengguna:
1. **Batas Kuota / Rate Limit (HTTP 429)**: Model-model unggulan seperti Claude Opus/Sonnet dan Gemini memiliki batas kuota harian per akun Google. Saat batas habis, alur kerja coding langsung terhenti.
2. **Repot Ganti Akun**: Harus login ulang manual melalui browser, mengetik perintah berulang, dan kehilangan konteks sesi chat.

**Antigravity Switcher** menyelesaikan masalah ini dengan manajemen multi-akun aman di Termux dan integrasi skill otonom langsung di dalam Antigravity. Saat kuota akun aktif habis, sistem akan **secara otomatis merotasi akun ke akun cadangan yang aktif (`✅ on`) dan melanjutkan tugas tanpa jeda!**

---

## ✨ Fitur Utama
- 📱 **Menu Termux Interaktif (`agy-switcher`)**: Tampilan TUI terminal bersih, banner ASCII keren, tanpa emoji berlebih di menu, serta dukungan dwibahasa (Indonesia & English).
- 🧭 **Navigasi Intuitif**: Opsi kembali (`0`) di semua submenu dan opsi keluar langsung (`3`) pada menu pemilihan bahasa awal.
- ➕ **Tambah Akun Tanpa Gangguan**: Tambahkan akun Google baru tanpa mengeluarkan akun yang sedang aktif.
- 🗑️ **Hapus Akun**: Bersihkan akun yang sudah tidak diperlukan dengan mudah.
- 📋 **Daftar Akun Akurat**: Menampilkan daftar akun, status aktif real-time, dan status auto-rotasi (`✅ on` / `⛔ off`).
- ⚡ **Auto-Rotation Fleksibel**: Anda dapat menentukan akun mana yang berpartisipasi dalam rotasi otomatis (`✅ on`) dan akun mana yang dikecualikan (`⛔ off`).
- 🤖 **Skill Antigravity Native (`/account-switcher`, `/antigravity-switcher`)**: Tampilan dialog interaktif `ask_question` untuk berganti akun secara instan.

---

## 📦 Cara Instalasi

Pilih salah satu cara instalasi di bawah ini (Termux / Linux):

### Cara 1: Instal Cepat via One-Line Script (cURL)
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/0xposa/antigravity-switcher/main/install.sh)"
```

### Cara 2: Menggunakan Git Clone
```bash
git clone https://github.com/0xposa/antigravity-switcher.git
cd antigravity-switcher
bash install.sh
```

---

## 🛠️ Panduan Penggunaan

### 1. Di Terminal Termux (`agy-switcher`)
Jalankan perintah berikut:
```bash
agy-switcher
```

Menu awal pemilihan bahasa:
```text
Pilih Bahasa / Select Language:
 1. Bahasa Indonesia
 2. English
 3. Keluar / Exit
─────────────────────────────────────────────
(Tekan Ctrl+C untuk keluar / Press Ctrl+C to exit)
─────────────────────────────────────────────
Pilih [1/2/3] (default: 1, 3 untuk keluar / 3 to exit): 
```

Setelah memilih bahasa, Menu Utama akan tampil:
```text
 █████╗  ██████╗ ██╗   ██╗
██╔══██╗██╔════╝ ╚██╗ ██╔╝
███████║██║  ███╗ ╚████╔╝ 
██╔══██║██║   ██║  ╚██╔╝  
██║  ██║╚██████╔╝   ██║   
╚═╝  ╚═╝ ╚═════╝    ╚═╝   
███████╗██╗    ██╗██╗████████╗ ██████╗██╗  ██╗███████╗██████╗ 
██╔════╝██║    ██║██║╚══██╔══╝██╔════╝██║  ██║██╔════╝██╔══██╗
███████╗██║ █╗ ██║██║   ██║   ██║     ███████║█████╗  ██████╔╝
╚════██║██║███╗██║██║   ██║   ██║     ██╔══██║██╔══╝  ██╔══██╗
███████║╚███╔███╔╝██║   ██║   ╚██████╗██║  ██║███████╗██║  ██║
╚══════╝ ╚══╝╚══╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
                    Twitter: @0xposa

                  MENU UTAMA
─────────────────────────────────────────────
 1. Tambah Akun (Add account)
 2. Hapus Akun (Remove account)
 3. Daftar Akun (List account)
 4. Kelola Auto-Rotation Pool (Toggle On/Off)
 5. Keluar (Exit)
─────────────────────────────────────────────
 Tekan Ctrl+C untuk keluar kapan saja
─────────────────────────────────────────────
Pilih menu [1-5]:
```

* **1. Tambah Akun**: Mengamankan token aktif saat ini, membuka browser untuk login akun Google baru, dan menyimpannya ke pool akun (tersedia opsi `0` untuk kembali).
* **2. Hapus Akun**: Memilih akun yang ingin dihapus dari daftar penyimpanan (tersedia opsi `0` untuk kembali).
* **3. Daftar Akun**: Melihat semua akun yang tersimpan beserta tanda `[AKTIF]` dan status auto-rotasinya (tekan `Enter` atau `0` untuk kembali).
* **4. Kelola Auto-Rotation Pool**: Mengaktifkan (`✅ on`) atau menonaktifkan (`⛔ off`) akun dalam rotasi otomatis (ketik nomor akun untuk toggle, `0` untuk kembali).
* **5. Keluar**: Menutup aplikasi. (Setiap submenu juga dilengkapi opsi `0` untuk kembali ke menu utama kapan saja).

---

### 2. Di Dalam Antigravity CLI (Slash Commands)

Gunakan slash commands berikut langsung di dalam sesi prompt Antigravity:

#### 🔹 `/account-switcher` atau `/antigravity-switcher`
Membuka dialog modal interaktif (`ask_question`) untuk memilih dan mengaktifkan akun Google secara instan.

- **Rotasi Otomatis (Zero Interruption)**:
  Jika akun aktif terkena limit `HTTP 429` (Rate limit / Quota exceeded / ResourceExhausted), asisten AI akan **otomatis menjalankan `agy-switcher --rotate` di latar belakang**, beralih ke akun cadangan berikutnya yang bertanda `✅ on`, lalu langsung melanjutkan kodingan Anda tanpa jeda!
  > 💡 **Kualitas Model Tetap Terjaga**: Model unggulan yang sedang Anda gunakan (misalnya **Claude Opus**) **TIDAK akan diturunkan/berubah**, karena akun cadangan Anda memiliki kuota harian Claude Opus yang masih segar!

> **Catatan Pemilihan Model**: Untuk mengganti model AI (Gemini, Claude, GPT), gunakan perintah bawaan resmi Antigravity: **`/model`**.

---
---

# 🇬🇧 English

## 💡 Background & Overview
Google Antigravity CLI (`agy`) natively only retains a single active login session in `~/.gemini/antigravity-cli/antigravity-oauth-token`. Developers frequently encounter two friction points:
1. **Quota Limits & Rate Limits (HTTP 429)**: Premier reasoning models (such as Claude Opus/Sonnet and Gemini) have per-account daily quotas. When limits are exceeded, development freezes.
2. **Tedious Re-authentication**: Manually logging out, opening browser prompts, and resetting sessions disrupts the developer flow.

**Antigravity Switcher** bridges this gap by offering isolated multi-account vault storage in Termux paired with autonomous agent skills inside Antigravity. When a quota exhaustion event occurs, credentials are **automatically rotated to the next available account marked `✅ on`, resuming tasks seamlessly with zero interruptions!**

---

## ✨ Key Features
- 📱 **Interactive Termux TUI (`agy-switcher`)**: Single-screen, clean terminal UI with ASCII header, bilingual prompts, and no emoji clutter in menu items.
- 🧭 **Intuitive Navigation**: Seamless return option (`0`) across all submenus and quick exit (`3`) in the initial language selector.
- ➕ **Seamless Account Addition**: Add additional Google accounts without disturbing your active session credentials.
- 🗑️ **Account Deletion**: Easily prune inactive or decommissioned accounts.
- 📋 **Live Account Listing**: Inspect account pools with real-time `[ACTIVE]` indicators and auto-rotation statuses (`✅ on` / `⛔ off`).
- ⚡ **Granular Auto-Rotation Pool**: Configure which accounts are active for failover (`✅ on`) and which are kept standby/manual (`⛔ off`).
- 🤖 **Native Antigravity Skills (`/account-switcher`, `/antigravity-switcher`)**: Interactive `ask_question` modal dialog to switch active accounts on the fly.

---

## 📦 Installation
 
Choose one of the installation methods below (Termux / Linux):

### Option 1: Quick Install via One-Liner Script (cURL)
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/0xposa/antigravity-switcher/main/install.sh)"
```

### Option 2: Using Git Clone
```bash
git clone https://github.com/0xposa/antigravity-switcher.git
cd antigravity-switcher
bash install.sh
```

---

## 🛠️ Usage Guide

### 1. In Termux Terminal (`agy-switcher`)
Execute:
```bash
agy-switcher
```

Initial language selection menu:
```text
Pilih Bahasa / Select Language:
 1. Bahasa Indonesia
 2. English
 3. Keluar / Exit
─────────────────────────────────────────────
(Tekan Ctrl+C untuk keluar / Press Ctrl+C to exit)
─────────────────────────────────────────────
Pilih [1/2/3] (default: 1, 3 untuk keluar / 3 to exit): 
```

After choosing your language, the Main Menu appears:
```text
 █████╗  ██████╗ ██╗   ██╗
██╔══██╗██╔════╝ ╚██╗ ██╔╝
███████║██║  ███╗ ╚████╔╝ 
██╔══██║██║   ██║  ╚██╔╝  
██║  ██║╚██████╔╝   ██║   
╚═╝  ╚═╝ ╚═════╝    ╚═╝   
███████╗██╗    ██╗██╗████████╗ ██████╗██╗  ██╗███████╗██████╗ 
██╔════╝██║    ██║██║╚══██╔══╝██╔════╝██║  ██║██╔════╝██╔══██╗
███████╗██║ █╗ ██║██║   ██║   ██║     ███████║█████╗  ██████╔╝
╚════██║██║███╗██║██║   ██║   ██║     ██╔══██║██╔══╝  ██╔══██╗
███████║╚███╔███╔╝██║   ██║   ╚██████╗██║  ██║███████╗██║  ██║
╚══════╝ ╚══╝╚══╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
                    Twitter: @0xposa

                  MAIN MENU
─────────────────────────────────────────────
 1. Add account
 2. Remove account
 3. List account
 4. Manage Auto-Rotation Pool (Toggle On/Off)
 5. Exit
─────────────────────────────────────────────
 Press Ctrl+C to exit anytime
─────────────────────────────────────────────
Select option [1-5]:
```

* **1. Add account**: Secure current token, launch browser for authentication, and store credentials (option `0` to return).
* **2. Remove account**: Select an account to delete from storage (option `0` to return).
* **3. List account**: Inspect all saved accounts, `[ACTIVE]` indicator, and auto-rotation states (press `Enter` or `0` to return).
* **4. Manage Auto-Rotation Pool**: Toggle failover inclusion (`✅ on` / `⛔ off`) per account (type number to toggle, `0` to return).
* **5. Exit**: Close the application. (All submenus also feature a dedicated `0` option to return to the main menu immediately).

---

### 2. Inside Antigravity CLI (Slash Commands)

#### 🔹 `/account-switcher` or `/antigravity-switcher`
Triggers an interactive `ask_question` modal dialog to select and activate your Google accounts on the fly.

- **Zero-Interruption Auto-Rotation**:
  When your active account hits `HTTP 429` (Quota exceeded / Rate limit), Antigravity executes `agy-switcher --rotate` in the background, rotating credentials strictly across accounts marked `✅ on`, and resumes work instantly without manual action.
  > 💡 **No Quality Downgrade**: Your premier model (such as **Claude Opus**) **remains active**, powered by the fresh daily quota of your standby Google account!

> **Note on Model Switching**: To switch models (Gemini, Claude, GPT), use Antigravity's official built-in command: **`/model`**.

---

## 👨‍💻 Author
Created & maintained by:
* **Twitter / X**: [@0xposa](https://x.com/0xposa)
* **GitHub**: [@0xposa](https://github.com/0xposa)

Don't forget to star ⭐ this repository if it helps your daily workflow!

---

## 📄 License
Released under the [MIT](LICENSE) License.
