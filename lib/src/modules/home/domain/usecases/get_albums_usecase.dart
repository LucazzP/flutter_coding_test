import 'package:dartz/dartz.dart';
import 'package:foo/src/core/failures.dart';
import 'package:foo/src/core/use_case.abstract.dart';
import 'package:foo/src/modules/home/domain/entities/album_entity.dart';
import 'package:foo/src/modules/home/domain/repository/photo_repository.dart';

class GetAlbumsUseCase implements BaseUseCase<List<AlbumEntity>, Unit> {
  final PhotoRepository _repo;

  const GetAlbumsUseCase(this._repo);

  @override
  Future<Either<Failure, List<AlbumEntity>>> call([Unit param = unit]) {
    return _repo.getAlbums();
  }
}
