import 'package:flutter/material.dart';
import 'package:flutter_application_2/Cubits/lang_change/changeLang.dart';
import 'package:flutter_application_2/Model/constants.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? preferences;

  Future<void> checkScreens() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    preferences = await SharedPreferences.getInstance();
    String? email = preferences!.getString('email');
    if (email != null) {
      Navigator.pushNamed(context, HomeScreenPath);
    } else {
      Navigator.pushNamed(context, loginScreenPath);
    }
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      checkScreens();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedTextKit(animatedTexts: [
          TypewriterAnimatedText('Game Night',
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
              speed: const Duration(milliseconds: 180))
        ]),
      ),
    );
  }
}
