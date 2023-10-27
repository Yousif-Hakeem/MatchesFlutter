import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/constants.dart';
import 'package:flutter_application_2/View/Screens/Home.dart';
import 'package:flutter_application_2/View/Screens/Login.dart';
import 'package:flutter_application_2/View/Screens/Splash.dart';
import 'package:flutter_application_2/View/Screens/add_matches_screen.dart';
import 'package:flutter_application_2/View/Screens/profile.dart';
import 'package:flutter_application_2/View/Screens/upcoming_matches_screen.dart';

class Routing {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case pfilePath:
      //   return MaterialPageRoute(builder: (context) => const ProfileScreen());

      // case matchesPath:
      //   return MaterialPageRoute(builder: (context) => const AddMatches());

      // case upcomingPath:
      //   return MaterialPageRoute(builder: (context) => const UpcomingMatches());
      case '/':
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case loginScreenPath:
        return MaterialPageRoute(builder: (context) => Login());
      case ProfileScreenPath:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case HomeScreenPath:
        return MaterialPageRoute(builder: (context) => const Home());
      case addMatchesPath:
        return MaterialPageRoute(builder: (context) => const AddMatches());
      // case upcomingMatchesPath:
      //   return MaterialPageRoute(builder: (context) => const UpcomingMatches());
    }
    return null;
  }
}
