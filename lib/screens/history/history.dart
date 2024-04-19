class History {
  final String title;
  final String date;
  final String logo;
  final String description;

  History({
    required this.title,
    required this.date,
    required this.logo,
    required this.description,
  });

  static History fromJson(json) => History(
        title: json["title"],
        date: json["date"],
        logo: json["logo"],
        description: json["description"],
      );
}
