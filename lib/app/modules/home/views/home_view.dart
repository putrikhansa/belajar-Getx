import 'package:belajar_getx/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CounterView"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // langsung balik ke Home
            Get.offAll(() => const HomeView());
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.toNamed("/counter"),
          child: Text('Counter Page'),
        ),
      ),
    );
  }
}
