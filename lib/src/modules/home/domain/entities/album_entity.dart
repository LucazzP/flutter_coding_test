class AlbumEntity {
  final int id;
  final String title;

  const AlbumEntity({
    required this.id,
    this.title = '',
  });

  AlbumEntity copyWith({
    int? id,
    String? title,
  }) {
    return AlbumEntity(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  static AlbumEntity? fromMap(Map<dynamic, dynamic> map) {
    if (map.isEmpty) return null;
    return AlbumEntity(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }

  @override
  String toString() => 'AlbumEntity(id: $id, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlbumEntity && other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
