import 'package:get/get.dart';

class HomeController extends GetxController {
  // index untuk bottom navigation
  var currentIndex = 0.obs;

  final count = 0.obs;

  void increment() => count.value++;
}

