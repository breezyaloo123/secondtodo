import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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
      floatingActionButton: SpeedDial(
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: ()=>print('OPENING DIAL'),
        onClose: () =>print('Dial closed'),
        tooltip: 'speed dial',
        heroTag: 'speed !!!',
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.book),
            backgroundColor: Colors.red,
            label: 'read',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: ()
            {

            }
          ),
          SpeedDialChild(
            child: Icon(Icons.book),
            backgroundColor: Colors.red,
            label: 'read',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: ()
            {

            }
          ),
          SpeedDialChild(
            child: Icon(Icons.book),
            backgroundColor: Colors.red,
            label: 'read',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: ()
            {

            }
          ),
          SpeedDialChild(
            child: Icon(Icons.book),
            backgroundColor: Colors.red,
            label: 'read',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: ()
            {

            }
          ),
        ],
      ),
     appBar: AppBar(
       title: Text("HOME"),
       actions: <Widget>[
         Icon(Icons.home),
       ],
     ),
     body: Column(
       children: <Widget>[
         CircleAvatar(
           backgroundImage: AssetImage("assets/todo.png"),
         ),
         Align(
           alignment: Alignment.bottomLeft,
           child: Container(
             height: 100,
             margin: EdgeInsets.symmetric(vertical: 20.0),
             child: ListView(
               scrollDirection: Axis.horizontal,
               children: <Widget>[
                 ListTile(
                   leading: Icon(Icons.school),
                   trailing: Icon(Icons.more_vert),
                 )
               ],
             ),
           ),

         )
       ],
     )
    );
  }
}