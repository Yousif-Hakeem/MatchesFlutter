import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/Matches_attributes.dart';
import 'package:flutter_application_2/Model/web_service_Matches.dart';

class Teams extends StatefulWidget {
  const Teams({super.key});

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  late WebService _webService;
  List<Matches> matches = [];
  void getTeamsInfoFromAPI() async {
    List<Matches> data = await _webService.getMatches();
    setState(() {
      matches = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _webService = WebService();
    getTeamsInfoFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, i) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.network(matches[i].countryFlag.toString()),
                        SizedBox(
                          height: 16,
                        ),
                        if (matches[i].leagueLogo != null)
                          Image.network(
                            matches[i].leagueLogo.toString(),
                            width: 200,
                          ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(matches[i].countryName.toString()),
                        SizedBox(
                          height: 10,
                        ),
                        Text(matches[i].leagueId.toString()),
                        SizedBox(
                          height: 10,
                        ),
                        Text(matches[i].leagueSeason.toString()),
                        SizedBox(
                          height: 10,
                        ),
                        Text(matches[i].leagueName.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, i) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: matches.length),
    );
  }
}
