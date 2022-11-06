import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foo/src/modules/home/domain/entities/album_entity.dart';
import 'package:foo/src/modules/home/domain/entities/image_entity.dart';
import 'package:foo/src/modules/home/presentation/widgets/image_tile_widget.dart';
import 'package:foo/src/presentation/base/pages/base.page.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void initState() {
    controller.refresh();
    super.initState();
  }

  @override
  PreferredSizeWidget appBar(BuildContext ctx) => AppBar(title: const Text('Albums app'));

  @override
  Widget child(context, constrains) {
    return Observer(builder: (context) {
      final photos = controller.photos.value;
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 16,
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          final photo = photos[index];
          final album = controller.albums.value.firstWhere((album) => album.id == photo.albumId,
              orElse: () => const AlbumEntity(id: 0));
          return InkWell(
            onTap: () => openImage(photo),
            child: ImageTileWidget(
              imageUrl: photo.thumbnailUrl,
              albumTitle: album.title,
              photoTitle: photo.title,
            ),
          );
        },
      );
    });
  }

  void openImage(ImageEntity image) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(8),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(image.title),
              IconButton(
                  onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.close))
            ],
          ),
          content: Image.network(image.url),
        );
      },
    );
  }
}
