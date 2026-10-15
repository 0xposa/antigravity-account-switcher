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
1. **Batas Kuota / Rate Limit (HTTP 429)**: Model-model unggulan seperti Claude Opus/Sonnet dan Gemini Pro memiliki batas kuota harian per akun Google. Saat batas habis, alur kerja coding langsung terhenti.
2. **Repot Ganti Akun**: Harus login ulang manual melalui browser, mengetik perintah berulang, dan kehilangan konteks sesi chat.

**Antigravity Switcher** menyelesaikan masalah ini dengan manajemen multi-akun aman di Termux dan integrasi skill otonom langsung di dalam Antigravity. Saat kuota akun aktif habis, sistem akan **secara otomatis merotasi akun ke akun cadangan yang aktif (`✅ on`) dan melanjutkan tugas tanpa jeda!**

---

## ✨ Fitur Utama
- 📱 **Menu Termux Interaktif (`agy-switcher`)**: Tampilan TUI terminal bersih, banner ASCII keren, tanpa emoji berlebih di menu, serta dukungan dwibahasa (Indonesia & English).
- ➕ **Tambah Akun Tanpa Gangguan**: Tambahkan akun Google baru tanpa mengeluarkan akun yang sedang aktif.
- 🗑️ **Hapus Akun**: Bersihkan akun yang sudah tidak diperlukan dengan mudah.
- 📋 **Daftar Akun Akurat**: Menampilkan daftar akun, status aktif real-time, dan status auto-rotasi (`✅ on` / `⛔ off`).
- ⚡ **Auto-Rotation Fleksibel**: Anda dapat menentukan akun mana yang berpartisipasi dalam rotasi otomatis (`✅ on`) dan akun mana yang dikecualikan (`⛔ off`).
- 🤖 **Skill Antigravity Native (`/antigravity-switcher`, `/model-switcher`, `/account-switcher`)**: Tampilan CLI native langsung di chat tanpa pop-up modal `ask_question`.

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

Menu utama akan tampil bersih:
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
 4. Keluar (Exit)
─────────────────────────────────────────────
 Tekan Ctrl+C untuk keluar kapan saja
─────────────────────────────────────────────
Pilih menu [1-4]:
```

* **1. Tambah Akun**: Mengamankan token aktif saat ini, membuka browser untuk login akun Google baru, dan menyimpannya ke pool akun.
* **2. Hapus Akun**: Memilih akun yang ingin dihapus dari daftar penyimpanan.
* **3. Daftar Akun**: Melihat semua akun yang tersimpan beserta tanda `[AKTIF]` dan status auto-rotasinya.

---

### 2. Di Dalam Antigravity CLI (Slash Commands)

Gunakan slash commands berikut langsung di dalam sesi prompt Antigravity:

#### 🔹 `/antigravity-switcher` atau `/model-switcher`
Menampilkan status akun rotasi, daftar model pool, dan kontrol navigasi:
```text
Chose model rotation 

account active (3 accounts installed, 2 enabled for auto-rotation)

user1@gmail.com = ✅ on
user2@gmail.com = ⛔ off
user3@gmail.com = ✅ on

Model Pool (Keikutsertaan Auto-Rotation & Pilihan Model):
  [↑/↓ Atas/Bawah]: Pilih model aktif
  [←/→ Kiri/Kanan]: Atur Effort Level (Low / Medium / High)
  [Toggle <nomor> / on/off <nomor>]: Ubah status ikut serta (✅ ON / ⛔ OFF)

> 1. [✅ ON]  Gemini 3.8 Flash (High)             (current)
  2. [✅ ON]  Claude Sonnet 4.6 (Thinking)
  3. [✅ ON]  Claude Opus 4.6 (Thinking)
  4. [⛔ OFF] GPT-OSS 120B (High)
  5. [✅ ON]  Gemini 4 Argon

  Effort  ◂        ○━━━━━━━━━━━━━━○──────────────◉        ▸
                        low                 medium                       high
```

- **Navigasi Interaktif**:
  - `up` / `down`: Berpindah kursor memilih model aktif.
  - `left` / `right`: Mengatur level effort (Low ◄ Medium ► High).
  - `toggle <nomor>`: Mengaktifkan/menonaktifkan model dari keikutsertaan rotasi (`[✅ ON]` / `[⛔ OFF]`).
  - Ketik nomor/nama model (misal `2` atau `Opus`) untuk langsung mengaktifkannya.
- **Rotasi Otomatis Bertingkat (Zero Interruption)**:
  Jika kuota model aktif habis (`HTTP 429`), asisten AI secara otomatis merotasi akun cadangan (`✅ on`). Jika seluruh akun habis, AI otomatis beralih ke model berikutnya yang berstatus `[✅ ON]`!

#### 🔹 `/account-switcher`
Menampilkan daftar akun tersimpan bernomor untuk berpindah akun secara instan:
```text
chose account 

  1. user1@gmail.com
> 2. user2@gmail.com (current)
  3. user3@gmail.com
