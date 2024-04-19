class News {
  final String image;
  final String title;
  final String summary;
  final String content;

  const News({
    required this.image,
    required this.title,
    required this.summary,
    required this.content,
  });

  static News fromJson(json) => News(
        image: json["image"],
        title: json["title"],
        summary: json["summary"],
        content: json["content"],
      );
}
