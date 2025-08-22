import 'package:belajar_getx/app/modules/album/controllers/album_controller.dart';
import 'package:belajar_getx/app/modules/album/views/album_view.dart';
import 'package:belajar_getx/app/modules/counter/controllers/counter_controller.dart';
import 'package:belajar_getx/app/modules/counter/views/counter_view.dart';
import 'package:belajar_getx/app/modules/formulir/controllers/formulir_controller.dart';
import 'package:belajar_getx/app/modules/formulir/views/formulir_view.dart';
import 'package:belajar_getx/app/modules/home/controllers/home_controller.dart';
import 'package:belajar_getx/app/modules/barang/controllers/barang_controller.dart';
import 'package:belajar_getx/app/modules/barang/views/barang_view.dart';
import 'package:belajar_getx/app/modules/post/controllers/post_controller.dart';
import 'package:belajar_getx/app/modules/post/views/post_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // inject biar ga error "Controller not found"
    Get.put(FormulirController());
    Get.put(CounterController());
    Get.put(BarangController());
    Get.put(PostController());
    Get.put(AlbumController());

    final titles = ["Formulir", "Counter", "Barang", "Post", "Album"];

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            titles[controller.currentIndex.value],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          elevation: 0,
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            FormulirView(), // jangan ada AppBar lagi di dalamnya
            CounterView(),
            BarangView(),
            PostView(),
            AlbumView(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: SizedBox(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () => controller.currentIndex.value = 0,
                  icon: const Icon(Icons.assignment),
                  label: const Text("Formulir"),
                ),
                TextButton.icon(
                  onPressed: () => controller.currentIndex.value = 1,
                  icon: const Icon(Icons.calculate),
                  label: const Text("Counter"),
                ),
                TextButton.icon(
                  onPressed: () => controller.currentIndex.value = 2,
                  icon: const Icon(Icons.shopping_bag),
                  label: const Text("Barang"),
                ),
                TextButton.icon(
                  onPressed: () => controller.currentIndex.value = 3,
                  icon: const Icon(Icons.article),
                  label: const Text("Post"),
                ),
                TextButton.icon(
                  onPressed: () => controller.currentIndex.value = 4,
                  icon: const Icon(Icons.photo_album),
                  label: const Text("Album"),
                ),
                // TextButton.icon(
                //   onPressed: () {
                //     controller.currentIndex.value = 4;
                //   },
                //   icon: const Icon(Icons.photo_album),
                //   label: const Text("Album"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
