import 'package:flutter/material.dart';
import 'package:quiz_app/splashscr.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nepali Quiz",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Splashscreen(),
    );
  }
}
