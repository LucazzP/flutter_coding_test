import 'package:dartz/dartz.dart';
import 'package:foo/src/core/failures.dart';
import 'package:foo/src/modules/home/domain/entities/album_entity.dart';
import 'package:foo/src/modules/home/domain/entities/image_entity.dart';

abstract class PhotoRepository {
  Future<Either<Failure, List<ImageEntity>>> getPhotos();
  Future<Either<Failure, List<AlbumEntity>>> getAlbums();
}
