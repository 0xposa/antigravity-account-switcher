---
name: model-switcher
description: Pilihan model Antigravity dan aktifkan rotasi akun otomatis saat terkena rate limit/kuota habis. Gunakan untuk /model-switcher, /model-rotasi, "model switcher", "ganti model".
---

# Model Switcher & Quota Auto-Switch Skill

Skill ini digunakan untuk memilih model AI Antigravity serta mengaktifkan proteksi rotasi akun otomatis jika kuota/rate limit model habis.

## Alur Eksekusi Saat /model-switcher Dipanggil:
1. **Tampilkan Pilihan Model:**
   Gunakan tool `ask_question` untuk menampilkan opsi model Antigravity:
   - `Gemini 3.8 Flash (Medium)` (Cepat, hemat token, kuota longgar)
   - `Gemini 3.8 Pro (High)` (Penalaran mendalam, analisis arsitektur)
   - `Claude 3.7 Sonnet (Thinking)` (Coding kelas atas dengan hybrid thinking)
   - `Claude 3.5 Sonnet` (Model standar coding harian)
   - `Claude 3.5 Haiku` (Sangat cepat dan responsif)

2. **Simpan Model Terpilih:**
   Perbarui file `~/.gemini/antigravity-cli/settings.json` pada key `"model": "<model_terpilih>"`.
   Konfirmasikan ke pengguna bahwa model telah aktif dan proteksi rotasi kuota otomatis telah siaga.

## ATURAN KRUSIAL PENANGANAN RATE LIMIT (AUTO-ROTATE):
Saat Anda (AI) mendeteksi respon error seperti:
- `HTTP 429` / `ResourceExhausted`
- `Quota exceeded` / `Rate limit reached`
- Model limits reached atau kehabisan kredit/token pada model yang dipilih

**JANGAN BERHENTI ATAU MEMINTA PENGGUNA MENGGANTI AKUN MANUAL!**
Lakukan langkah otonom berikut seketika:
1. Jalankan perintah di background:
   ```bash
   agy-switcher --rotate
   ```
2. Ambil output email baru yang dihasilkan perintah tersebut.
3. Beritahukan secara singkat:
   > 🔄 *Batas kuota/rate limit tercapai pada akun sebelumnya. Otomatis beralih ke akun: `<email_baru>`. Melanjutkan tugas...*
4. Segera lanjutkan instruksi/pekerjaan yang tertunda tanpa gangguan.
