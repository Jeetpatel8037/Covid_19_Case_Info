import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Modeles/covid_19_modeles.dart';

class CoronaHelper {
  CoronaHelper._();

  static final CoronaHelper coronaHelper = CoronaHelper._();

  final String URL = "https://disease.sh/v3/covid-19/countries?sort=deaths";

  Future<List<Corona>?> fetchAllCasesRecordsData() async {
    http.Response res = await http.get(Uri.parse(URL));

    if (res.statusCode == 200) {
      List decodeData = jsonDecode(res.body);

      List<Corona> corona =
          decodeData.map((e) => Corona.fromJson(json: e)).toList();
      return corona;
    }
    return null;
  }
}
