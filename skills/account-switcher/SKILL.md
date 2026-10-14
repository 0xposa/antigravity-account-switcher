---
name: account-switcher
description: Mengalihkan akun Antigravity ke akun lain dalam pool. Tampilkan pilihan akun yang tersimpan secara interaktif setelah command /account-switcher dipilih.
---

# Antigravity Account Switcher Skill

Skill ini digunakan khusus di dalam Antigravity untuk beralih antar akun Google/Antigravity yang tersimpan.

## Alur Eksekusi Saat /account-switcher Dipanggil:
1. **Dapatkan Daftar Akun:**
   Jalankan perintah:
   ```bash
   agy-switcher --list-json
   ```
2. **Tampilkan Opsi Pemilihan Akun:**
   Gunakan tool `ask_question` untuk menampilkan semua akun yang tersedia.
   Format opsi:
   - Berikan tanda `(Aktif)` atau `(Recommended)` pada akun yang sedang aktif atau yang siap dipakai.
   - Contoh:
     - `1. nandibaik090120@gmail.com (Aktif)`
     - `2. nandinurrahman010920@gmail.com`
     - `3. nanditokulewa@gmail.com`
     - `4. nearmahkota@gmail.com`
     - `5. 0xnastar@gmail.com`

3. **Eksekusi Pengalihan:**
   Setelah pengguna memilih akun target, jalankan:
   ```bash
   agy-switcher --switch "<email_atau_nomor_pilihan>"
   ```
4. **Konfirmasi:**
   Beri tahu pengguna bahwa akun aktif telah berhasil dialihkan ke akun yang dipilih.

*(Catatan: Penambahan akun baru (Add account) dan penghapusan akun (Remove account) dilakukan melalui menu terminal Termux `agy-switcher`)*.
