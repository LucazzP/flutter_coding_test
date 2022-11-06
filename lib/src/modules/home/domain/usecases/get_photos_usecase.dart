import 'package:dartz/dartz.dart';
import 'package:foo/src/core/failures.dart';
import 'package:foo/src/core/use_case.abstract.dart';
import 'package:foo/src/modules/home/domain/entities/image_entity.dart';
import 'package:foo/src/modules/home/domain/repository/photo_repository.dart';

class GetPhotosUseCase implements BaseUseCase<List<ImageEntity>, Unit> {
  final PhotoRepository _repo;

  const GetPhotosUseCase(this._repo);

  @override
  Future<Either<Failure, List<ImageEntity>>> call([Unit param = unit]) {
    return _repo.getPhotos();
  }
}
