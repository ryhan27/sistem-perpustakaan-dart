# Tugas 2 APP MOBILE - Perpustakaan

Nama: Muhamad Rayhan Ramadhansyah (1124160086)

# A. Dokumen Analisis

## 1. Problem Statement

Program ini dibuat untuk membantu proses peminjaman dan pengembalian buku di perpustakaan. Jumlah buku yang bisa dipinjam dibatasi maksimal 3 buku.

Sebelum meminjam, program akan mengecek jumlah buku yang sudah dipinjam dan mengecek status buku tersebut. Kalau jumlah buku sudah mencapai 3 atau buku sedang dipinjam, maka peminjaman tidak bisa dilakukan.

Program ini juga digunakan untuk menghitung denda ketika buku terlambat dikembalikan. Dendanya adalah Rp1.000 untuk setiap hari keterlambatan.

## 2. Actor

Yang menggunakan program ini adalah petugas perpustakaan.

Petugas memberikan data yang diperlukan, seperti:

* Daftar buku yang sedang dipinjam.
* Judul buku yang ingin dipinjam.
* Status buku, apakah tersedia atau sedang dipinjam.
* Jumlah hari keterlambatan saat mengembalikan buku.

## 3. Input & Output

### Input

| Data   | Tipe Data    | Contoh                  |
| ------ | ------------ | ----------------------- |
| buku   | List<String> | ['Web Dasar', 'Python'] |
| judul  | String       | 'Web Dasar'             |
| status | String       | 'tersedia'              |
| telat  | int          | 4                       |

### Output

Program akan menampilkan hasil dari proses yang dilakukan, seperti:

* Pesan jika buku berhasil dipinjam.
* Pesan jika peminjaman gagal karena buku sedang dipinjam.
* Pesan jika buku berhasil dikembalikan.
* Jumlah denda jika buku terlambat dikembalikan.

## 4. Functional Requirement

Fungsi yang ada di dalam program ini antara lain:

1. Mengecek apakah jumlah buku yang dipinjam sudah mencapai 3 buku.
2. Mengecek status buku sebelum dipinjam.
3. Menambahkan buku ke dalam daftar jika peminjaman berhasil.
4. Mengecek apakah buku yang akan dikembalikan ada di dalam daftar.
5. Menghapus buku dari daftar setelah dikembalikan.
6. Menghitung denda berdasarkan jumlah hari keterlambatan.
7. Menampilkan hasil dari proses peminjaman dan pengembalian.

## 5. Business Rules

| Kode  | Aturan                                                                           |
| ----- | -------------------------------------------------------------------------------- |
| BR-01 | Buku yang boleh dipinjam maksimal 3 buku.                                        |
| BR-02 | Buku yang statusnya dipinjam tidak boleh dipinjam lagi.                          |
| BR-03 | Denda keterlambatan adalah Rp1.000 per hari.                                     |
| BR-04 | Kalau tidak terlambat, maka denda yang dibayar Rp0.                              |
| BR-05 | Buku hanya bisa dikembalikan jika ada di dalam daftar buku yang sedang dipinjam. |

## 6. Decomposition

Program perpustakaan ini bisa dibagi menjadi beberapa bagian supaya lebih mudah dipahami.

```text
Sistem Perpustakaan

│
├── Peminjaman Buku
│   ├── Cek jumlah buku
│   ├── Cek status buku
│   ├── Masukkan buku ke list
│   └── Tampilkan hasil
│
├── Pengembalian Buku
│   ├── Cek buku ada di list
│   ├── Hapus buku dari list
│   └── Tampilkan hasil
│
└── Perhitungan Denda
    ├── Cek jumlah hari terlambat
    ├── Jika tidak terlambat → Rp0
    └── Jika terlambat → hari × Rp1.000
```

## 7. Pattern Recognition

Dari program yang dibuat, ada beberapa pola yang berulang.

Pertama, setiap kali ingin meminjam buku, program selalu mengecek jumlah buku terlebih dahulu. Setelah itu baru mengecek apakah buku tersebut sedang dipinjam atau tidak.

Kedua, saat mengembalikan buku, program mengecek terlebih dahulu apakah buku tersebut ada di dalam list.

Ketiga, untuk denda, perhitungannya selalu berdasarkan jumlah hari keterlambatan. Kalau terlambat 1 hari maka dendanya Rp1.000, kalau 4 hari maka Rp4.000.

Jadi pola utamanya adalah pengecekan kondisi sebelum menjalankan proses.

## 8. Abstraction

Dalam program ini tidak semua hal tentang perpustakaan perlu dibuat. Saya hanya mengambil data yang memang dibutuhkan oleh program.

