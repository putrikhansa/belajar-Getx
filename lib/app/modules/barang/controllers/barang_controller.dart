import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BarangController extends GetxController {
  // Input field
  final namaBarangC = TextEditingController();
  final jumlahC = TextEditingController();
  final hargaC = TextEditingController();

  // Dropdown kategori
  var kategori = RxnString(); // bisa null
  final List<String> daftarKategori = ['Makanan', 'Minuman', 'Alat Tulis'];

  // Perhitungan
  var total = 0.obs;
  var totalBayar = 0.obs; // total setelah diskon

  // Tanggal transaksi
  final selectedDate = DateTime.now().obs;
  final dateC =
      TextEditingController(); // <-- ini controller untuk TextFormField tanggal

  String get formattedDate =>
      DateFormat('dd/MM/yyyy').format(selectedDate.value);

  @override
  void onInit() {
    super.onInit();
    dateC.text = formattedDate; // inisialisasi tanggal awal
  }

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      dateC.text = DateFormat('dd/MM/yyyy').format(picked); // update controller
    }
  }

  // Hitung total & diskon
  void hitungTotal() {
    int jumlah = int.tryParse(jumlahC.text) ?? 0;
    int harga = int.tryParse(hargaC.text) ?? 0;

    total.value = jumlah * harga;

    // Diskon 10% kalau total ≥ 100000
    if (total.value >= 100000) {
      totalBayar.value = (total.value * 0.9).toInt();
    } else {
      totalBayar.value = total.value;
    }
  }

  // Reset form
  void clearForm() {
    namaBarangC.clear();
    jumlahC.clear();
    hargaC.clear();
    kategori.value = null;
    total.value = 0;
    totalBayar.value = 0;
    selectedDate.value = DateTime.now();
    dateC.text = formattedDate;
  }

  @override
  void onClose() {
    namaBarangC.dispose();
    jumlahC.dispose();
    hargaC.dispose();
    dateC.dispose();
    super.onClose();
  }
}
