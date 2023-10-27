import 'package:flutter/material.dart';
import 'package:flutter_application_2/Cubits/lang_change/changeLang.dart';
import 'package:flutter_application_2/Cubits/lang_change/changeLangState.dart';
import 'package:flutter_application_2/Cubits/nav_Bar/navBarCubit.dart';
import 'package:flutter_application_2/Cubits/nav_Bar/navBar_States.dart';
import 'package:flutter_application_2/View/Screens/Teams_Screen.dart';

import 'package:flutter_application_2/View/Screens/Upcoming_Nav.dart';
import 'package:flutter_application_2/View/Screens/add_matches_screen.dart';
import 'package:flutter_application_2/View/Screens/firebaseLogin.dart';
import 'package:flutter_application_2/View/Screens/profile_nav_bar.dart';
import 'package:flutter_application_2/View/Widgets/Button_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [
    FirebaseLogin(),
    const ProfileNavigationBar(),
    // const AddMatchesNavBar(),
    const AddMatches(),
    const UpcomingNavBar(),
    const Teams()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white10,
          child: BlocBuilder<ChangeLangCubit, ChangeLangState>(
            builder: (BuildContext context, state) {
              return Center(
                child: CircleButton(
                    text: ChangeLangCubit.get(context).trigger == false
                        ? 'AR'
                        : 'EN',
                    onClick: ChangeLangCubit.get(context).changeLang),
              );
            },
          ),
        ),
        backgroundColor: Colors.white10,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.gameNight,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          backgroundColor: Colors.black,
        ),
        body: BlocBuilder<NavBarCubit, NavBarStates>(
          builder: (BuildContext context, state) {
            return screens[NavBarCubit.get(context).currentIndex];
          },
        ),
        bottomNavigationBar: BlocBuilder<NavBarCubit, NavBarStates>(
          builder: (BuildContext context, state) {
            return BottomNavigationBar(
                unselectedItemColor: Colors.white30,
                backgroundColor: Colors.white10,
                currentIndex: NavBarCubit.get(context).currentIndex,
                onTap: (index) {
                  NavBarCubit.get(context).switchScreens(index);
                },
                selectedItemColor: Colors.deepOrange,
                items: const [
                  BottomNavigationBarItem(
                      backgroundColor: Colors.white10,
                      icon: Icon(Icons.login),
                      label: 'Firebase Login'),
                  BottomNavigationBarItem(
                      backgroundColor: Colors.white10,
                      icon: Icon(Icons.person),
                      label: 'Profile'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_circle_outline_sharp),
                      label: 'add Matches'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.lan_sharp), label: 'Upcoming Matches'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.gamepad_outlined), label: 'Teams Info'),
                ]);
          },
        ));
  }
}













/////////////////cOOOOOOOOOOOOOOOOOOOOOOODEEE///////////////////////////







// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/Cubits/nav_Bar/navBarCubit.dart';

// import 'package:flutter_application_2/View/Screens/Upcoming_Nav.dart';
// import 'package:flutter_application_2/View/Screens/addMatches_nav.dart';
// import 'package:flutter_application_2/View/Screens/profile_nav_bar.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   NavBarCubit NavBar = NavBarCubit();
//   List<Widget> screens = [
//     // ProfileNavigationBar(),
//     Container(),
//     AddMatchesNavBar(),
//     UpcomingNavBar()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         backgroundColor: Colors.white10,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 40),
//           child: GestureDetector(
//             onTap: () {},
//             child: const ListTile(
//               textColor: Colors.white,
//               iconColor: Colors.white,
//               trailing: Icon(Icons.person),
//               title: Text('profile'),
//               hoverColor: Colors.deepOrange,
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white10,
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           'Game Night',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//         ),
//         backgroundColor: Colors.black,
//       ),
//       body: screens[NavBar.currentIndex.toInt()],
//       bottomNavigationBar: BottomNavigationBar(
//           unselectedItemColor: Colors.white30,
//           backgroundColor: Colors.white10,
//           currentIndex: NavBar.currentIndex.toInt(),
//           // onTap: NavBarCubit.switchScreens(NavBar.currentIndex)
//           onTap: (index) {
//             setState(() {
//               NavBar.currentIndex = index;
//             });
//           },
//           selectedItemColor: Colors.deepOrange,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.add_circle_outline_sharp),
//                 label: 'add Matches'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.lan_sharp), label: 'Upcoming Matches')
//           ]),
//     );
//   }
// }
