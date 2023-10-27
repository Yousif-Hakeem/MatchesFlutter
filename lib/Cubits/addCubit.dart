// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/Cubits/add_states.dart';
// import 'package:flutter_application_2/Model/Matches_Database.dart';
// import 'package:flutter_application_2/Model/matches_attrib.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

// class AddAmatchCubit extends Cubit<MatchStates> {
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   AddAmatchCubit() : super(MatchInitState());

//   static AddAmatchCubit get(context) => BlocProvider.of(context);
//   MyDb db = MyDb();
//   TheMatches matches = TheMatches();
//   final snackBar = SnackBar(
//     elevation: 0,
//     behavior: SnackBarBehavior.floating,
//     backgroundColor: Colors.green,
//     content: AwesomeSnackbarContent(
//       title: 'Great!',
//       message: 'Match Added successfully!',
//       titleFontSize: 19,
//       messageFontSize: 14,
//       contentType: ContentType.success,
//     ),
//   );

//   final FailSnackBar = SnackBar(
//     elevation: 0,
//     behavior: SnackBarBehavior.floating,
//     backgroundColor: Colors.red,
//     content: AwesomeSnackbarContent(
//       title: 'Something went wrong!',
//       message: 'could not add match',
//       titleFontSize: 19,
//       messageFontSize: 14,
//       contentType: ContentType.failure,
//     ),
//   );

//   void add() async {
//     bool valid = formKey.currentState!.validate();
//     if (valid == true) {
//       formKey.currentState!.save();
//       await db.insertData(matches);
//       formKey.currentState!.reset();
//       emit(AddMatchState());
//     }
//   }
// }
