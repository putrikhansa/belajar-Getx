import 'package:belajar_getx/app/modules/formulir/views/formulir_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';

class FormulirView extends GetView<FormulirController> {
  const FormulirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // appBar: AppBar(
      //   title: const Text('Formulir Pendaftaran'),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  " Isi Formulir ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
                const SizedBox(height: 20),

                // Nama
                TextField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.grey[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Kursus
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Pilih Kursus',
                    prefixIcon: const Icon(Icons.book),
                    filled: true,
                    fillColor: Colors.grey[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: controller.courses.map((course) {
                    return DropdownMenuItem(
                      value: course,
                      child: Text(course),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.selectedCourses.value = value!;
                  },
                ),
                const SizedBox(height: 20),

                // Gender
                Obx(
                  () => Column(
                    children: [
                      RadioListTile(
                        title: const Text("Laki - laki"),
                        value: 'Laki - laki',
                        groupValue: controller.gender.value,
                        onChanged: (value) {
                          controller.gender.value = value!;
                        },
                      ),
                      RadioListTile(
                        title: const Text("Perempuan"),
                        value: 'Perempuan',
                        groupValue: controller.gender.value,
                        onChanged: (value) {
                          controller.gender.value = value!;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Tanggal
                Obx(
                  () => TextField(
                    readOnly: true,
                    controller:
                        TextEditingController(text: controller.formattedDate),
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir',
                      prefixIcon: const Icon(Icons.calendar_today),
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onTap: () => controller.pickDate(),
                  ),
                ),
                const SizedBox(height: 30),

                // Tombol Submit
                ElevatedButton(
                  onPressed: () => Get.to(FormulirOutputView()),
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
                    'Submit',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
