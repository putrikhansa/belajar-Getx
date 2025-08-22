import 'package:belajar_getx/app/data/models/album_model.dart';
import 'package:get/get.dart';

class AlbumService extends GetConnect {
  Future<List<Album>> fetchAlbums() async {
    final response = await get("https://jsonplaceholder.typicode.com/albums");

    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Error fetching albums");
    } else {
      final List<dynamic> data = response.body;
      return data.map((e) => Album.fromJson(e)).toList();
    }
  }
}
