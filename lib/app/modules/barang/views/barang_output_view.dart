import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_controller.dart';

class OutputView extends GetView<BarangController> {
  const OutputView({super.key});

  Widget buildInfo(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                Text(value,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Hasil Input Data"),
        centerTitle: false,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "🧾 Detail Barang",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const Divider(),

                buildInfo("Nama Barang", controller.namaBarangC.text,
                    Icons.shopping_bag),
                buildInfo(
                    "Jumlah", controller.jumlahC.text, Icons.confirmation_num),
                buildInfo("Harga", "Rp ${controller.hargaC.text}",
                    Icons.attach_money),
                buildInfo("Kategori", controller.kategori.value ?? "-",
                    Icons.category),
                buildInfo("Tanggal", controller.dateC.text, Icons.date_range),

                const Divider(),
                // Total Sebelum Diskon
                Obx(() => buildInfo("Total Sebelum Diskon",
                    "Rp ${controller.total.value}", Icons.calculate)),
                // Total Setelah Diskon
                Obx(() => buildInfo("Total Setelah Diskon",
                    "Rp ${controller.totalBayar.value}", Icons.discount)),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text("Kembali"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[600],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        controller.clearForm();
                        Get.back();
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text("Reset"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
