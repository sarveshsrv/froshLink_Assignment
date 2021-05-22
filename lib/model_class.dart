class Photo {
  final String title;
  final String thumbnailUrl;

  Photo({this.title, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
