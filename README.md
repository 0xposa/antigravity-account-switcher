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
Menampilkan status akun rotasi dan daftar model yang tersedia:
```text
Chose model rotation 

account active (3 accounts installed, 2 enabled for auto-rotation)

user1@gmail.com = ✅ on
user2@gmail.com = ⛔ off
user3@gmail.com = ✅ on

  Search:
          ────────────────────

> Gemini 3.8 Flash             (current)
  Claude Sonnet 4.6 (Thinking)
  Claude Opus 4.6 (Thinking)
  GPT-OSS 120B (Medium)
  Gemini 4 Argon

  Effort  ◂        ●━━━━━━━━━━━━━━◉──────────────○        ▸
                        low                 medium                       high
```

- **Rotasi Otomatis (Zero Interruption)**:
  Jika model terkena `HTTP 429` (Rate limit / Quota exceeded / ResourceExhausted), asisten AI akan **otomatis menjalankan `agy-switcher --rotate` di latar belakang**, beralih ke akun cadangan berikutnya yang bertanda `✅ on`, lalu melanjutkan tugas Anda tanpa jeda!

#### 🔹 `/account-switcher`
Menampilkan daftar akun tersimpan untuk berpindah akun secara instan:
```text
chose account 

> user1@gmail.com (current)
  user2@gmail.com
  user3@gmail.com
```

Cukup ketikkan nomor atau email akun yang diinginkan untuk langsung mengaktifkannya.

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

  Search:
          ────────────────────

> Gemini 3.8 Flash             (current)
  Claude Sonnet 4.6 (Thinking)
  Claude Opus 4.6 (Thinking)
  GPT-OSS 120B (Medium)
  Gemini 4 Argon

  Effort  ◂        ●━━━━━━━━━━━━━━◉──────────────○        ▸
                        low                 medium                       high
```

- **Zero-Interruption Auto-Rotation**:
  When a model triggers `HTTP 429` (Quota exceeded / Rate limit), Antigravity executes `agy-switcher --rotate` in the background, rotating credentials strictly across accounts marked `✅ on`, and resumes work instantly without manual action.

#### 🔹 `/account-switcher`
Display registered accounts and switch active sessions on the fly:
```text
chose account 

> user1@gmail.com (current)
  user2@gmail.com
  user3@gmail.com
```

Respond with your target account's index or email to switch.

---

## 👨‍💻 Author
Created & maintained by:
* **Twitter / X**: [@0xposa](https://x.com/0xposa)
* **GitHub**: [@0xposa](https://github.com/0xposa)

Don't forget to star ⭐ this repository if it helps your daily workflow!

---

## 📄 License
Released under the [MIT](LICENSE) License.
