# Tugas 2 APP MOBILE - Perpustakaan

Nama: Muhamad Rayhan Ramadhansyah (1124160086)


# A. Dokumen Analisis

## 1. Problem Statement

Program perpustakaan dibuat untuk membantu proses peminjaman dan pengembalian buku. Dalam program ini, anggota hanya boleh meminjam maksimal 3 buku. Sebelum meminjam, program akan mengecek jumlah buku yang sedang dipinjam dan status buku.

Program juga dapat melakukan proses pengembalian buku. Saat buku dikembalikan, program akan mengecek apakah buku tersebut ada di dalam daftar buku yang sedang dipinjam. Jika terlambat, akan dikenakan denda sebesar Rp1.000 setiap harinya.

## 2. Actor

Actor dalam program ini adalah petugas perpustakaan.

Petugas dapat:

* Meminjamkan buku
* Mengecek status buku
* Mengembalikan buku
* Menghitung denda keterlambatan

## 3. Input dan Output

| Data   | Tipe Data    | Contoh      |
| ------ | ------------ | ----------- |
| buku   | List<String> | []          |
| judul  | String       | "Web Dasar" |
| status | String       | "tersedia"  |
| telat  | int          | 4           |

Keterangan:

* `buku` digunakan untuk menyimpan daftar buku yang sedang dipinjam.
* `judul` digunakan untuk menyimpan nama buku.
* `status` digunakan untuk mengetahui apakah buku tersedia atau sedang dipinjam.
* `telat` digunakan untuk menyimpan jumlah hari keterlambatan.

## 4. Functional Requirement

Program memiliki beberapa fungsi utama, yaitu:

1. Mengecek apakah jumlah buku yang dipinjam sudah mencapai 3 buku.
2. Mengecek status buku sebelum melakukan peminjaman.
3. Menambahkan buku ke dalam daftar jika peminjaman berhasil.
4. Mengecek apakah buku yang ingin dikembalikan ada di dalam daftar.
5. Menghitung denda berdasarkan jumlah hari keterlambatan.
6. Menampilkan hasil peminjaman dan pengembalian buku.

## 5. Business Rules

BR-01: Anggota hanya boleh meminjam maksimal 3 buku.

BR-02: Buku yang statusnya "dipinjam" tidak dapat dipinjam kembali.

BR-03: Denda keterlambatan adalah Rp1.000 per hari.

BR-04: Jika tidak terlambat, maka denda adalah Rp0.

BR-05: Buku hanya dapat dikembalikan jika buku tersebut terdapat di dalam daftar buku yang sedang dipinjam.

## 6. Decomposition Tree

Sistem Perpustakaan

├── Peminjaman Buku
│   ├── Cek jumlah buku
│   ├── Cek status buku
│   ├── Masukkan buku ke list
│   └── Tampilkan hasil
│
├── Pengembalian Buku
│   ├── Cek buku ada di list
│   └── Tampilkan hasil
│
└── Perhitungan Denda
├── Cek jumlah hari terlambat
├── Jika tidak terlambat → Rp0
└── Jika terlambat → hari × Rp1.000

## 7. Pattern Recognition

Pada program ini terdapat beberapa pola yang berulang.

Pada proses peminjaman, program selalu melakukan pengecekan terlebih dahulu sebelum buku dimasukkan ke dalam daftar.

Pada proses pengembalian, program juga melakukan pengecekan apakah buku yang akan dikembalikan memang ada di dalam daftar.

Perhitungan denda juga menggunakan pola yang sederhana. Jika jumlah hari terlambat lebih dari 0, maka jumlah hari dikalikan dengan Rp1.000. Jika tidak terlambat, dendanya Rp0.

## 8. Abstraction

Data yang digunakan dalam program hanya data yang diperlukan untuk menjalankan sistem, yaitu:

* `buku` untuk menyimpan daftar buku.
* `judul` untuk menyimpan nama buku.
* `status` untuk mengetahui status buku.
* `telat` untuk menyimpan jumlah hari keterlambatan.

Program juga dibagi menjadi beberapa fungsi agar setiap proses lebih mudah dipahami:

* `batasPinjam()` untuk mengecek batas peminjaman.
* `pinjamBuku()` untuk melakukan peminjaman.
* `hitungDenda()` untuk menghitung denda.
* `kembalikanBuku()` untuk melakukan pengembalian.

## 9. Algoritma

### Proses Peminjaman

1. Program menerima daftar buku, judul buku, dan status buku.
2. Program mengecek jumlah buku yang sedang dipinjam.
3. Jika jumlah buku sudah 3 atau lebih, peminjaman ditolak.
4. Jika jumlah buku belum mencapai 3, program mengecek status buku.
5. Jika status buku "dipinjam", peminjaman ditolak.
6. Jika buku tersedia, judul buku dimasukkan ke dalam daftar.
7. Program menampilkan pesan bahwa peminjaman berhasil.

### Proses Pengembalian

1. Program menerima judul buku dan jumlah hari keterlambatan.
2. Program mengecek apakah judul buku terdapat di dalam daftar.
3. Jika buku tidak ada, program menampilkan pesan bahwa buku tidak sedang dipinjam.
4. Jika buku ada, program menampilkan pesan bahwa buku berhasil dikembalikan.
5. Program menghitung denda berdasarkan jumlah hari keterlambatan.
6. Jika tidak terlambat, denda adalah Rp0.
7. Jika terlambat, denda dihitung dari jumlah hari dikali Rp1.000.
8. Program menampilkan jumlah denda.

## 10. Flowchart

Alur program secara sederhana:

START
↓
Buat list `buku = []`
↓
Input judul dan status buku
↓
Cek jumlah buku >= 3?
├── Ya → Tampilkan "Gagal: Maksimal hanya 3 buku"
└── Tidak
↓
Cek status = "dipinjam"?
├── Ya → Tampilkan "Buku sedang dipinjam"
└── Tidak
↓
Tambahkan buku ke list
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

Catatan: dokumen ini sengaja dibuat mengikuti kode `main.dart` kamu yang sekarang. Jadi tidak ada bagian yang mengatakan buku dihapus dari list, karena di kode kamu memang belum ada `buku.remove(judul);`.
