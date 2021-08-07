import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quiz_app/easy.dart';
import 'package:quiz_app/hard.dart';
import 'package:quiz_app/normal.dart';

class Levelpage extends StatelessWidget {
  String jsonn;
  Levelpage({this.jsonn});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 58.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Getjson(jsonn: jsonn)));
              },
              child: Text(
                "Easy",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontSize: 15.0,
                ),
              ),
              color: Colors.indigoAccent,
              splashColor: Colors.indigo,
              minWidth: 200.0,
              height: 45.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          SizedBox(height: 10),
          Container(
             padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 58.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Getjsonnormal(jsonn: jsonn)));
              },
              child: Text("Normal",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontSize: 15.0,
                ),),
                color: Colors.indigoAccent,
              splashColor: Colors.indigo,
              minWidth: 200.0,
              height: 45.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          SizedBox(height: 10),
          Container(
             padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 58.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Getjsonhard(jsonn: jsonn)));
              },
              child: Text("Hard",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontSize: 15.0,
                ),),
                color: Colors.indigoAccent,
              splashColor: Colors.indigo,
              minWidth: 200.0,
              height: 45.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
