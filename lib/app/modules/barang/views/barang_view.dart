import 'package:belajar_getx/app/modules/barang/views/barang_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_controller.dart';

class BarangView extends GetView<BarangController> {
  const BarangView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    "Form Input",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Nama Barang
                  TextFormField(
                    controller: controller.namaBarangC,
                    decoration: InputDecoration(
                      labelText: 'Nama Barang',
                      prefixIcon: const Icon(Icons.inventory_2),
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? "Nama barang tidak boleh kosong"
                        : null,
                  ),
                  const SizedBox(height: 20),

                  // Jumlah
                  TextFormField(
                    controller: controller.jumlahC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Jumlah',
                      prefixIcon: const Icon(Icons.format_list_numbered),
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Jumlah tidak boleh kosong";
                      if (int.tryParse(value) == null)
                        return "Jumlah harus angka";
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Harga
                  TextFormField(
                    controller: controller.hargaC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Harga per Unit',
                      prefixIcon: const Icon(Icons.price_change),
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Harga tidak boleh kosong";
                      if (int.tryParse(value) == null)
                        return "Harga harus angka";
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Kategori
                  Obx(
                    () => DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Pilih Kategori',
                        prefixIcon: const Icon(Icons.category),
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      value: controller.kategori.value,
                      items: controller.daftarKategori
                          .map((kategori) => DropdownMenuItem(
                                value: kategori,
                                child: Text(kategori),
                              ))
                          .toList(),
                      onChanged: (value) => controller.kategori.value = value!,
                      validator: (value) => value == null || value.isEmpty
                          ? "Kategori wajib dipilih"
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tanggal (tanpa Obx)
                  TextFormField(
                    readOnly: true,
                    controller: controller.dateC,
                    decoration: InputDecoration(
                      labelText: 'Tanggal',
                      prefixIcon: const Icon(Icons.calendar_today),
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onTap: () => controller.pickDate(),
                    validator: (value) => value == null || value.isEmpty
                        ? "Tanggal harus dipilih"
                        : null,
                  ),
                  const SizedBox(height: 30),

                  // Tombol Submit
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.hitungTotal();
                        Get.to(() => const OutputView());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'Simpan',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
