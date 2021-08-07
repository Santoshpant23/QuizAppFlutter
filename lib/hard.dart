import 'dart:async';
import 'dart:convert';
// import 'dart:html';
// import 'dart:js';
// import 'dart:html';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/resultpage.dart';

class Getjsonhard extends StatelessWidget {
  String  jsonn;
  Getjsonhard({this.jsonn});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/$jsonn.json"),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text("Loading"),
            ),
          );
        } else {
          return Quizpage(mydata: mydata);
        }
      },
    );
  }
}

class Quizpage extends StatefulWidget {
  var mydata;

  Quizpage({Key key, @required this.mydata}) : super(key: key);

  @override
  _QuizpageState createState() => _QuizpageState(mydata);
}

class _QuizpageState extends State<Quizpage> {
  var mydata;
  _QuizpageState(this.mydata);

  Color colortoshow = Colors.indigo;
  Color right = Colors.green;
  Color wrong = Colors.red;

  Map<String, Color> btncolor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };

  int marks = 0;
  int i = 1;
  int timer = 25;
  String showtimer = "25";
  bool canceltimer = false;

  void checkanswer(String k) {
    if (mydata[8][i.toString()] == mydata[7][i.toString()][k]) {
      marks = marks + 5;
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
      canceltimer = true;
    });
    Timer(Duration(seconds: 2), nextquestion);
  }

  void nextquestion() {
    canceltimer = false;
    timer = 25;
    setState(() {
      if (i < 10) {
        i++;
        starttimer();
      } else {
        canceltimer = true;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Resultpage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.indigoAccent;
      btncolor["b"] = Colors.indigoAccent;
      btncolor["c"] = Colors.indigoAccent;
      btncolor["d"] = Colors.indigoAccent;
    });
  }

  @override
  void initState() {
    starttimer();
    super.initState();
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[7][i.toString()][k],
          style: TextStyle(
              fontSize: 16.0, fontFamily: "Alike", color: Colors.white),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.indigo,
        highlightColor: Colors.indigo,
        minWidth: 200.0,
        height: 45.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomLeft,
                  child: Center(
                    child: Text(
                      mydata[6][i.toString()],
                      style: TextStyle(fontFamily: "Quando", fontSize: 26.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      choicebutton("a"),
                      choicebutton("b"),
                      choicebutton("c"),
                      choicebutton("d"),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Center(
                    child: Text(
                      showtimer,
                      style: TextStyle(
                        fontSize: 35.0,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onWillPop: () {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Nepali Quiz"),
                    content: Text("You Cannot Go back at this stage"),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"))
                    ],
                  ));
        });
  }
}
