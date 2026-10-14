# 🚀 Antigravity Account Switcher (`agy-switcher`)

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
Google Antigravity CLI (`agy`) hanya menyimpan satu sesi login aktif di `~/.gemini/antigravity-cli/antigravity-oauth-token`. Masalah yang sering dihadapi developer:
1. **Kuota Model Habis / Rate Limit (HTTP 429)**: Model unggulan seperti Claude Opus/Sonnet dan Gemini Pro memiliki batas kuota per akun. Saat limit tercapai, proses coding terhenti.
2. **Repot Ganti Akun**: Harus keluar, login ulang manual lewat browser, dan kehilangan alur sesi.

**Antigravity Account Switcher** menghadirkan manajemen akun terisolasi di Termux dan integrasi skill otonom di dalam Antigravity. Saat kuota habis, akun akan **otomatis berputar (*auto-rotate*) ke akun berikutnya** dan melanjutkan tugas tanpa interupsi!

---

## ✨ Fitur Utama
- 📱 **Menu Interaktif Termux (`agy-switcher`)**: UI CLI layar bersih dengan sambutan dan pilihan bahasa (Indonesia & English).
- ➕ **Tambah Akun Tanpa Logout**: Menambah akun baru tanpa menghapus atau mengeluarkan akun yang sedang aktif.
- 🗑️ **Hapus Akun**: Kelola dan bersihkan akun yang sudah tidak dipakai dengan mudah.
- 📋 **Daftar Akun Akurat**: Menampilkan akun yang tersimpan beserta tanda `[AKTIF]` yang akurat dan sinkronisasi otomatis token.
- 🤖 **Skill `/model-switcher` di Antigravity**: Memilih model AI sekaligus mengaktifkan proteksi rotasi otomatis saat terkena batas kuota/limit (HTTP 429).
- 🔄 **Skill `/account-switcher` di Antigravity**: Dialog interaktif untuk memilih dan berpindah akun langsung dari dalam chat.

---

## 📦 Cara Instalasi

### Menggunakan Git Clone
```bash
git clone https://github.com/0xposa/antigravity-account-switcher.git
cd antigravity-account-switcher
bash install.sh
```

---

## 🛠️ Panduan Penggunaan

### 1. Di Terminal Termux (`agy-switcher`)
Jalankan perintah berikut di terminal:
```bash
agy-switcher
```
Anda akan disambut dengan pilihan bahasa:
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

Pilih Bahasa / Select Language:
 1. Bahasa Indonesia
 2. English
