# Tracer Study MSP FPIK UNSRAT
**Program Studi Manajemen Sumber Daya Perairan · FPIK · Universitas Sam Ratulangi Manado**

Sistem Tracer Study Pengguna Lulusan berbasis Supabase + GitHub Pages.

---

## 📁 Struktur File

```
tracer-msp/
├── index.html          ← Halaman panduan pengisian
├── form.html           ← Formulir aktif (3 langkah) → Supabase
├── admin.html          ← Dashboard admin (lihat & export data)
├── supabase-setup.sql  ← SQL untuk setup tabel Supabase
└── README.md           ← Panduan ini
```

---

## 🗄️ Setup Supabase (Langkah Pertama)

1. Buka **Supabase Dashboard** → project Anda → **SQL Editor**
2. Klik **New Query**
3. Copy-paste isi file `supabase-setup.sql` dan klik **Run**
4. Pastikan tabel `tracer_pengguna` berhasil dibuat di **Table Editor**

---

## 🚀 Deploy ke GitHub Pages

### Langkah 1 — Buat Repository GitHub
1. Buka [github.com](https://github.com) dan login
2. Klik **New repository**
3. Nama repo: `tracer-study-msp` (atau sesuai keinginan)
4. Set ke **Public** (wajib untuk GitHub Pages gratis)
5. Klik **Create repository**

### Langkah 2 — Upload File
**Cara A — Via web browser (mudah):**
1. Di halaman repo, klik **uploading an existing file**
2. Drag & drop semua 4 file: `index.html`, `form.html`, `admin.html`, `README.md`
3. Klik **Commit changes**

**Cara B — Via Git:**
```bash
git init
git add .
git commit -m "Initial commit: Tracer Study MSP FPIK UNSRAT"
git branch -M main
git remote add origin https://github.com/USERNAME/tracer-study-msp.git
git push -u origin main
```

### Langkah 3 — Aktifkan GitHub Pages
1. Di repo GitHub, klik **Settings**
2. Klik **Pages** di sidebar kiri
3. Source: **Deploy from a branch**
4. Branch: **main** / folder: **/ (root)**
5. Klik **Save**
6. Tunggu 1–2 menit, lalu akses di:
   ```
   https://USERNAME.github.io/tracer-study-msp/
   ```

---

## 🔗 URL Halaman

| Halaman | URL |
|---------|-----|
| Panduan | `https://USERNAME.github.io/tracer-study-msp/` |
| Formulir | `https://USERNAME.github.io/tracer-study-msp/form.html` |
| Admin | `https://USERNAME.github.io/tracer-study-msp/admin.html` |

> Ganti `USERNAME` dengan username GitHub Anda dan `tracer-study-msp` dengan nama repo Anda.

---

## 🔐 Password Admin

Default password admin di `admin.html`:
```
admin-msp-2025
```

**Penting:** Ganti password ini sebelum deploy! Buka `admin.html`, cari baris:
```javascript
const ADMIN_PASS = 'admin-msp-2025';
```
Ganti dengan password yang kuat.

---

## 📊 Export Data

Di halaman admin, klik tombol **⬇ Export CSV** untuk mengunduh semua data sebagai file Excel-compatible (CSV dengan BOM UTF-8).

---

## 🛠️ Konfigurasi

Supabase URL dan Key sudah terkonfigurasi di `form.html` dan `admin.html`.
Jika perlu menggantinya, cari variabel:
```javascript
const SUPABASE_URL = 'https://ozjlymgywuhmdoqvanlz.supabase.co';
const SUPABASE_KEY = 'eyJ...';
```

---

## 📞 Bantuan

Hubungi admin Program Studi Manajemen Sumber Daya Perairan, FPIK, Universitas Sam Ratulangi Manado.
