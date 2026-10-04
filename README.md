# Tugas 2 APP MOBILE - Perpustakaan

Nama: Muhamad Rayhan Ramadhansyah
NIM: 1124160086
Kelas: -

# A. Dokumen Analisis

## 1. Problem Statement

Program perpustakaan ini dibuat buat membantu proses peminjaman dan pengembalian buku. Di program ini, anggota cuma boleh pinjam maksimal 3 buku.

Sebelum buku dipinjam, program akan cek dulu jumlah buku yang lagi dipinjam dan status bukunya. Kalau jumlah buku udah mencapai 3 atau status bukunya sedang dipinjam, maka buku gak bisa dipinjam.

Program ini juga bisa buat proses pengembalian buku. Saat buku dikembalikan, program akan cek apa buku tersebut ada di dalam daftar buku yang lagi dipinjam. Kalau pengembaliannya terlambat, maka akan dikenakan denda Rp1.000 setiap harinya.

## 2. Actor

Actor dalam program ini adalah petugas perpustakaan.

Petugas bisa melakukan beberapa hal, yaitu:

* Meminjamkan buku
* Cek status buku
* Mengembalikan buku
* Menghitung denda kalau buku terlambat dikembalikan

## 3. Input dan Output

| Data   | Tipe Data | Contoh      |
| ------ | --------- | ----------- |
| buku   | List      | []          |
| judul  | String    | "Web Dasar" |
| status | String    | "tersedia"  |
| telat  | int       | 4           |

Keterangan:

* `buku` dipakai buat menyimpan daftar buku yang lagi dipinjam.
* `judul` dipakai buat menyimpan nama buku.
* `status` dipakai buat mengetahui buku tersedia atau sedang dipinjam.
* `telat` dipakai buat menyimpan jumlah hari keterlambatan.

## 4. Functional Requirement

Program ini punya beberapa fungsi utama, yaitu:

1. Cek apa jumlah buku yang dipinjam udah mencapai 3 buku.
2. Cek status buku sebelum melakukan peminjaman.
3. Masukin buku ke dalam list kalau peminjaman berhasil.
4. Cek apa buku yang mau dikembalikan ada di dalam list.
5. Menghitung denda berdasarkan jumlah hari keterlambatan.
6. Menampilkan hasil dari proses peminjaman dan pengembalian buku.

## 5. Business Rules

BR-01: Anggota cuma boleh pinjam maksimal 3 buku.

BR-02: Buku yang statusnya "dipinjam" gak bisa dipinjam lagi.

BR-03: Denda keterlambatan adalah Rp1.000 setiap hari.

BR-04: Kalau gak terlambat, dendanya Rp0.

BR-05: Buku cuma bisa dikembalikan kalau buku tersebut ada di dalam daftar buku yang lagi dipinjam.

## 6. Decomposition Tree

Sistem Perpustakaan

├── Peminjaman Buku
│   ├── Cek jumlah buku
│   ├── Cek status buku
│   ├── Masukin buku ke list
│   └── Tampilkan hasil
│
├── Pengembalian Buku
│   ├── Cek buku ada di list
│   └── Tampilkan hasil
│
└── Perhitungan Denda
├── Cek jumlah hari terlambat
├── Kalau gak terlambat → Rp0
└── Kalau terlambat → hari × Rp1.000

## 7. Pattern Recognition

Di program ini ada beberapa pola yang berulang.

Pada proses peminjaman, program selalu cek dulu sebelum buku dimasukin ke dalam list. Yang dicek adalah jumlah buku yang lagi dipinjam dan status bukunya.

Pada proses pengembalian, program juga cek dulu apa buku yang mau dikembalikan memang ada di dalam list.

Untuk denda, caranya juga sama. Kalau jumlah hari terlambat lebih dari 0, jumlah hari tersebut dikali Rp1.000. Kalau gak terlambat, dendanya Rp0.

## 8. Abstraction

Data yang dipakai di program cuma data yang memang dibutuhkan, yaitu:

* `buku` buat menyimpan daftar buku yang lagi dipinjam.
* `judul` buat menyimpan nama buku.
* `status` buat mengetahui kondisi buku.
* `telat` buat menyimpan jumlah hari keterlambatan.

Program juga dibagi jadi beberapa fungsi supaya kodenya lebih gampang dipahami.

Fungsi yang dipakai yaitu:

* `batasPinjam()` buat cek batas maksimal peminjaman.
* `pinjamBuku()` buat proses peminjaman buku.
* `hitungDenda()` buat menghitung denda.
* `kembalikanBuku()` buat proses pengembalian buku.

## 9. Algoritma

### Proses Peminjaman

1. Program menerima data buku, judul buku, dan status buku.
2. Program cek jumlah buku yang lagi dipinjam.
3. Kalau jumlah buku udah 3, peminjaman ditolak.
4. Kalau belum 3, program lanjut cek status buku.
5. Kalau status bukunya "dipinjam", peminjaman ditolak.
6. Kalau bukunya tersedia, judul buku dimasukin ke dalam list.
7. Program menampilkan pesan kalau buku berhasil dipinjam.

### Proses Pengembalian

1. Program menerima judul buku dan jumlah hari keterlambatan.
2. Program cek apa judul buku ada di dalam list.
3. Kalau bukunya gak ada, program menampilkan pesan kalau buku tersebut gak sedang dipinjam.
4. Kalau bukunya ada, program menampilkan pesan kalau buku berhasil dikembalikan.
5. Program menghitung denda berdasarkan jumlah hari keterlambatan.
6. Kalau gak terlambat, dendanya Rp0.
7. Kalau terlambat, jumlah hari dikali Rp1.000.
8. Program menampilkan jumlah denda.

## 10. Flowchart

Alur program secara sederhana:

```text
START
  ↓
Buat list buku = []
  ↓
Input judul dan status buku
  ↓
Cek jumlah buku >= 3?
  ├── Ya → Tampilkan "Gagal: Maksimal hanya 3 buku"
  └── Tidak
          ↓
   Cek status = "dipinjam"?
       ├── Ya → Tampilkan "Gagal: Buku sedang dipinjam"
       └── Tidak
              ↓
       Masukin buku ke list
              ↓
       Tampilkan peminjaman berhasil
              ↓
Input judul buku dan jumlah hari terlambat
              ↓
       Cek buku ada di list?
       ├── Tidak → Tampilkan "Buku tidak dipinjam"
       └── Ya
              ↓
       Tampilkan pengembalian berhasil
              ↓
          Hitung denda
              ↓
        Tampilkan denda
              ↓
             END
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
        PRINT "Gagal: Buku sedang dipinjam"
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
        PRINT "Buku tidak dipinjam"
        RETURN
    END IF

    PRINT "Berhasil mengembalikan " + judul
    PRINT "Denda: Rp" + hitungDenda(telat)

END FUNCTION

START PROGRAM

SET buku = []

CALL pinjamBuku(buku, "Web Dasar", "tersedia")
CALL pinjamBuku(buku, "Basis Data", "dipinjam")
CALL pinjamBuku(buku, "Python", "tersedia")

CALL kembalikanBuku(buku, "Web Dasar", 0)
CALL kembalikanBuku(buku, "Python", 4)

END
```

Catatan:

Dokumen ini dibuat sesuai sama kode `main.dart` yang sekarang. Di kode tersebut belum ada proses buat menghapus buku dari list setelah dikembalikan, jadi bagian analisis ini gak membahas `buku.remove(judul);`.
