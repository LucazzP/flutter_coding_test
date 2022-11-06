class ImageEntity {
  const ImageEntity({
    required this.id,
    required this.albumId,
    this.title = '',
    this.url = '',
    this.thumbnailUrl = '',
  });

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  ImageEntity copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) =>
      ImageEntity(
        albumId: albumId ?? this.albumId,
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      );

  static ImageEntity? fromMap(Map<dynamic, dynamic> json) {
    if (json.isEmpty) return null;
    return ImageEntity(
      id: json["id"],
      albumId: json["albumId"],
      title: json["title"] ?? '',
      url: json["url"] ?? '',
      thumbnailUrl: json["thumbnailUrl"] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
