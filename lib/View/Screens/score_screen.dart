import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/Score_counter.dart';

import 'package:provider/provider.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Provider.of<ScoreCounterProvider>(context, listen: false)
                        .increaseTeamOne();
                  },
                  icon: const Icon(Icons.add)),
              const Text('TEAM 1'),
              Consumer<ScoreCounterProvider>(builder: (context, value, child) {
                return Text(value.TeamOnecounter.toString());
              }),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Provider.of<ScoreCounterProvider>(context, listen: false)
                        .increaseTeamTwo();
                  },
                  icon: const Icon(Icons.add)),
              const Text('TEAM 2'),
              Consumer<ScoreCounterProvider>(builder: (context, value, child) {
                return Text(value.TeamTwocounter.toString());
              }),
            ],
          )
        ],
      ),
    );
  }
}
