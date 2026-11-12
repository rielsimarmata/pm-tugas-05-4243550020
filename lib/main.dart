import 'package:material_ui/material_ui.dart';

import 'models/menu_item.dart';
import 'widgets/kartu_menu.dart';

const Color _warnaBenih = Color(0xFF8B3D2E);

void main() {
  runApp(const MenuUmkmApp());
}

class MenuUmkmApp extends StatelessWidget {
  const MenuUmkmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bika Ambon Kak Rosa',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _warnaBenih)),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _warnaBenih,
          brightness: Brightness.dark,
        ),
      ),
      home: const HalamanMenu(),
    );
  }
}

// Stateless karena halaman hanya menyusun data menu dan tidak mengubah state.
class HalamanMenu extends StatelessWidget {
  const HalamanMenu({super.key});

  static const List<MenuItem> _menu = [
    MenuItem(nama: 'Bika Ambon Original', harga: 35000, kategori: 'Kue'),
    MenuItem(nama: 'Bika Ambon Pandan', harga: 38000, kategori: 'Kue'),
    MenuItem(nama: 'Bika Ambon Keju', harga: 42000, kategori: 'Kue'),
    MenuItem(nama: 'Bika Ambon Mini', harga: 15000, kategori: 'Camilan'),
  ];

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Menu UMKM Kuliner Medan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://images.unsplash.com/photo-1608198093002-ad4e00548482?w=1000',
              height: 190,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) => progress == null
                  ? child
                  : SizedBox(
                      height: 190,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: progress.expectedTotalBytes == null
                              ? null
                              : progress.cumulativeBytesLoaded /
                                  progress.expectedTotalBytes!,
                        ),
                      ),
                    ),
              errorBuilder: (context, error, stackTrace) => Container(
                height: 190,
                color: warna.surfaceContainerHighest,
                alignment: Alignment.center,
                child: Icon(Icons.bakery_dining_outlined, size: 64, color: warna.primary),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Bika Ambon Kak Rosa', style: teks.headlineSmall),
          const SizedBox(height: 4),
          Text(
            'Bika Ambon rumahan dengan rasa khas Medan, dibuat segar setiap hari.',
            style: teks.bodyMedium?.copyWith(color: warna.onSurfaceVariant),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.chat_outlined),
            label: const Text('Hubungi / Pesan'),
          ),
          const SizedBox(height: 20),
          Text('Kontak', style: teks.titleLarge),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.email_outlined),
                  title: Text('Email'),
                  subtitle: Text('pesan@bikaambonkakrosa.id'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.phone_outlined),
                  title: Text('Telepon'),
                  subtitle: Text('+62 812-3456-7890'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.location_on_outlined),
                  title: Text('Alamat'),
                  subtitle: Text('Jl. Mojopahit, Medan Petisah, Medan'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text('Daftar Menu', style: teks.titleLarge),
          const SizedBox(height: 8),
          for (final item in _menu)
            KartuMenu(nama: item.nama, harga: item.harga, kategori: item.kategori),
        ],
      ),
    );
  }
}

