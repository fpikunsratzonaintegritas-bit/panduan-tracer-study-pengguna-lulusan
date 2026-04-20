-- ============================================================
--  TRACER STUDY MSP FPIK UNSRAT — FIX / RESET SQL
--  Jalankan di: Supabase Dashboard → SQL Editor → New Query
--  Aman dijalankan BERKALI-KALI (idempotent)
-- ============================================================

-- LANGKAH 1: Hapus policy lama yang sudah ada agar tidak error
DROP POLICY IF EXISTS "Allow public insert"       ON tracer_pengguna;
DROP POLICY IF EXISTS "Allow authenticated select" ON tracer_pengguna;
DROP POLICY IF EXISTS "Allow authenticated update" ON tracer_pengguna;
DROP POLICY IF EXISTS "Allow authenticated delete" ON tracer_pengguna;

-- LANGKAH 2: Pastikan tabel ada (CREATE IF NOT EXISTS = aman)
CREATE TABLE IF NOT EXISTS tracer_pengguna (
  id                    BIGSERIAL PRIMARY KEY,
  created_at            TIMESTAMPTZ DEFAULT NOW(),
  nama_instansi         TEXT NOT NULL,
  sektor                TEXT NOT NULL,
  kota                  TEXT NOT NULL,
  nama_pengisi          TEXT NOT NULL,
  jabatan               TEXT NOT NULL,
  email                 TEXT NOT NULL,
  nama_alumni           TEXT,
  jabatan_alumni        TEXT,
  tahun_lulus           TEXT,
  aspek_integritas      SMALLINT CHECK (aspek_integritas BETWEEN 1 AND 4),
  aspek_profesionalisme SMALLINT CHECK (aspek_profesionalisme BETWEEN 1 AND 4),
  aspek_bahasa_asing    SMALLINT CHECK (aspek_bahasa_asing BETWEEN 1 AND 4),
  aspek_teknologi_info  SMALLINT CHECK (aspek_teknologi_info BETWEEN 1 AND 4),
  aspek_komunikasi      SMALLINT CHECK (aspek_komunikasi BETWEEN 1 AND 4),
  aspek_kerja_tim       SMALLINT CHECK (aspek_kerja_tim BETWEEN 1 AND 4),
  aspek_pengembangan    SMALLINT CHECK (aspek_pengembangan BETWEEN 1 AND 4),
  kepuasan_keseluruhan  SMALLINT NOT NULL CHECK (kepuasan_keseluruhan BETWEEN 1 AND 4),
  kesediaan_merekrut    TEXT,
  saran                 TEXT,
  pesan_khusus          TEXT
);

-- LANGKAH 3: Aktifkan RLS
ALTER TABLE tracer_pengguna ENABLE ROW LEVEL SECURITY;

-- LANGKAH 4: Buat ulang policy (sudah di-drop di atas, jadi tidak akan error)
CREATE POLICY "Allow public insert"
  ON tracer_pengguna FOR INSERT TO anon
  WITH CHECK (true);

CREATE POLICY "Allow authenticated select"
  ON tracer_pengguna FOR SELECT TO authenticated
  USING (true);

CREATE POLICY "Allow authenticated update"
  ON tracer_pengguna FOR UPDATE TO authenticated
  USING (true);

CREATE POLICY "Allow authenticated delete"
  ON tracer_pengguna FOR DELETE TO authenticated
  USING (true);

-- LANGKAH 5: Verifikasi — cek tabel berhasil dibuat
SELECT 
  'tracer_pengguna' AS tabel,
  COUNT(*) AS jumlah_kolom
FROM information_schema.columns
WHERE table_name = 'tracer_pengguna'
  AND table_schema = 'public';

-- ✅ Jika muncul hasil dengan jumlah_kolom = 21, setup BERHASIL!
