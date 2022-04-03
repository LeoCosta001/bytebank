import 'package:bytebank/screens/transference/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Verify https://material.io/resources/color
      // Use ThemeData.dark() to apply dark mode
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green[900],
          secondary: Colors.blueAccent[700],
        ),
      ),
      home: TransferenceList(),
    );
  }
}
