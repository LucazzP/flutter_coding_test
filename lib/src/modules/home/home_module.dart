import 'package:flutter_modular/flutter_modular.dart';
import 'package:foo/src/modules/home/data/datasources/photo_datasource.dart';
import 'package:foo/src/modules/home/data/datasources/photo_datasource.impl.dart';
import 'package:foo/src/modules/home/data/repository/photo_repository.impl.dart';
import 'package:foo/src/modules/home/domain/repository/photo_repository.dart';
import 'package:foo/src/modules/home/domain/usecases/get_albums_usecase.dart';
import 'package:foo/src/modules/home/domain/usecases/get_photos_usecase.dart';
import 'presentation/pages/home/home_controller.dart';

import 'presentation/pages/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<PhotoDataSource>((i) => PhotoDataSourceImpl(i())),
    Bind.factory<PhotoRepository>((i) => PhotoRepositoryImpl(i())),
    Bind.factory((i) => GetPhotosUseCase(i())),
    Bind.factory((i) => GetAlbumsUseCase(i())),
    Bind.lazySingleton((i) => HomeController(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
