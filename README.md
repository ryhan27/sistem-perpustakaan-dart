# Tugas 2 APP MOBILE - Perpustakaan

Nama: Muhamad Rayhan Ramadhansyah
NIM: 1124160086

# A. Dokumen Analisis

## 1. Problem Statement

Program ini pada dasarnya dibuat untuk mempermudah petugas dalam mengurus alur pinjam-meminjam buku di perpustakaan. Aturan utamanya, satu orang dibatasi hanya boleh meminjam maksimal 3 buku.

Cara kerjanya cukup ketat: sebelum buku diberikan, program bakal ngecek dulu, apakah jatah pinjam orang tersebut sudah penuh? Lalu, apakah buku yang mau dipinjam itu sedang dipakai orang lain? Kalau salah satu jawabannya iya, peminjaman otomatis ditolak. Selain itu, program ini juga bertugas menghitung tagihan denda keterlambatan saat buku dikembalikan, dengan tarif Rp1.000 untuk setiap hari telat.

## 2. Actor

Aktor utama alias pihak yang mengoperasikan program ini adalah **Petugas Perpustakaan**.
Nantinya, petugas inilah yang bertugas memasukkan data-data ke dalam sistem, seperti:

* Daftar buku apa saja yang saat ini sedang dipinjam.
* Judul buku baru yang mau dipinjam oleh anggota.
* Status bukunya (lagi nganggur atau lagi dipinjam).
* Berapa hari anggota tersebut telat saat mengembalikan buku.

## 3. Input & Output

### Input (Data yang dimasukkan)

| Data | Tipe Data | Contoh Isian |
| --- | --- | --- |
| `tas` (Daftar Pinjaman) | `List<String>` | `['Web Dasar', 'Python']` |
| `judul` | `String` | `'Web Dasar'` |
| `status` | `String` | `'tersedia'` atau `'dipinjam'` |
| `telat` | `int` | `4` (hari) |

### Output (Hasil yang ditampilkan)

Setelah memproses input, program bakal ngasih respon berupa:

* Laporan sukses kalau buku berhasil masuk ke daftar pinjaman.
* Pesan penolakan (gagal) beserta alasannya, misal karena tas sudah penuh atau buku lagi dipakai.
* Konfirmasi saat buku dikembalikan.
* Total tagihan denda keterlambatan (dalam Rupiah).

## 4. Functional Requirement

Biar bisa jalan sesuai harapan, program ini dibekali dengan beberapa fungsi utama:

1. Mampu menghitung dan mengecek apakah buku yang dipinjam sudah mencapai limit (3 buku).
2. Mengecek status ketersediaan buku di rak sebelum diizinkan untuk dipinjam.
3. Memasukkan judul buku baru ke dalam daftar pinjaman jika lolos semua pengecekan.
4. Memvalidasi keberadaan buku di dalam daftar saat proses pengembalian.
5. Menghitung otomatis nominal denda berdasarkan berapa lama hari keterlambatannya.
6. Mencetak hasil akhir (sukses/gagal/jumlah denda) ke layar secara langsung.

## 5. Business Rules

Ini adalah aturan main wajib (SOP) yang mengikat sistem perpustakaannya:

| Kode | Aturan Main |
| --- | --- |
| BR-01 | Anggota perpustakaan cuma boleh bawa pulang maksimal 3 buku. |
| BR-02 | Buku yang statusnya lagi "dipinjam" haram hukumnya untuk dipinjam lagi. |
| BR-03 | Kalau telat ngembaliin, dendanya jalan terus Rp1.000 per harinya. |
| BR-04 | Kalau balikinnya on-time (nggak telat), dendanya otomatis Rp0 (gratis). |
| BR-05 | Buku cuma bisa diproses untuk dikembalikan kalau datanya memang ada di dalam daftar pinjaman. |

## 6. Decomposition

Biar nggak pusing, logika sistem perpustakaan yang besar ini kita pecah (dekomposisi) jadi bagian-bagian kecil yang lebih fokus:

```text
Sistem Perpustakaan
│
├── Modul Peminjaman
│   ├── Pengecekan sisa kuota pinjam
│   ├── Pengecekan status buku
│   ├── Penambahan buku ke daftar
│   └── Cetak laporan peminjaman
│
├── Modul Pengembalian
│   ├── Pengecekan kecocokan buku di daftar pinjaman
│   └── Cetak laporan pengembalian
│
└── Modul Denda
    ├── Pengecekan hari keterlambatan
    ├── Jika on-time → Bebas denda (Rp0)
    └── Jika telat → Hari telat × Rp1.000

```

## 7. Pattern Recognition

Kalau kita perhatikan cara kerja kodenya, ada pola (pattern) kebiasaan yang terus diulang oleh sistem:

* **Pola Validasi Awal:** Tiap kali mau mengeksekusi sesuatu, entah itu minjam atau balikin buku, program pasti selalu nahan prosesnya sebentar buat melakukan pengecekan kondisi (Guard Clause). Kalau nggak valid, proses langsung dipotong/berhenti.
* **Pola Perhitungan:** Denda selalu dihitung dengan rumus matematika sederhana yang statis: `jumlah hari x 1000`, berapapun harinya.

