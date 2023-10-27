import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/Matches_Database.dart';
import 'package:flutter_application_2/Model/matches_attrib.dart';
import 'package:flutter_application_2/View/Screens/Edit_Match_Details.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class UpcomingNavBar extends StatefulWidget {
  const UpcomingNavBar({super.key});

  @override
  State<UpcomingNavBar> createState() => _UpcomingNavBarState();
}

class _UpcomingNavBarState extends State<UpcomingNavBar> {
  List<TheMatches> matches = [];
  late MyDb db = MyDb();

  @override
  void initState() {
    super.initState();
    loadMatches();
    db = MyDb();
  }

  Future<void> loadMatches() async {
    await db.initializeDb();
    List<TheMatches> data = await db.getFromDb();
    setState(() {
      matches = data
          .where((match) =>
              match.firstTeam != null &&
              match.secondTeam != null &&
              match.duration != null)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return matches.isEmpty
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
               AppLocalizations.of(context)!.nomatches.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          )
        : ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white10,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, bottom: 15, top: 15, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          matches[index].firstTeam.toString(),
                          style: const TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 35, bottom: 10, top: 10, right: 50),
                            child: Text(
                              'VS',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 9),
                            child: Text(
                              '${matches[index].duration.toString()} pm',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 9),
                            child: Text(
                              matches[index].location.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(
                          matches[index].secondTeam.toString(),
                          style: const TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: IconButton(
                            onPressed: () async {
                              await db.deleteMatch(matches[index].duration);
                              setState(() {
                                matches.removeAt(index);
                              });
                              print('match removed !');
                            },
                            icon: const Icon(Icons.delete),
                            iconSize: 20,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: IconButton(
                          onPressed: () async {
                            TheMatches updatedMatch = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditMatchScreen(match: matches[index]),
                                ));

                            setState(() {
                              matches[index] = updatedMatch;
                            });
                          },
                          icon: const Icon(Icons.edit),
                          iconSize: 20,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
