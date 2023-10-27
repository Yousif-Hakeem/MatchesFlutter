import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  final String? hintText;
  final Function(String?) onSaved;
  final String Function(String?) onValidate;
  final TextInputType type;

  const CustomeTextField(
      {super.key,
      this.hintText,
      required this.onSaved,
      required this.onValidate,
      this.type = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      keyboardType: type,
      onSaved: onSaved,
      validator: onValidate,
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
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white30)),
    );
  }
}
