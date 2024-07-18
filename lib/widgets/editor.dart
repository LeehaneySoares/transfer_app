import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final Text label;
  final String hint;
  final Icon? icon;

  const Editor ({ this.icon, required this.controller, required this.label, required this.hint, super.key });

  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            label: label,
            hintText: hint,
            icon: icon
        )
      )
    );
  }
}