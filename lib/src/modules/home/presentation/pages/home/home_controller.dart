import 'package:foo/src/modules/home/domain/entities/album_entity.dart';
import 'package:foo/src/modules/home/domain/entities/image_entity.dart';
import 'package:foo/src/modules/home/domain/usecases/get_albums_usecase.dart';
import 'package:foo/src/modules/home/domain/usecases/get_photos_usecase.dart';
import 'package:foo/src/presentation/base/controller/base.store.dart';
import 'package:foo/src/presentation/base/controller/value_state.store.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase extends BaseStore with Store {
  final GetPhotosUseCase _getPhotosUseCase;
  final GetAlbumsUseCase _getAlbumsUseCase;

  _HomeControllerBase(this._getPhotosUseCase, this._getAlbumsUseCase);

  final photos = ValueState<List<ImageEntity>>([]);
  final albums = ValueState<List<AlbumEntity>>([]);

  @override
  Iterable<ValueState> get getStates => [photos, albums];

  Future<void> refresh() => Future.wait([_getAlbums(), _getPhotos()]);

  Future<void> _getPhotos() => photos.execute(_getPhotosUseCase);
  Future<void> _getAlbums() => albums.execute(_getAlbumsUseCase);
}
