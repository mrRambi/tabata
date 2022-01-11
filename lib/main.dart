import 'package:aplikacja_treningowa/simple_app_bar.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mahej',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const HomeScreen(title: 'Tabata trener'),
    );
  }
}
