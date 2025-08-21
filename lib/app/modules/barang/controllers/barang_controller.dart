import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BarangController extends GetxController {
  // Input field
  final namaBarangC = TextEditingController();
  final jumlahC = TextEditingController();
  final hargaC = TextEditingController();

  // Dropdown kategori
  var kategori = ''.obs;
  final List<String> daftarKategori = ['Makanan', 'Minuman', 'Alat Tulis'];

  // Perhitungan
  var total = 0.obs;
  var totalDiskon = 0.obs;

  // Optional: kalau mau pakai tanggal transaksi
  final selectedDate = DateTime.now().obs;
  String get formattedDate =>
      DateFormat('dd/MM/yyyy').format(selectedDate.value);

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  // Hitung total & diskon
  void hitungTotal() {
    int jumlah = int.tryParse(jumlahC.text) ?? 0;
    int harga = int.tryParse(hargaC.text) ?? 0;

    total.value = jumlah * harga;

    if (total.value >= 100000) {
      totalDiskon.value = (total.value * 0.9).toInt();
    } else {
      totalDiskon.value = total.value;
    }
  }

  // Reset form
  void clearForm() {
    namaBarangC.clear();
    jumlahC.clear();
    hargaC.clear();
    kategori.value = '';
    total.value = 0;
    totalDiskon.value = 0;
    selectedDate.value = DateTime.now();
  }

  @override
  void onClose() {
    namaBarangC.dispose();
    jumlahC.dispose();
    hargaC.dispose();
    super.onClose();
  }
}
