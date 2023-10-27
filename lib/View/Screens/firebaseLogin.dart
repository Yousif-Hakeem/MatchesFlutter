import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/constants.dart';
import 'package:flutter_application_2/Model/firebaseAuth.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class FirebaseLogin extends StatefulWidget {
  String? email;
  String? password;
  Map<String, dynamic> toMap() {
    return {"email": email, "password": password};
  }

  FirebaseLogin({super.key});

  @override
  State<FirebaseLogin> createState() => _FirebaseLoginState();
}

GlobalKey<FormState> key = GlobalKey<FormState>();

class _FirebaseLoginState extends State<FirebaseLogin> {
  FirebaseLogin user = FirebaseLogin();
  bool hide = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          backgroundColor: Colors.white10,
        ),
        backgroundColor: Colors.white10,
        body: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      if (value != null) user.email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.entermail;
                      } else if (!value.contains('@gmail.com')) {
                        return AppLocalizations.of(context)!.entermail;
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        icon: const Icon(Icons.email),
                        iconColor: Colors.deepOrange,
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
                        hintText: AppLocalizations.of(context)!.entermail,
                        hintStyle: const TextStyle(color: Colors.white30)),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: passcontroller,
                    obscureText: hide,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      if (value != null) user.password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.enterpass;
                      } else if (value.length < 6) {
                        return AppLocalizations.of(context)!.enterpass;
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        icon: const Icon(Icons.password),
                        iconColor: Colors.deepOrange,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hide = !hide;
                            });
                          },
                          icon: const Icon(
                            Icons.remove_red_eye,
                            color: Colors.deepOrange,
                          ),
                        ),
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
                        hintText: AppLocalizations.of(context)!.enterpass,
                        hintStyle: const TextStyle(color: Colors.white30)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: ElevatedButton(
                  onPressed: () async {
                    FireAuth signin = FireAuth();
                    await signin.login(
                        emailcontroller.text, passcontroller.text);
                    key.currentState!.reset();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    textStyle: const TextStyle(fontSize: 16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.login,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
