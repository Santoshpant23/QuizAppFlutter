import 'dart:js';

import 'package:flutter/material.dart';
import 'package:quiz_app/homepage.dart';

class Resultpage extends StatefulWidget {
  int marks;
  Resultpage({Key key, @required this.marks}) : super(key: key);

  @override
  _ResultpageState createState() => _ResultpageState(marks);
}

class _ResultpageState extends State<Resultpage> {
  List<String> images=[
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String  message;
  String  image;

  @override
  void initState(){
    if(marks<20){
      image = images[2];
      message="You did not do well . You Scored $marks only";
    }else if (marks<40){
      image =  images[1];
        message="You can do better   . You Scored $marks ";
    }else {
       image = images[0];
        message="You did  well . You Scored $marks ";
    }
    super.initState();

  }

  int marks;
  _ResultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Material(
              elevation: 10.0,
              child: Container(
                  child: Column(
                children: [
                  Material(
                    child: Container(
                      height: 300.0,
                      width: 300.0,
                      child: ClipRect(
                        child: Image(
                          image: AssetImage(image),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: Center(
                      child: Text(
                        message,
                          style:
                              TextStyle(fontSize: 20.0, fontFamily: "Quando")),
                    ),
                  )
                ],
              )),
            ),
          ),
          Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlineButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Homepage(),
                      ));
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    borderSide: BorderSide(width: 3.0, color: Colors.indigo),
                    splashColor: Colors.indigo,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
