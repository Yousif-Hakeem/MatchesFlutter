import 'dart:convert';

import 'package:flutter_application_2/Model/Matches_attributes.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<List<Matches>> getMatches() async {
    var response = await http.get(
        Uri.parse(
            'https://apiv3.apifootball.com/?action=get_leagues&country_id=6&APIkey=08f485dc8855a2c2f32915cfb5927a654fdde1ca92dce6d384335ef96a31979d'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = jsonDecode(response.body);
      List<Matches> matches = [];
      for (var team in data) {
        matches.add(Matches.fromJson(team));
      }
      return matches;
    } else {
      print("somthing went wrong code : ${response.statusCode}");
      return [];
    }
  }
}
