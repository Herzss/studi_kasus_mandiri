import 'package:flutter/material.dart';

class RestoProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _pesanan = [];

  // method untuk mendapatkan daftar pesanan
  List<Map<String, dynamic>> get pesanan => _pesanan;
  // method untuk mendapatkan jumlah item di pesanan
  int get totalItemPesanan {
    int total = 0;

    for (var item in _pesanan) {
      total += int.parse(item['jumlah']);
    }
    return total;
  }

  // method untuk mendapatkan total harga pesanan
  int get totalBayar {
    int total = 0;
    for (var item in _pesanan) {
      total += int.parse(item['subtotal']);
    }
    return total;
  }

  // method untuk menambahkan item ke pesanan
  void tambahItem(Map<String, dynamic> item) {
    int index = _pesanan.indexWhere((pesanan) => pesanan['id'] == item['id']);

    if (index != -1) {
      int jumlah = int.parse(_pesanan[index]['jumlah']);
      jumlah++;

      _pesanan[index]['jumlah'] = jumlah.toString();
      _pesanan[index]['subtotal'] =
          (jumlah * int.parse(_pesanan[index]['harga'])).toString();
    } else {
      _pesanan.add({
        'id': item['id'],
        'jumlah': '1',
        'harga': item['harga'],
        'subtotal': item['harga'],
      });
    }

    notifyListeners();
  }

  void hapusItemPesanan(String id) {
    _pesanan.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }

  void kosongkanPesanan() {
    _pesanan.clear();
    notifyListeners();
  }
}
