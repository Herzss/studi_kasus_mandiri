import 'package:flutter/material.dart';

class RestoProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _pesanan = [];

  // method untuk mendapatkan daftar pesanan
  List<Map<String, dynamic>> get pesanan => _pesanan;
  // method untuk mendapatkan jumlah item di pesanan
  int get totalItemPesanan => _pesanan.length;
  // method untuk mendapatkan total harga pesanan
  int get totalBayar {
    int total = 0;
    for (var p in _pesanan) {
      total += int.parse(p['subtotal']);
    }
    return total;
  }

  // method untuk menambahkan item ke pesanan
  void tambahItem(Map<String, dynamic> item) {
    if (_pesanan.any((p) => p['id'] == item['id'])) {
      // jika item sudah ada di pesanan, update jumlahnya
      final index = _pesanan.indexWhere((p) => p['id'] == item['id']);
      _pesanan[index]['jumlah'] += item['jumlah'];
      _pesanan[index]['subtotal'] =
          _pesanan[index]['jumlah'] * int.parse(_pesanan[index]['harga']);
    } else {
      // jika item belum ada di pesanan, tambahkan sebagai item baru
      _pesanan.add(item);
    }
    notifyListeners();
  }

  void hapusItemPesanan(int noPesanan) {
    _pesanan.removeAt(noPesanan);
    notifyListeners();
  }

  void kosongkanPesanan() {
    _pesanan.clear();
    notifyListeners();
  }
}
