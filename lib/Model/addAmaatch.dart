// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_application_2/Model/Matches_Database.dart';
// import 'package:flutter_application_2/Model/matches_attrib.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AddAmatch {
//   GlobalKey<FormState> newkey = GlobalKey<FormState>();
//   TheMatches matches = TheMatches();
//   MyDb db = MyDb();
//   static AddAmatch get(context) => BlocProvider.of(context);
//   final snackBar = SnackBar(
//       elevation: 0,
//       behavior: SnackBarBehavior.floating,
//       backgroundColor: Colors.green,
//       content: AwesomeSnackbarContent(
//         title: 'Great!',
//         message: 'Match Added successfully!',
//         titleFontSize: 19,
//         messageFontSize: 14,
//         contentType: ContentType.success,
//       ));
//   final FailSnackBar = SnackBar(
//       elevation: 0,
//       behavior: SnackBarBehavior.floating,
//       backgroundColor: Colors.red,
//       content: AwesomeSnackbarContent(
//         title: 'Something went wrong!',
//         message: 'could not add match',
//         titleFontSize: 19,
//         messageFontSize: 14,
//         contentType: ContentType.failure,
//       ));
//   add(BuildContext context) async {
//     bool valid = newkey.currentState!.validate();

//     if (valid == true) {
//       newkey.currentState!.save();
//       await db.insertData(matches);
//       newkey.currentState!.reset();
//       print('SAAAVED!');
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(FailSnackBar);
//     }
//   }
// }
