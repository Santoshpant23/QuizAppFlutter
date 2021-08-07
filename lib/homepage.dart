// import 'dart:js';
//import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/drawer.dart';
import 'package:quiz_app/level.dart';
import 'package:quiz_app/easy.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // String jsonn;
  List<String> images = [
    "images/science.png",
    "images/history.png",
    "images/maths.jpg",
    "images/sports.jpg",
    "images/computer.jpg",
  ];

  Widget customcard(String lanname, String images  , String jsonn , String msg) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Levelpage(jsonn : jsonn)));
        },
        child: Material(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(30),
          elevation: 10,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(images),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(lanname,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "Quando")),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(
                      8.0,
                    ),
                    child: Text(
                      msg,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          
                          fontFamily: "Alike"),
                      maxLines: 5,
                      textAlign: TextAlign.left,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nepali Quiz",
          style: TextStyle(
            fontFamily: "Satisfy",
          ),
        ),
        centerTitle: true,
      ),
      drawer: MaterialDrawer(),
      body: ListView(
        children: <Widget>[
          customcard("विज्ञान", images[0] ,"python" , "विज्ञान एउटा रोचक विषय हो।\n यहाँ विज्ञान विषय मा तपाइँको ज्ञान जाँच गर्नुहोस्।" ),
          customcard("ईतिहास", images[1] ,"java" , "हाम्रो देशको इतिहास सबै नेपालीहरूका लागि धेरै प्रेरणादायक छ।"), 
          customcard("गणित", images[2] ,"js" , "गणित रमाईलो विषय हो।\n हामी सबै यस विषयलाई प्रेम गर्दछौं।"),
          customcard("खेलकुद", images[3] ,"cpp" , "खेलकुदले हामीलाई शारीरिक र\n मानसिक रूपमा फिट रहन मद्दत गर्दछ।" ),
          customcard("कम्प्युटर", images[4] , "linux", "यो युग कम्प्युटरको युग हो\n त्यसैले आजकल कम्प्युटरको ज्ञान अनिवार्य छ।" ),
        ],
      ),
    );
  }
}