Data yang digunakan yaitu:

* buku: untuk menyimpan daftar buku yang sedang dipinjam.
* judul: untuk menyimpan nama atau judul buku.
* status: untuk mengetahui apakah buku tersedia atau sedang dipinjam.
* telat: untuk menyimpan jumlah hari keterlambatan.

Program juga menggunakan beberapa fungsi:

```text
batasPinjam()
```

Untuk mengecek apakah jumlah buku sudah mencapai batas maksimal.

```text
pinjamBuku()
```

Untuk menjalankan proses peminjaman buku.

```text
hitungDenda()
```

Untuk menghitung denda keterlambatan.

```text
kembalikanBuku()
```

Untuk menjalankan proses pengembalian buku dan menghitung dendanya.

## 9. Algorithm

### Algoritma Peminjaman Buku

1. Program menerima data buku, judul buku, dan status buku.
2. Program mengecek jumlah buku yang sudah dipinjam.
3. Jika jumlahnya sudah 3 buku, peminjaman ditolak.
4. Jika jumlahnya belum 3 buku, program mengecek status buku.
5. Jika statusnya dipinjam, peminjaman ditolak.
6. Jika statusnya tersedia, buku dimasukkan ke dalam list.
7. Program menampilkan pesan bahwa buku berhasil dipinjam.

### Algoritma Pengembalian Buku

1. Program menerima judul buku dan jumlah hari keterlambatan.
2. Program mengecek apakah buku tersebut ada di dalam list.
3. Jika tidak ada, program memberi tahu bahwa buku tersebut tidak sedang dipinjam.
4. Jika ada, buku dihapus dari list.
5. Program menghitung denda.
6. Jika tidak terlambat, denda adalah Rp0.
7. Jika terlambat, jumlah hari dikalikan Rp1.000.
8. Program menampilkan jumlah denda.

## 10. Flowchart

```text
[ START ]
    │
    ▼
Siapkan list buku
    │
    ▼
Masukkan judul dan status buku
    │
    ▼
Apakah jumlah buku sudah 3?
    │
  YA ─────────► Gagal: Maksimal 3 buku
    │
  TIDAK
    │
    ▼
Apakah buku sedang dipinjam?
    │
  YA ─────────► Gagal: Buku sedang dipinjam
    │
  TIDAK
    │
    ▼
Tambahkan buku ke list
    │
    ▼
Berhasil meminjam buku
    │
    ▼
Masukkan judul buku dan jumlah hari terlambat
    │
    ▼
Apakah buku ada di list?
    │
  TIDAK ───────► Buku tidak sedang dipinjam
    │
   YA
    │
    ▼
Hapus buku dari list
    │
    ▼
Berhasil mengembalikan buku
    │
    ▼
Apakah terlambat lebih dari 0 hari?
    │
  TIDAK ───────► Denda Rp0
    │
   YA
    │
    ▼
Denda = hari × Rp1.000
    │
    ▼
Tampilkan denda
    │
    ▼
[ END ]
```

## 11. Pseudocode

```text
START

FUNCTION batasPinjam(buku)
    RETURN jumlah buku >= 3
END FUNCTION


FUNCTION pinjamBuku(buku, judul, status)
    IF batasPinjam(buku) THEN
        PRINT "Gagal: Maksimal hanya 3 buku"
        RETURN
    END IF

    IF status = "dipinjam" THEN
        PRINT "Gagal: Buku " + judul + " sedang dipinjam"
        RETURN
    END IF

    ADD judul TO buku
    PRINT "Berhasil meminjam " + judul
END FUNCTION


FUNCTION hitungDenda(hari)
    IF hari > 0 THEN
        RETURN hari × 1000
    END IF

    RETURN 0
END FUNCTION


FUNCTION kembalikanBuku(buku, judul, telat)
    IF judul tidak ada di dalam buku THEN
        PRINT "Buku " + judul + " tidak dipinjam"
        RETURN
    END IF

    REMOVE judul FROM buku

    PRINT "Berhasil mengembalikan " + judul
    PRINT "Denda: Rp" + hitungDenda(telat)
END FUNCTION


START PROGRAM

SET buku = []

PRINT "--- PINJAM ---"

CALL pinjamBuku(buku, "Web Dasar", "tersedia")
CALL pinjamBuku(buku, "Basis Data", "dipinjam")
CALL pinjamBuku(buku, "Python", "tersedia")

PRINT "--- KEMBALIKAN BUKU ---"

CALL kembalikanBuku(buku, "Web Dasar", 0)
CALL kembalikanBuku(buku, "Python", 4)

END
```
