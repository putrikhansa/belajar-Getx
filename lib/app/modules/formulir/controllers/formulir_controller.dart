import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormulirController extends GetxController {
  //TODO: Implement FormulirController

  final nameController = TextEditingController();

  final selectedCourses = ''.obs;
  List<String> courses = ['FLutter', 'Dart', 'Java', 'Python', 'JavaScript'];

  final gender = ''.obs;

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

  void clearForm() {
    nameController.clear();
    selectedCourses.value = '';
    gender.value = '';
    selectedDate.value = DateTime.now();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
