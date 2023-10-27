// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/Model/Matches_Database.dart';
// import 'package:flutter_application_2/Model/matches_attrib.dart';

// // import 'package:flutter_application_2/add_matches_screen.dart';

// class UpcomingMatches extends StatefulWidget {
//   const UpcomingMatches({super.key});

//   @override
//   State<UpcomingMatches> createState() => _UpcomingMatchesState();
// }

// class _UpcomingMatchesState extends State<UpcomingMatches> {
//   List<TheMatches> matches = [];
//   late MyDb db = MyDb();

//   @override
//   void initState() {
//     super.initState();
//     loadMatches();
//     db = MyDb();
//   }

//   Future<void> loadMatches() async {
//     await db.initializeDb();
//     List<TheMatches> data = await db.getFromDb();
//     setState(() {
//       matches = data;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text(
//           'Upcoming Matchs',
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: matches.isEmpty
//           ? const Center(
//               child: Padding(
//                 padding: EdgeInsets.all(15.0),
//                 child: Text(
//                   'No matches yet...',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.deepOrange,
//                   ),
//                 ),
//               ),
//             )
//           : ListView.builder(
//               itemCount: matches.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   color: Colors.white10,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.only(left: 20, bottom: 15, top: 15),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(right: 30),
//                           child: Text(
//                             matches[index].firstTeam.toString(),
//                             style: const TextStyle(
//                                 color: Colors.deepOrange,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             const Padding(
//                               padding: EdgeInsets.only(bottom: 10, top: 10),
//                               child: Text(
//                                 'VS',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.deepOrange,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               '${matches[index].duration.toString()} pm',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.deepOrange),
//                             ),
//                             Text(
//                               matches[index].location.toString(),
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.deepOrange),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 30),
//                           child: Text(
//                             matches[index].secondTeam.toString(),
//                             style: const TextStyle(
//                                 color: Colors.deepOrange,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 90),
//                           child: IconButton(
//                             onPressed: () {},
//                             icon: const Icon(Icons.edit),
//                             iconSize: 20,
//                             color: Colors.deepOrange,
//                           ),
//                         ),
//                         Flexible(
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 40),
//                             child: IconButton(
//                               onPressed: () async {
//                                 await db.deleteMatch(matches[index].duration);
//                                 setState(() {
//                                   matches.removeAt(index);
//                                 });
//                                 print('match removed !');
//                               },
//                               icon: const Icon(Icons.delete),
//                               iconSize: 20,
//                               color: Colors.deepOrange,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
