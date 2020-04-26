class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  @override
  String toString() {
    return "Album(id: ${this.id}, userId: ${this.userId}, title: ${this.title})";
  }
}