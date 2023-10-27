import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  const CircleButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: CircleAvatar(
        backgroundColor: Colors.deepOrange,
        child: Text(text),
      ),
    );
  }
}
