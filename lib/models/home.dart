import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeApp extends StatefulWidget {

  //File way;
  //HomeApp({Key key, @required this.way}) : super(key: key);
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
 // File way;
 // _HomeAppState({this.way});
  SharedPreferences preferences;

  File file;


  Future getimage() async
  {
    preferences = await SharedPreferences.getInstance();
  }
  @override
  void initState(){
    super.initState();
    //getimage();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("HOME"),
       actions: <Widget>[
         Icon(Icons.home),
       ],
     ),
     body: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.blue,
            ),
            child: ListTile(
              leading: Icon(Icons.school),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            child: ListTile(
              leading: Icon(Icons.school),
              trailing: Icon(Icons.more_vert),)
          ),
          Container(),
          Container()
        ],
      ),
    );
  }
}