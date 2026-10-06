# Tugas 2 APP MOBILE - Perpustakaan

Nama: Muhamad Rayhan Ramadhansyah (1124160086)

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

| Data   | Tipe Data    | Contoh      |
| ------ | ------------ | ----------- |
| buku   | List<String> | []          |
| judul  | String       | "Web Dasar" |
| status | String       | "tersedia"  |
| telat  | int          | 4           |

Keterangan:

* `buku` dipakai buat menyimpan daftar judul buku yang sedang dipinjam.
* `judul` dipakai buat menyimpan nama buku.
* `status` dipakai buat mengetahui buku tersedia atau sedang dipinjam.
* `telat` dipakai buat menyimpan jumlah hari keterlambatan.

Output dari program berupa pesan berhasil atau gagal saat meminjam dan mengembalikan buku, serta jumlah denda yang harus dibayar.

## 4. Functional Requirement

Program ini punya beberapa fungsi utama, yaitu:

1. Cek apa jumlah buku yang dipinjam udah mencapai 3 buku.
2. Cek status buku sebelum melakukan peminjaman.
3. Masukin judul buku ke dalam list kalau peminjaman berhasil.
4. Cek apa buku yang mau dikembalikan ada di dalam list.
5. Menghitung denda berdasarkan jumlah hari keterlambatan.
6. Menampilkan hasil dari proses peminjaman dan pengembalian buku.

## 5. Business Rules

BR-01: Anggota cuma boleh pinjam maksimal 3 buku.

BR-02: Buku yang statusnya "dipinjam" gak bisa dipinjam lagi.

BR-03: Denda keterlambatan adalah Rp1.000 setiap hari.

BR-04: Kalau gak terlambat, dendanya Rp0.

BR-05: Buku cuma bisa dikembalikan kalau judul buku tersebut ada di dalam list buku yang dipinjam.

## 6. Decomposition Tree

```text
Sistem Perpustakaan
│
├── Peminjaman Buku
│   ├── Cek jumlah buku
│   ├── Cek status buku
│   ├── Masukin judul buku ke list
│   └── Tampilkan hasil
│
├── Pengembalian Buku
│   ├── Cek buku ada di list
│   ├── Tampilkan hasil pengembalian
│   └── Tampilkan denda
│
└── Perhitungan Denda
    ├── Cek jumlah hari terlambat
    ├── Kalau gak terlambat → Rp0
    └── Kalau terlambat → hari × Rp1.000
```

## 7. Pattern Recognition

Di program ini ada beberapa pola yang berulang.

Pada proses peminjaman, program selalu melakukan pengecekan sebelum buku dimasukin ke dalam list. Yang dicek adalah jumlah buku yang lagi dipinjam dan status buku.

Pada proses pengembalian, program juga melakukan pengecekan terlebih dahulu untuk mengetahui apa judul buku ada di dalam list.

Untuk denda, program mengecek jumlah hari keterlambatan. Kalau jumlah hari lebih dari 0, jumlah hari tersebut dikali Rp1.000. Kalau gak terlambat, dendanya Rp0.

## 8. Abstraction

Data yang dipakai di program cuma data yang memang dibutuhkan, yaitu:

* `buku` buat menyimpan daftar judul buku yang sedang dipinjam.
* `judul` buat menyimpan nama buku yang mau dipinjam atau dikembalikan.
* `status` buat mengetahui kondisi buku.
* `telat` buat menyimpan jumlah hari keterlambatan.
* `hari` buat menentukan jumlah denda.

Program juga dibagi jadi beberapa fungsi supaya kodenya lebih gampang dipahami.

Fungsi yang dipakai yaitu:

* `batasPinjam()` buat cek apakah jumlah buku sudah mencapai batas maksimal.
* `pinjamBuku()` buat proses peminjaman buku.
* `hitungDenda()` buat menghitung denda.
* `kembalikanBuku()` buat proses pengembalian buku dan menampilkan denda.

## 9. Algoritma

### Proses Peminjaman

1. Program membuat list `buku` yang masih kosong.
2. Program menerima judul dan status buku.
3. Program menjalankan fungsi `batasPinjam()` untuk mengecek jumlah buku.
4. Kalau jumlah buku sudah 3 atau lebih, peminjaman ditolak.
5. Kalau jumlah buku belum 3, program mengecek status buku.
6. Kalau status buku "dipinjam", peminjaman ditolak.
7. Kalau status buku bukan "dipinjam", judul buku dimasukkan ke dalam list.
8. Program menampilkan pesan kalau buku berhasil dipinjam.

### Proses Pengembalian

1. Program menerima judul buku dan jumlah hari keterlambatan.
2. Program mengecek apa judul buku ada di dalam list.
3. Kalau judul buku gak ada, program menampilkan pesan kalau buku tersebut gak sedang dipinjam.
4. Kalau judul buku ada, program menampilkan pesan kalau buku berhasil dikembalikan.
5. Program menjalankan fungsi `hitungDenda()` untuk menghitung denda.
6. Kalau jumlah hari terlambat lebih dari 0, jumlah hari dikali Rp1.000.
7. Kalau gak terlambat, denda yang dihasilkan adalah Rp0.
8. Program menampilkan jumlah denda.

## 10. Flowchart

Alur program secara sederhana:

```text
START
  ↓
Buat list buku = []
  ↓
Pinjam Web Dasar
  ↓
Cek jumlah buku >= 3?
  ├── Ya → Gagal: Maksimal hanya 3 buku
  └── Tidak
          ↓
   Cek status = "dipinjam"?
       ├── Ya → Gagal: Buku sedang dipinjam
       └── Tidak
              ↓
       Masukin buku ke list
              ↓
       Tampilkan peminjaman berhasil
              ↓
Pinjam Basis Data
              ↓
       Status = "dipinjam"
              ↓
       Tampilkan peminjaman gagal
              ↓
Pinjam Python
              ↓
       Masukin Python ke list
              ↓
       Tampilkan peminjaman berhasil
              ↓
Kembalikan Web Dasar
              ↓
       Cek buku ada di list?
       ├── Tidak → Buku tidak dipinjam
       └── Ya
              ↓
       Tampilkan berhasil dikembalikan
              ↓
       Hitung denda
              ↓
          Denda Rp0
              ↓
Kembalikan Python
              ↓
       Cek buku ada di list?
       ├── Tidak → Buku tidak dipinjam
       └── Ya
              ↓
       Tampilkan berhasil dikembalikan
              ↓
       Hitung denda
              ↓
          Denda Rp4.000
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

pinjamBuku(buku, "Web Dasar", "tersedia")
pinjamBuku(buku, "Basis Data", "dipinjam")
pinjamBuku(buku, "Python", "tersedia")

kembalikanBuku(buku, "Web Dasar", 0)
kembalikanBuku(buku, "Python", 4)

END
```
