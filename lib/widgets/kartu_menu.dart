import 'package:material_ui/material_ui.dart';

import 'tombol_favorit.dart';

// Stateless karena kartu hanya menampilkan data yang diterima dari parent.
class KartuMenu extends StatelessWidget {
  const KartuMenu({
    super.key,
    required this.nama,
    required this.harga,
    required this.kategori,
  });

  final String nama;
  final int harga;
  final String kategori;

  String _formatRupiah(int nilai) {
    final angka = nilai.toString();
    final buffer = StringBuffer();
    for (var i = 0; i < angka.length; i++) {
      if (i > 0 && (angka.length - i) % 3 == 0) buffer.write('.');
      buffer.write(angka[i]);
    }
    return 'Rp $buffer';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(nama),
        subtitle: Text(_formatRupiah(harga)),
        leading: Chip(label: Text(kategori)),
        trailing: TombolFavorit(namaMenu: nama),
      ),
    );
  }
}
