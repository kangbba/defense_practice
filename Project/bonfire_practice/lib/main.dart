import 'package:flutter/material.dart';
import 'package:untitled/game_controller.dart';
import 'package:untitled/unit.dart';
import 'package:untitled/unit_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const GameController(),
    );
  }
}