```

Cukup ketikkan nomor akun (misal `1` atau `3`) atau alamat email untuk langsung mengaktifkannya.

---
---

# 🇬🇧 English

## 💡 Background & Overview
Google Antigravity CLI (`agy`) natively only retains a single active login session in `~/.gemini/antigravity-cli/antigravity-oauth-token`. Developers frequently encounter two friction points:
1. **Quota Limits & Rate Limits (HTTP 429)**: Premier reasoning models (such as Claude Opus/Sonnet and Gemini Pro) have per-account daily quotas. When limits are exceeded, development freezes.
2. **Tedious Re-authentication**: Manually logging out, opening browser prompts, and resetting sessions disrupts the developer flow.

**Antigravity Switcher** bridges this gap by offering isolated multi-account vault storage in Termux paired with autonomous agent skills inside Antigravity. When a quota exhaustion event occurs, credentials are **automatically rotated to the next available account marked `✅ on`, resuming tasks seamlessly with zero interruptions!**

---

## ✨ Key Features
- 📱 **Interactive Termux TUI (`agy-switcher`)**: Single-screen, clean terminal UI with ASCII header, bilingual prompts, and no emoji clutter in menu items.
- ➕ **Seamless Account Addition**: Add additional Google accounts without disturbing your active session credentials.
- 🗑️ **Account Deletion**: Easily prune inactive or decommissioned accounts.
- 📋 **Live Account Listing**: Inspect account pools with real-time `[ACTIVE]` indicators and auto-rotation statuses (`✅ on` / `⛔ off`).
- ⚡ **Granular Auto-Rotation Pool**: Configure which accounts are active for failover (`✅ on`) and which are kept standby/manual (`⛔ off`).
- 🤖 **Native Antigravity Skills (`/antigravity-switcher`, `/model-switcher`, `/account-switcher`)**: Renders native CLI layouts directly into the chat stream without GUI popups.

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

Select your language preference and access the main menu:
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
 4. Exit
─────────────────────────────────────────────
 Press Ctrl+C to exit anytime
─────────────────────────────────────────────
Select option [1-4]:
```

* **1. Add account**: Safeguards existing tokens, initializes Google OAuth flow via `agy`, and stores new tokens in the account directory.
* **2. Remove account**: Select and delete an account from the pool.
* **3. List account**: Review all registered accounts, token expiry, active session, and rotation status.

---

### 2. Inside Antigravity CLI (Slash Commands)

Use the integrated slash commands inside your Antigravity chat:

#### 🔹 `/antigravity-switcher` or `/model-switcher`
Inspect current rotation candidates and choose available AI models:
```text
Chose model rotation 

account active (3 accounts installed, 2 enabled for auto-rotation)

user1@gmail.com = ✅ on
user2@gmail.com = ⛔ off
user3@gmail.com = ✅ on

Model Pool (Auto-Rotation Participation & Model Selection):
  [↑/↓ Up/Down]: Select active model
  [←/→ Left/Right]: Set Effort Level (Low / Medium / High)
  [Toggle <num> / on/off <num>]: Toggle rotation participation (✅ ON / ⛔ OFF)

> 1. [✅ ON]  Gemini 3.8 Flash (High)             (current)
  2. [✅ ON]  Claude Sonnet 4.6 (Thinking)
  3. [✅ ON]  Claude Opus 4.6 (Thinking)
  4. [⛔ OFF] GPT-OSS 120B (High)
  5. [✅ ON]  Gemini 4 Argon

  Effort  ◂        ○━━━━━━━━━━━━━━○──────────────◉        ▸
                        low                 medium                       high
```

- **Interactive Controls**:
  - `up` / `down`: Shift active model selection up or down.
  - `left` / `right`: Adjust effort levels (Low ◄ Medium ► High).
  - `toggle <number>`: Toggle model participation in auto-rotation (`[✅ ON]` / `[⛔ OFF]`).
  - Respond with a model number or name (e.g. `2` or `Opus`) to activate immediately.
- **Two-Tier Zero-Interruption Auto-Rotation**:
  When a model triggers `HTTP 429` (Quota exceeded / Rate limit), Antigravity automatically executes `agy-switcher --rotate` across accounts marked `✅ on`. If all accounts are exhausted, it auto-fails over to the next enabled model marked `[✅ ON]`!

#### 🔹 `/account-switcher`
Display registered accounts with index numbers and switch active sessions on the fly:
```text
chose account 

  1. user1@gmail.com
> 2. user2@gmail.com (current)
  3. user3@gmail.com
```

Respond with your target account's number (e.g. `1` or `3`) or email to switch.

---

## 👨‍💻 Author
Created & maintained by:
* **Twitter / X**: [@0xposa](https://x.com/0xposa)
* **GitHub**: [@0xposa](https://github.com/0xposa)

Don't forget to star ⭐ this repository if it helps your daily workflow!

---

## 📄 License
Released under the [MIT](LICENSE) License.
