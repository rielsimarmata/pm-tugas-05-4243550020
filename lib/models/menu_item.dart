// Impor seragam sesuai spesifikasi tugas; model data tidak memakai widget UI.
// ignore: unused_import
import 'package:material_ui/material_ui.dart';

// Model sederhana tanpa state karena hanya menyimpan data menu.
class MenuItem {
  const MenuItem({required this.nama, required this.harga, required this.kategori});

  final String nama;
  final int harga;
  final String kategori;
}

