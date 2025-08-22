import 'package:belajar_getx/app/services/album_service-getx.dart';
import 'package:get/get.dart';
import 'package:belajar_getx/app/data/models/album_model.dart';

class AlbumController extends GetxController {
  var albums = <Album>[].obs;
  var isLoading = true.obs;

  final AlbumService _service = AlbumService();

  @override
  void onInit() {
    super.onInit();
    getAlbums();
  }

  void getAlbums() async {
    try {
      isLoading(true);
      var result = await _service.fetchAlbums();
      albums.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
