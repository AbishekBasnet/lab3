import 'package:flutter/material.dart';
import 'hangman_game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'monospace',
      ),
      home: HangmanGame(),
      debugShowCheckedModeBanner: false,
    );
  }
}