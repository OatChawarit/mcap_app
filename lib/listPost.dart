class ListPost {
  ListPost({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  static ListPost fromJson(json) => ListPost(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );
}
