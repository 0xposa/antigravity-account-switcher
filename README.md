# 🚀 Antigravity Account Switcher (`agy-account`)

> **Solusi Multi-Akun & Auto-Rotate Limit untuk Google Antigravity CLI (`agy`)**  
> Dibuat oleh **[@0xposa](https://x.com/0xposa)** di X (Twitter).

[![Twitter Follow](https://img.shields.io/twitter/follow/0xposa?style=social)](https://x.com/0xposa)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Termux%20%7C%20Linux-green.svg)]()

---

## 💡 Latar Belakang & Masalah

Google Antigravity CLI (`agy`) secara *default* hanya menyimpan satu sesi login aktif di `~/.gemini/antigravity-cli/antigravity-oauth-token`. Masalah umum yang sering dialami oleh para developer:
1. **Claude Opus / Sonnet Kena Limit**: Model reasoning tingkat tinggi seperti `claude-opus-4-6-thinking` dan `claude-sonnet-4-6` memiliki kuota per akun. Saat kuota habis, task coding Anda terhenti.
2. **Harus Logout & Login Ulang**: Untuk berganti akun, pengguna biasanya harus logout, kehilangan sesi, dan login ulang dari awal.

**Antigravity Account Switcher** memecahkan masalah ini dengan menyediakan pool akun terisolasi, manajemen akun instan, dan auto-runner yang **otomatis merotasi akun saat limit lalu melanjutkan task (`agy --continue`) tanpa kehilangan konteks coding sedikit pun!**

---

## ✨ Fitur Utama

- 👥 **Multi-Account Storage**: Tambahkan akun Google baru tanpa harus logout dari akun yang sedang aktif.
- 🔄 **Claude Opus & Sonnet Auto-Failover**: Saat Claude kena rate-limit (429/quota), cukup tekan `Enter` untuk langsung beralih ke akun cadangan dan melanjutkan percakapan via `agy --continue`.
- 🔍 **Deteksi Email Otomatis**: Membaca payload JWT dari OAuth token secara otomatis untuk menampilkan alamat email Google aktif dan tanggal kedaluwarsa.
- ⚡ **Antigravity Custom Skill Terintegrasi**: Dilengkapi skill `/switch-account` agar agen AI di dalam chat dapat membantu Anda memeriksa atau merotasi akun langsung dari percakapan.
- 📱 **Dukungan Penuh Termux (Android) & Linux**: Disesuaikan langsung untuk lingkungan Termux dan distro Linux standar.

---

## 📦 Cara Instalasi

### Cara 1: Menggunakan Git Clone (Direkomendasikan)

```bash
git clone https://github.com/0xposa/antigravity-account-switcher.git
cd antigravity-account-switcher
bash install.sh
```

### Cara 2: One-Liner (Langsung Pasang via cURL)

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/0xposa/antigravity-account-switcher/main/install.sh)"
```

---

## 🛠️ Panduan Penggunaan

### 1. Melihat Daftar Akun Aktif
Periksa akun mana yang sedang aktif dan berapa akun yang tersimpan di pool:
```bash
agy-account list
```
*Output:*
```text
================= DAFTAR AKUN ANTIGRAVITY =================
 1. user1@gmail.com [AKTIF]
    File: user1@gmail.com.token | Exp: 2026-10-14 11:30:00
 2. user2@gmail.com
    File: user2@gmail.com.token | Exp: 2026-10-14 14:15:20
===========================================================
```

### 2. Menambahkan Akun Baru (Tanpa Logout Akun Lama)
Jalankan di terminal:
```bash
agy-account add
```
1. Akun Anda yang sedang aktif akan otomatis diamankan.
2. Tautan otorisasi Google OAuth akan muncul. Buka tautan di browser dan masuk dengan akun Google kedua.
3. Setelah masuk prompt `agy`, ketik `/exit`.
4. Akun baru akan otomatis terdeteksi dan tersimpan ke daftar!

### 3. Berpindah Akun Secara Manual
Anda bisa berpindah akun kapan saja menggunakan nomor urut atau alamat email:
```bash
# Berpindah menggunakan nomor urut:
agy-account switch 2

# Atau menggunakan email:
agy-account switch user2@gmail.com

# Atau otomatis rotasi ke akun berikutnya:
agy-account rotate
```

### 4. Menjalankan Claude dengan Fitur Auto-Rotate Limit (`agy-claude`)
Gunakan perintah `agy-claude` untuk menjalankan sesi coding Antigravity:

* **Untuk Claude Opus 4.6 (Thinking):**
  ```bash
  agy-claude
  ```
* **Untuk Claude Sonnet 4.6:**
  ```bash
  agy-claude --sonnet
  ```

**Bagaimana cara kerjanya saat limit?**
1. Kerjakan task coding Anda seperti biasa.
2. Jika kuota Claude di akun Anda mencapai limit, sesi akan berhenti.
3. Anda cukup menekan **`[Enter]`**.
4. Skrip akan otomatis merotasi token ke akun berikutnya dan melanjutkan task dari baris kode terakhir (`agy --continue`)!

---

## 🤖 Integrasi Chat AI (Custom Skill)

Installer secara otomatis menyertakan custom skill untuk Antigravity di `~/.gemini/config/skills/switch-account`.

Di dalam sesi chat Antigravity, Anda bisa langsung memberi instruksi seperti:
> *"Tolong cek akun aktif saya saat ini"*  
> *"Rotasikan akun Antigravity ke akun berikutnya"*

---

## ⚙️ Cara Kerja di Balik Layar

1. **Penyimpanan Token**: Token OAuth disimpan di folder terisolasi `~/.gemini/antigravity-cli/accounts/<email>.token`.
2. **Inspeksi Non-Intrusif**: Skrip mengekstrak identitas email langsung dari `id_token` tanpa memodifikasi isi kredensial.
3. **Session Continuity**: Karena database percakapan `conversation_summaries.db` tetap berada di tempatnya, menukar token OAuth memungkinkan `agy --continue` menyambung percakapan dengan mulus menggunakan kuota akun baru.

---

## 👨‍💻 Author

Dibuat & dikembangkan oleh:
* **Twitter / X**: [@0xposa](https://x.com/0xposa)
* **GitHub**: [@0xposa](https://github.com/0xposa)

Jika tool ini bermanfaat untuk produktivitas Anda, jangan lupa beri ⭐ **Star** di repository ini dan sapa saya di X!

---

## 📄 Lisensi

Proyek ini dilisensikan di bawah lisensi [MIT](LICENSE).
