import 'package:flutter/material.dart';
import 'package:rafia_unscramble_bloc/ui/screens/input_textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unscramble',
      theme: ThemeData.dark(),
      home: InputTextField(),
    );
  }
}
