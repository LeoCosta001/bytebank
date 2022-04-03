import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController getController;
  final String getLabelText;
  final String getHintText;
  final IconData? getIcon;

  Editor(
      {required this.getController,
        required this.getLabelText,
        required this.getHintText,
        this.getIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0),
      child: TextField(
        style: const TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          labelText: getLabelText,
          icon: getIcon != null ? Icon(getIcon) : null,
          hintText: getHintText,
        ),
        keyboardType: TextInputType.number,
        controller: getController,
      ),
    );
  }
}