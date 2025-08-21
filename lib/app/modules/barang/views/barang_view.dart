import 'package:belajar_getx/app/modules/barang/views/barang_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_controller.dart';

class BarangView extends GetView<BarangController> {
  const BarangView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Input Data Barang"),
      //   centerTitle: true,
      // ),
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
                    "Input Data Barang",
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nama barang tidak boleh kosong";
                      }
                      return null;
                    },
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
                      if (value == null || value.isEmpty) {
                        return "Jumlah tidak boleh kosong";
                      }
                      if (int.tryParse(value) == null) {
                        return "Jumlah harus angka";
                      }
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
                      if (value == null || value.isEmpty) {
                        return "Harga tidak boleh kosong";
                      }
                      if (int.tryParse(value) == null) {
                        return "Harga harus angka";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Kategori
                  Obx(
                    () => DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Pilih Kategori',
                        prefixIcon: const Icon(Icons.category),
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      value: controller.kategori.value.isEmpty
                          ? null
                          : controller.kategori.value,
                      items: controller.daftarKategori.map((kategori) {
                        return DropdownMenuItem(
                          value: kategori,
                          child: Text(kategori),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.kategori.value = value!;
                      },
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return "Kategori wajib dipilih";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tanggal
                  Obx(
                    () => TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                        text: controller.formattedDate,
                      ),
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
                      validator: (value) {
                        if (controller.formattedDate.isEmpty) {
                          return "Tanggal harus dipilih";
                        }
                        return null;
                      },
                    ),
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
