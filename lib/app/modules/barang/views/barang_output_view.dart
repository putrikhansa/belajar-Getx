import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_controller.dart';
import 'barang_view.dart';

class OutputView extends GetView<BarangController> {
  const OutputView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Hasil Transaksi"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Detail Transaksi",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent.shade700,
                          ),
                        ),
                      ),
                      const Divider(height: 30, thickness: 1),
                      _buildInfoRow("Nama Barang", controller.namaBarangC.text),
                      _buildInfoRow("Kategori", controller.kategori.value),
                      _buildInfoRow("Jumlah", controller.jumlahC.text),
                      _buildInfoRow(
                          "Harga per Unit", "Rp${controller.hargaC.text}"),
                      _buildInfoRow("Tanggal", controller.formattedDate),
                      const SizedBox(height: 12),
                      _buildInfoRow(
                        "Total Sebelum Diskon",
                        "Rp${controller.total.value}",
                        isHighlight: controller.total.value != 0,
                      ),
                      _buildInfoRow(
                        "Total Setelah Diskon",
                        "Rp${controller.totalDiskon.value}",
                        isHighlight: controller.totalDiskon.value != 0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tombol Kembali
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // warna tombol biru
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      label: const Text(
                        "Kembali",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Tombol Reset Form
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent, // warna tombol merah
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        controller.clearForm();
                        Get.offAll(() => const BarangView());
                      },
                      icon: const Icon(Icons.refresh, color: Colors.white),
                      label: const Text(
                        "Reset Form",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {bool isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 16, color: Colors.black87)),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
              color: isHighlight ? Colors.blueAccent : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
