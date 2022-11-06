import 'package:dartz/dartz.dart';
import 'package:foo/src/core/failures.dart';
import 'package:foo/src/data/utils/call_either.dart';
import 'package:foo/src/extensions/iterable.ext.dart';
import 'package:foo/src/modules/home/data/datasources/photo_datasource.dart';
import 'package:foo/src/modules/home/domain/entities/album_entity.dart';
import 'package:foo/src/modules/home/domain/entities/image_entity.dart';
import 'package:foo/src/modules/home/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  const PhotoRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<ImageEntity>>> getPhotos() {
    return callEither<List<ImageEntity>, List<Map>>(
      _dataSource.getPhotos,
      processResponse: (value) async =>
          Right(value.map(ImageEntity.fromMap).whereNotNull().toList()),
    );
  }

  @override
  Future<Either<Failure, List<AlbumEntity>>> getAlbums() {
    return callEither<List<AlbumEntity>, List<Map>>(
      _dataSource.getAlbums,
      processResponse: (value) async =>
          Right(value.map(AlbumEntity.fromMap).whereNotNull().toList()),
    );
  }
}
