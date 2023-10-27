import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/Matches_Database.dart';
import 'package:flutter_application_2/Model/matches_attrib.dart';
import 'package:flutter_application_2/View/Widgets/custom_textfield.dart';

import 'package:lottie/lottie.dart';

class AddMatchesNavBar extends StatefulWidget {
  const AddMatchesNavBar({super.key});

  @override
  State<AddMatchesNavBar> createState() => _AddMatchesNavBarState();
}

class _AddMatchesNavBarState extends State<AddMatchesNavBar> {
  bool hasOnlyNonAlphabets(String input) {
    final alphabetsRegex = RegExp(r'[a-zA-Z]');
    return alphabetsRegex.hasMatch(input);
  }

  static GlobalKey<FormState> newkey = GlobalKey<FormState>();
  TheMatches? matches = TheMatches();
  late MyDb? db;
  final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
      content: AwesomeSnackbarContent(
        title: 'Great!',
        message: 'Match Added successfully!',
        titleFontSize: 19,
        messageFontSize: 14,
        contentType: ContentType.success,
      ));
  final FailSnackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      content: AwesomeSnackbarContent(
        title: 'Something went wrong!',
        message: 'could not add match',
        titleFontSize: 19,
        messageFontSize: 14,
        contentType: ContentType.failure,
      ));

  @override
  void initState() {
    super.initState();
    db = MyDb();
  }

  @override
  Widget build(BuildContext? context) {
    return Form(
        key: newkey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animation_ln1yc8fq.json',
                height: 150.0,
                repeat: true,
                reverse: true,
                animate: true,
              ),
              CustomeTextField(
                hintText: 'Enter first team',
                onSaved: (value) {
                  if (value != null) matches!.firstTeam = value;
                },
                onValidate: (String? value) {
                  if (value!.isEmpty) {
                    return "enter first team/'s name";
                  } else {
                    return '';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(
                hintText: 'Enter second team',
                onSaved: (value) {
                  if (value != null) matches!.secondTeam = value;
                },
                onValidate: (String? value) {
                  if (value!.isEmpty) {
                    return "enter second team/'s name";
                  } else {
                    return '';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(
                type: TextInputType.number,
                hintText: 'Enter Duration',
                onSaved: (value) {
                  if (value != null) matches!.duration = int.parse(value);
                },
                onValidate: (String? value) {
                  if (value!.isEmpty) {
                    return "enter duration";
                  } else {
                    return 'f';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(
                hintText: 'Enter Location',
                onSaved: (value) {
                  if (value != null) matches!.location = value;
                },
                onValidate: (String? value) {
                  if (value!.isEmpty) {
                    return "enter location";
                  } else {
                    return '';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  bool valid = newkey.currentState!.validate();

                  if (valid == true) {
                    newkey.currentState!.save();
                    await db!.insertData(matches!);
                    newkey.currentState!.reset();
                    print('SAAAVED!');
                    ScaffoldMessenger.of(context!).showSnackBar(snackBar);
                  } else {
                    ScaffoldMessenger.of(context!).showSnackBar(FailSnackBar);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  // disabledBackgroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                ),
                child: const Text('Add'),
              ),
            ],
          ),
        ));
  }
}
// () async {
//                       bool valid = newkey.currentState!.validate();

//                       if (valid == true) {
//                         newkey.currentState!.save();
//                         await db.insertData(matches);
//                         newkey.currentState!.reset();
//                         print('SAAAVED!');
//                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                       } else {
//                         ScaffoldMessenger.of(context)
//                             .showSnackBar(FailSnackBar);
//                       }
//                     },