## 8. Abstraction

Di perpustakaan dunia nyata, data buku itu pasti ribet banget (ada nomor ISBN, nama pengarang, tahun terbit, nama peminjam, dsb). Tapi dengan teknik abstraksi, kita buang semua keribetan itu dan cuma ngambil data intinya saja biar programnya enteng:

* `tas`: Cukup menyimpan daftar judulnya saja (List).
* `judul`: Cuma butuh nama bukunya.
* `status`: Cukup tau dia lagi "tersedia" atau "dipinjam".
* `telat`: Cukup angka harinya saja, nggak perlu repot pakai kalender/tanggalan asli.

## 9. Algorithm

### Alur Cerita Peminjaman Buku

1. Program nerima request pinjam dengan menyertakan daftar tas, judul, dan status bukunya.
2. Pertama, program ngecek isi tas. Kalau isinya udah 3, request langsung ditolak (berhenti).
3. Kalau tas masih muat, program lanjut ngecek status bukunya. Kalau statusnya lagi "dipinjam", request juga ditolak.
4. Kalau tas masih muat dan bukunya nganggur, judul buku itu akhirnya sah dimasukkan ke dalam daftar tas.
5. Terakhir, program nampilin pesan sukses.

### Alur Cerita Pengembalian Buku

1. Program nerima request balikin buku beserta info telat berapa hari.
2. Program ngecek ke dalam tas, benar nggak sih buku itu ada di sana?
3. Kalau ternyata nggak ada, program langsung ngasih tau "Buku ini nggak ada di daftar pinjaman".
4. Kalau bukunya memang ada, program lanjut ngitung dendanya.
5. Kalau telatnya 0 hari, dendanya Rp0. Tapi kalau telatnya lebih dari 0, harinya dikali Rp1.000.
6. Program mencetak laporan sukses mengembalikan beserta nominal dendanya.

## 10. Flowchart

```text
[ START ]
    │
    ▼
Siapkan daftar pinjaman (tas)
    │
    ▼
Terima judul & status buku buat dipinjam
    │
    ▼
Isi tas sudah mencapai 3?
    │
  YA ─────────► Gagal: Limit 3 buku habis
    │
 TIDAK
    │
    ▼
Status bukunya "dipinjam"?
    │
  YA ─────────► Gagal: Buku sedang dipakai orang
    │
 TIDAK
    │
    ▼
Tambahkan judul buku ke tas pinjaman
    │
    ▼
Cetak pesan: Sukses minjam buku
    │
    ▼
Terima judul buku & info hari telat buat dikembalikan
    │
    ▼
Bukunya terdaftar di dalam tas?
    │
 TIDAK ───────► Gagal: Buku tidak pernah dipinjam
    │
   YA
    │
    ▼
Apakah telatnya lebih dari 0 hari?
    │
 TIDAK ───────► Total denda = Rp0
    │
   YA
    │
    ▼
Total denda = hari telat × Rp1.000
    │
    ▼
Cetak pesan: Sukses balikin buku + Jumlah denda
    │
    ▼
[ END ]

```

## 11. Pseudocode

```text
START

FUNCTION limitPenuh(total)
    RETURN total >= 3
END FUNCTION

FUNCTION bukuDipakai(status)
    RETURN status == "dipinjam"
END FUNCTION

FUNCTION prosesPinjam(tas, judul, status)
    IF limitPenuh(panjang dari tas) THEN
        PRINT "Gagal: Tas penuh, tolak " + judul
        RETURN FALSE
    END IF

    IF bukuDipakai(status) THEN
        PRINT "Gagal: Buku " + judul + " sedang dipakai"
        RETURN FALSE
    END IF

    ADD judul TO tas
    PRINT "Sukses: Meminjam " + judul
    RETURN TRUE
END FUNCTION

FUNCTION apakahTelat(hari)
    RETURN hari > 0
END FUNCTION

FUNCTION hitungDenda(telat)
    IF NOT apakahTelat(telat) THEN
        RETURN 0
    END IF
    RETURN telat * 1000
END FUNCTION

FUNCTION prosesKembali(tas, judul, telat)
    IF judul tidak ada di dalam tas THEN
        PRINT "Gagal: " + judul + " tidak ada di tas"
        RETURN FALSE
    END IF

    PRINT "Sukses: Balikin " + judul + " | Denda: Rp" + hitungDenda(telat)
    RETURN TRUE
END FUNCTION

// EKSEKUSI PROGRAM
SET tas = []

PRINT "--- SKENARIO PINJAM ---"
CALL prosesPinjam(tas, "Web Dasar", "tersedia")
CALL prosesPinjam(tas, "basis data", "dipinjam")
CALL prosesPinjam(tas, "Python", "tersedia")

PRINT "--- SKENARIO DENDA HARIAN ---"
CALL prosesKembali(tas, "Web Dasar", 0)
CALL prosesKembali(tas, "Python", 4)

END

```
