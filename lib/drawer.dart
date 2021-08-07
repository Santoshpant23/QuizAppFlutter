import 'package:flutter/material.dart';
import 'package:quiz_app/homepage.dart';
import 'package:quiz_app/policy.dart';
import 'package:url_launcher/url_launcher.dart';

class MaterialDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(25),
          color: Colors.indigo,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/avatar.jpg"))),
                  //child: Image.asset("images/avatar.jpg" , ),
                ),
                SizedBox(height: 10),
                Text("Santosh Pant",
                    style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white)),
                Text("Email : pantsantosh23@gmail.com",
                    style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white)),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(
            "Home",
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.privacy_tip),
          title: Text(
            "Privacy Policy",
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Policy()));
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text(
            "Rate Us",
            style: TextStyle(fontSize: 20),
          ),
          onTap: () async {
            const url = 'https://google.com/';
            await launch(url);
          },
        ),
        ListTile(
          leading: Icon(Icons.more),
          title: Text(
            "More From Us",
            style: TextStyle(fontSize: 20),
          ),
          onTap: () async {
            const url = 'https://google.com/';
            await launch(url);
          },
        ),
      ],
    ));
  }
}