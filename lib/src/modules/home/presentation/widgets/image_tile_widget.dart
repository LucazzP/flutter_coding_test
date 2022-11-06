import 'package:flutter/material.dart';

class ImageTileWidget extends StatelessWidget {
  final String imageUrl;
  final String albumTitle;
  final String photoTitle;

  const ImageTileWidget({
    Key? key,
    required this.imageUrl,
    required this.albumTitle,
    required this.photoTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(imageUrl),
        Text(albumTitle),
        Text(photoTitle),
      ],
    );
  }
}
