class Results {
  final String member;
  final int rank;
  final int gold;
  final int silver;
  final int bronze;
  final int excellence;

  const Results({
    required this.member,
    required this.rank,
    required this.gold,
    required this.silver,
    required this.bronze,
    required this.excellence,
  });

  static Results fromJson(json) => Results(
        member: json["member"],
        rank: json["rank"],
        gold: json["gold"],
        silver: json["silver"],
        bronze: json["bronze"],
        excellence: json["excellence"],
      );
}
