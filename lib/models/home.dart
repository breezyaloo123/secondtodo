import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeApp extends StatefulWidget {

  //String way;
  //HomeApp({Key key, @required this.way}) : super(key: key);
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  // String way;
  // _HomeAppState({this.way});

  //var file = new File('way');
  SharedPreferences preferences;

  


  Future getimage() async
  {
    preferences = await SharedPreferences.getInstance();
  }
  @override
  void initState(){
    super.initState();
    //getimage();
    //print(way.toString());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
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
       backgroundColor: Colors.blue,
       title: Center(child: Text("TODO")),
       elevation: 0.0,
       leading: Icon(Icons.menu),
       actions: <Widget>[
         Icon(Icons.exit_to_app),
       ],
     ),
     body: Column(
       children: <Widget>[
         Padding(
           padding: const EdgeInsets.only(right: 200.0,top: 20.0),
           child: Container(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/login.png"),
            ),
             ),
         ),
         Padding(
           padding: const EdgeInsets.only(right: 40.0),  
           child: Text("Hello, Breezy",style: TextStyle(
             color: Colors.white,
             fontSize: 20.0,
             fontStyle: FontStyle.italic,
           ),),
         ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0,top: 10.0),
            child: Text("Vous avez 2 taches prevues aujourd'hui",
            style: TextStyle(
              color: Colors.white,
              
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100.0,top: 40.0,bottom: 40.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.location_on),
                Text("Sicap Dieuppeul1",
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
              ],
            ),
          ),
          Text("20.51 °C",
          style: TextStyle(
            fontSize: 20.0,
          ),),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 150.0,
              width: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Padding(
                    padding:const EdgeInsets.all(8.0),
                    child: Container(
                      child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 100.0),
                            child: Icon(Icons.school),
                          ),
                          Icon(Icons.menu)
                        ],
                      ),                        
                      ),
                    ),
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