import 'flag.dart';
import 'name.dart';

class Country {
  final Flags flags;
  final Name name;
  final List<String> capital;
  final String region;
  final Map<String, String> languages;
  final int population;

  Country({
    required this.flags,
    required this.name,
    required this.capital,
    required this.region,
    required this.languages,
    required this.population,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      flags: Flags.fromJson(json['flags']),
      name: Name.fromJson(json['name']),
      capital: List<String>.from(json['capital']),
      region: json['region'],
      languages: Map<String, String>.from(json['languages']),
      population: json['population'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flags': flags.toJson(),
      'name': name.toJson(),
      'capital': capital,
      'region': region,
      'languages': languages,
      'population': population,
    };
  }
}