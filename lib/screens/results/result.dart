import 'medalist.dart';

class Result {
  final List<Medalist> goldMedals;
  final List<Medalist> silverMedals;
  final List<Medalist> bronzeMedals;

  Result({
    required this.goldMedals,
    required this.silverMedals,
    required this.bronzeMedals,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    List<Medalist> parseMedalists(List<dynamic> medalists) {
      return medalists.map((data) => Medalist.fromJson(data)).toList();
    }

    return Result(
        goldMedals: parseMedalists(json['gold_medals']),
        silverMedals: parseMedalists(json['silver_medals']),
        bronzeMedals: parseMedalists(json['bronze_medals']));
  }
}
