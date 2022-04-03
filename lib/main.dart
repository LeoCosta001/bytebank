import 'package:bytebank/screens/transference/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( // Verify https://material.io/resources/color
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.green[900],
            secondary: Colors.blueAccent[700]
        ),
      ), //Or ThemeData.dark() to apply dark mode
      home: TransferenceList(),
    );
  }
}
