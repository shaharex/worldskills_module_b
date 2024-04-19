class Result {
  final List<GoldMedals> goldMedals;

  const Result({
    required this.goldMedals,
  });

  static Result fromJson(json) => Result(
        goldMedals: json["gold_medals"],
      );
}

class GoldMedals {
  final String skill;
  final String portrait;
  final String name;

  const GoldMedals({
    required this.skill,
    required this.portrait,
    required this.name,
  });

  static GoldMedals fromJson(json) => GoldMedals(
        skill: json["skill"],
        portrait: json["portrait"],
        name: json["name"],
      );
}
