import 'package:flutter/widgets.dart';

class ScoreCounterProvider extends ChangeNotifier {
  int TeamOnecounter = 0;
  int TeamTwocounter = 0;
  void increaseTeamOne() {
    TeamOnecounter += 3;

    notifyListeners();
  }

  void increaseTeamTwo() {
    TeamTwocounter += 3;

    notifyListeners();
  }
}
