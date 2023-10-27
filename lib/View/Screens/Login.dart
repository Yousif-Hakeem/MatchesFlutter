import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  String? email;
  String? password;
  Map<String, dynamic> toMap() {
    return {"email": email, "password": password};
  }

  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

GlobalKey<FormState> key = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  Login user = Login();
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          backgroundColor: Colors.white10,
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
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
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      if (value != null) user.email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter Email";
                      } else if (!value.contains('@gmail.com')) {
                        return 'wrong format';
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
                        hintText: 'Enter email',
                        hintStyle: const TextStyle(color: Colors.white30)),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: hide,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      if (value != null) user.password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter password";
                      } else if (value.length < 6) {
                        return 'password is too short';
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
                        hintText: 'Enter password',
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
                    bool valid = key.currentState!.validate();

                    if (valid == true) {
                      key.currentState!.save();

                      key.currentState!.reset();
                      print('email ${user.email}');
                      print('password ${user.password}');
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      await preferences.setString('email', user.email!);
                      await preferences.setString('password', user.password!);
                      Navigator.pushNamed(context, HomeScreenPath);
                    } else {
                      //
                    }
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
                  child: const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
