import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  final count = 0.obs;

  void increment() {
    if (count.value < 50) {
      // maksimal 50
      count.value++;
    } else {
      Get.snackbar(
        "Stop",
        "Nilai anda sudah mencapai 50",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.amber,
        colorText: Colors.white,
      );
    }
  }

  void decrement() {
    if (count.value > 0) {
      // minimal 0
      count.value--;
    } else {
      Get.snackbar(
        "Stop",
        "Nilai tidak boleh kurang dari 0",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
