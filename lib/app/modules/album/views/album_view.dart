import 'package:belajar_getx/app/modules/album/views/album_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/album_controller.dart';

class AlbumView extends GetView<AlbumController> {
  const AlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.albums.isEmpty) {
          return const Center(child: Text("Tidak ada album"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.albums.length,
          itemBuilder: (context, index) {
            final album = controller.albums[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(album.id.toString()),
                ),
                title: Text(
                  album.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("User ID: ${album.userId}"),
                onTap: () {
                  Get.to(() => AlbumDetailView(album: album));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
