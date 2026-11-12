// Model data sederhana tanpa state; hanya menyimpan data menu.
class MenuItem {
  const MenuItem({
    required this.nama,
    required this.harga,
    required this.kategori,
  });

  final String nama;
  final int harga;
  final String kategori;
}
