// Maksimal boleh pinjem 3 buku
bool batasPinjam(List<String> buku) {
  return buku.length >= 3;
}
// Proses Pinjam Buku
void pinjamBuku(List<String> buku, String judul, String status) {
  if (batasPinjam(buku)) {
    print("Gagal: Maksimal hanya 3 buku");
    return;
  }
 if (status == "dipinjam") {
    print("Gagal: Buku $judul sedang dipinjam");
    return;
  }
  buku.add(judul);
  print("Berhasil meminjam $judul");
}
// Hitung denda Rp1.000 per hari
int hitungDenda(int hari) {
  return hari > 0 ? hari * 1000 : 0;
}
// Proses mengembalikan buku
void kembalikanBuku(List<String> buku, String judul, int telat) {
  if (!buku.contains(judul)) {
    print("Buku $judul tidak dipinjam");
    return;
  }
  print("Berhasil mengembalikan $judul");
  print("Denda: Rp${hitungDenda(telat)}");
}
void main() {
    // Nyiapin list kosong menyimpan buku yang dipinjam
  List<String> buku = [];
  print("--- PINJAM ---");
 // Coba pinjam beberapa buku
  pinjamBuku(buku, "Web Dasar", "tersedia");
  pinjamBuku(buku, "Basis Data", "dipinjam");
  pinjamBuku(buku, "Python", "tersedia");

  print("--- KEMBALIIN BUKU ---");
  // Coba balikin buku dan cek denda
  kembalikanBuku(buku, "Web Dasar", 0);
  kembalikanBuku(buku, "Python", 4);
}
