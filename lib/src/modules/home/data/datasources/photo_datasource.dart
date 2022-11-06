abstract class PhotoDataSource {
  Future<List<Map>> getPhotos();
  Future<List<Map>> getAlbums();
}
