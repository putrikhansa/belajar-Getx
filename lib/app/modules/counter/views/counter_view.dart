import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController c = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("CounterView"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // untuk kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Angka Sekarang:"),
            const SizedBox(height: 10),
            Obx(() => Text(
                  "${c.count}",
                  style: TextStyle(
                    fontSize: (20 + c.count.value.toDouble()).clamp(20, 70),
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: c.decrement,
                  child: const Text("-"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: c.increment,
                  child: const Text("+"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
