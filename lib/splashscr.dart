import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/homepage.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Homepage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text("सामान्य ज्ञान",
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontFamily: "Satisfy")),
      ),
    );
  }
}
