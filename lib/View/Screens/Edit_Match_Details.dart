import 'package:flutter/material.dart';
import 'package:flutter_application_2/Cubits/lang_change/changeLang.dart';
import 'package:flutter_application_2/Cubits/lang_change/changeLangState.dart';
import 'package:flutter_application_2/Model/matches_attrib.dart';
import 'package:flutter_application_2/View/Widgets/Button_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class EditMatchScreen extends StatefulWidget {
  final TheMatches match;

  const EditMatchScreen({Key? key, required this.match}) : super(key: key);

  @override
  _EditMatchScreenState createState() => _EditMatchScreenState();
}

class _EditMatchScreenState extends State<EditMatchScreen> {
  TextEditingController firstTeamController = TextEditingController();
  TextEditingController secondTeamController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    firstTeamController.text = widget.match.firstTeam ?? '';
    secondTeamController.text = widget.match.secondTeam ?? '';
    locationController.text = widget.match.location ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.editMatches,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstTeamController,
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                  hintText: AppLocalizations.of(context)!.enterFirst,
                  hintStyle: const TextStyle(color: Colors.deepOrange)),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: secondTeamController,
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                  hintText: AppLocalizations.of(context)!.enterSecond,
                  hintStyle: const TextStyle(color: Colors.deepOrange)),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                  hintText: AppLocalizations.of(context)!.enterLocation,
                  hintStyle: const TextStyle(color: Colors.deepOrange)),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                // Save the updated values and pop the screen
                TheMatches updatedMatch = widget.match.copyWith(
                  firstTeam: firstTeamController.text,
                  secondTeam: secondTeamController.text,
                  location: locationController.text,
                );
                Navigator.pop(context, updatedMatch);
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
              child: Text(AppLocalizations.of(context)!.save),
            ),
          ],
        ),
      ),
    );
  }
}