─────────────────────────────────────────────
(Tekan Ctrl+C untuk keluar / Press Ctrl+C to exit)
─────────────────────────────────────────────
Pilih [1/2] (default: 1):
```

Setelah memilih bahasa, menu utama akan tampil:
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

* **1. Tambah Akun**: Menyiapkan login akun Google baru. Token akun lama Anda diamankan otomatis, lalu browser dibuka untuk login akun baru.
* **2. Hapus Akun**: Memilih nomor atau email akun yang ingin dihapus dari daftar.
* **3. Daftar Akun**: Melihat semua akun yang tersimpan, masa kedaluwarsa, dan siapa akun yang sedang `[AKTIF]`.

---

### 2. Di Dalam Antigravity (Menggunakan Slash Command `/`)

Pengelolaan model dan perpindahan akun saat coding dilakukan sepenuhnya di dalam Antigravity:

#### 🔹 `/model-switcher` (atau `/model-rotasi`)
Gunakan perintah ini di chat Antigravity:
```text
/model-switcher
```
1. Akan muncul pilihan model AI (Gemini 3.8 Flash, Gemini 3.8 Pro, Claude 3.7 Sonnet, Claude 3.5 Sonnet, Claude 3.5 Haiku).
2. Setelah model dipilih, **Proteksi Auto-Rotate Limit langsung aktif**:
   * Jika sewaktu-waktu model terkena rate limit / kuota habis (`HTTP 429` / `ResourceExhausted`), AI akan **langsung otomatis menjalankan rotasi akun ke akun berikutnya** dan melanjutkan tugas tanpa meminta Anda mengganti akun secara manual!

#### 🔹 `/account-switcher`
Gunakan perintah ini untuk berpindah akun secara manual lewat chat:
```text
/account-switcher
```
Antigravity akan menampilkan daftar akun yang tersimpan. Cukup pilih nomor atau akun yang diinginkan untuk langsung mengaktifkannya.

---
---

# 🇬🇧 English

## 💡 Background & Overview
By default, the Google Antigravity CLI (`agy`) only stores a single active session in `~/.gemini/antigravity-cli/antigravity-oauth-token`. Common hurdles faced by developers:
1. **Quota Limits & Rate Limits (HTTP 429)**: High-tier reasoning models like Claude Opus/Sonnet and Gemini Pro have per-account quotas. When limits are reached, your workflow stops.
2. **Tedious Manual Switching**: Requiring manual logout and browser re-authentication, losing coding context.

**Antigravity Account Switcher** solves this by providing isolated account storage in Termux and autonomous skill integration inside Antigravity. When quota runs out, it **automatically rotates to the next account** and resumes your coding task seamlessly!

---

## ✨ Key Features
- 📱 **Interactive Termux Menu (`agy-switcher`)**: Clean CLI menu with welcome greeting and language selection (Indonesian & English).
- ➕ **Add Accounts Safely**: Add new accounts without logging out of your current session.
- 🗑️ **Remove Accounts**: Clean up old or unused accounts from your pool.
- 📋 **Accurate Account Listing**: Shows all stored accounts with accurate `[ACTIVE]` indicators and automatic token refresh syncing.
- 🤖 **`/model-switcher` Skill inside Antigravity**: Choose AI models and activate zero-interruption quota auto-failover.
- 🔄 **`/account-switcher` Skill inside Antigravity**: Interactive modal to switch accounts right from the chat prompt.

---

## 📦 Installation

```bash
git clone https://github.com/0xposa/antigravity-account-switcher.git
cd antigravity-account-switcher
bash install.sh
```

---

## 🛠️ Usage Guide

### 1. In Termux Terminal (`agy-switcher`)
Launch the manager in Termux:
```bash
agy-switcher
```
Select your preferred language:
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

Pilih Bahasa / Select Language:
 1. Bahasa Indonesia
 2. English
─────────────────────────────────────────────
(Tekan Ctrl+C untuk keluar / Press Ctrl+C to exit)
─────────────────────────────────────────────
Select [1/2] (default: 1): 2
```

Navigate the Main Menu:
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

* **1. Add account**: Safeguards current credentials, launches `agy` for new Google login, and saves the new account into the pool.
* **2. Remove account**: Select an account number or email to remove from the pool.
* **3. List account**: Inspect all saved accounts, expiration times, and the currently active account.

---

### 2. Inside Antigravity (Using Slash Commands `/`)

Model selection and active account switching during development are managed inside Antigravity:

#### 🔹 `/model-switcher`
Type this command in the Antigravity chat:
```text
/model-switcher
```
1. Select your desired AI model (Gemini 3.8 Flash, Gemini 3.8 Pro, Claude 3.7 Sonnet, Claude 3.5 Sonnet, Claude 3.5 Haiku).
2. **Zero-Interruption Auto-Rotate is activated**:
   * If the chosen model hits rate limits or quota exhaustion (`HTTP 429` / `ResourceExhausted`), the AI will **automatically rotate credentials to the next Google account in the pool** and continue your task immediately without manual intervention!

#### 🔹 `/account-switcher`
Type this command to switch accounts on demand:
```text
/account-switcher
```
Antigravity will display an interactive list of all stored accounts. Pick your target account to switch immediately.

---

## 👨‍💻 Author
Created & maintained by:
* **Twitter / X**: [@0xposa](https://x.com/0xposa)
* **GitHub**: [@0xposa](https://github.com/0xposa)

Don't forget to star ⭐ this repository if it helps your daily coding workflow!

---

## 📄 License
Released under the [MIT](LICENSE) License.
