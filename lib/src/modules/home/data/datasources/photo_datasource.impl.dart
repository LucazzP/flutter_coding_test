import 'package:foo/src/data/remote/dio_client.dart';
import 'package:foo/src/modules/home/data/datasources/photo_datasource.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final DioClient api;

  const PhotoDataSourceImpl(this.api);

  @override
  Future<List<Map>> getPhotos() async {
    final res = await api.get('test/test-photos-real');
    return List<Map>.from(res.data ?? []);
  }

  @override
  Future<List<Map>> getAlbums() async {
    final res = await api.get('test/test-albums-real');
    return List<Map>.from(res.data ?? []);
  }
}
