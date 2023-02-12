class Corona {
  final String country;
  final String flag;
  final int cases;
  final int deaths;
  final int recovered;
  final int critical;
  final int tests;
  final int population;
  final int todaycases;
  final int todaydeaths;
  final int todayrecovered;

  Corona({
    required this.country,
    required this.flag,
    required this.cases,
    required this.deaths,
    required this.recovered,
    required this.critical,
    required this.tests,
    required this.population,
    required this.todaycases,
    required this.todaydeaths,
    required this.todayrecovered,
  });

  factory Corona.fromJson({required Map<String, dynamic> json}) {
    return Corona(
        country: json["country"],
        flag: json['countryInfo']['flag'],
        cases: json['cases'],
        deaths: json['deaths'],
        recovered: json['recovered'],
        critical: json['critical'],
        tests: json['tests'],
        population: json['population'],
        todaycases: json['todayCases'],
        todaydeaths: json['todayDeaths'],
        todayrecovered: json['todayRecovered']);
  }
}
