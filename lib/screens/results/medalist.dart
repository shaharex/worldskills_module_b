class Medalist {
  final String skill;
  final String portrait;
  final String name;

  Medalist({
    required this.skill,
    required this.portrait,
    required this.name,
  });

  factory Medalist.fromJson(Map<String, dynamic> json) {
    return Medalist(
      skill: json['skill'] as String,
      portrait: json['portrait'] as String,
      name: json['name'] as String,
    );
  }
}
