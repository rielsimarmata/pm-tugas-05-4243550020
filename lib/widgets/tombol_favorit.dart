import 'package:material_ui/material_ui.dart';

// Stateful hanya untuk menyimpan keadaan favorit tombol ini.
class TombolFavorit extends StatefulWidget {
  const TombolFavorit({super.key, required this.namaMenu});

  final String namaMenu;

  @override
  State<TombolFavorit> createState() => _TombolFavoritState();
}

class _TombolFavoritState extends State<TombolFavorit> {
  bool _favorit = false;

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    return IconButton(
      tooltip: _favorit ? 'Hapus dari favorit' : 'Tambahkan ke favorit',
      onPressed: () {
        setState(() => _favorit = !_favorit);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _favorit
                  ? '${widget.namaMenu} ditambahkan ke favorit'
                  : '${widget.namaMenu} dihapus dari favorit',
            ),
          ),
        );
      },
      icon: Icon(
        _favorit ? Icons.favorite : Icons.favorite_border,
        color: warna.primary,
      ),
    );
  }
}
