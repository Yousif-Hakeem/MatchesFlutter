import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/Matches_Database.dart';
import 'package:flutter_application_2/Model/matches_attrib.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:lottie/lottie.dart';

// import 'package:flutter_application_2/constants.dart';

class AddMatches extends StatefulWidget {
  const AddMatches({super.key});

  @override
  State<AddMatches> createState() => _MatchesState();
}

class _MatchesState extends State<AddMatches> {
  bool hasOnlyNonAlphabets(String input) {
    final alphabetsRegex = RegExp(r'[a-zA-Z]');
    return alphabetsRegex.hasMatch(input);
  }

  GlobalKey<FormState> newkey = GlobalKey<FormState>();
  TheMatches matches = TheMatches();
  late MyDb db;

  @override
  void initState() {
    super.initState();
    db = MyDb();
    // await db.initializeDb();
  }

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: AwesomeSnackbarContent(
          title: AppLocalizations.of(context)!.addMatches,
          message: AppLocalizations.of(context)!.matchAdded,
          titleFontSize: 19,
          messageFontSize: 14,
          contentType: ContentType.success,
        ));

    final FailSnackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: AwesomeSnackbarContent(
          title: AppLocalizations.of(context)!.unfortunately,
          message: AppLocalizations.of(context)!.somethingWrong,
          titleFontSize: 19,
          messageFontSize: 14,
          contentType: ContentType.failure,
        ));

    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.addMatches,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/upcoming_matches');
              },
              icon: const Icon(Icons.play_arrow_outlined))
        ],
      ),
      body: Form(
          key: newkey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  Lottie.asset(
                    'assets/animation_ln1yc8fq.json',
                    height: 200.0,
                    repeat: true,
                    reverse: true,
                    animate: true,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      if (value != null) matches.secondTeam = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.enterFirst;
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange)),
                        hintText: AppLocalizations.of(context)!.enterFirst,
                        hintStyle: const TextStyle(color: Colors.white30)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      if (value != null) matches.secondTeam = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.enterSecond;
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange)),
                        hintText: AppLocalizations.of(context)!.enterSecond,
                        hintStyle: const TextStyle(color: Colors.white30)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      if (value != null) matches.duration = int.parse(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.enterDuration;
                      } else if (hasOnlyNonAlphabets(value)) {
                        return AppLocalizations.of(context)!.onlyNumbers;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange)),
                        hintText: AppLocalizations.of(context)!.enterDuration,
                        hintStyle: const TextStyle(color: Colors.white30)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      if (value != null) matches.location = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.enterLocation;
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.deepOrange)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.deepOrange)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.deepOrange)),
                      hintText: AppLocalizations.of(context)!.enterLocation,
                      hintStyle: const TextStyle(color: Colors.white30),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      bool valid = newkey.currentState!.validate();

                      if (valid == true) {
                        newkey.currentState!.save();
                        await db.insertData(matches);
                        newkey.currentState!.reset();
                        print('SAAAVED!');
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(FailSnackBar);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      // disabledBackgroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                    ),
                    child: Text(AppLocalizations.of(context)!.add),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
