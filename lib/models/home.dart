
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo1/services/data.dart';
import 'package:todo1/services/lacation_services.dart';
import 'package:todo1/tasks/coding.dart';
import 'package:todo1/tasks/sport.dart';
import 'package:todo1/tasks/movie.dart';
import '../tasks/read.dart';
import 'package:location/location.dart';

class HomeApp extends StatefulWidget {

  String way;
  HomeApp({Key key, @required this.way}) : super(key: key);
  @override
  _HomeAppState createState() => _HomeAppState(way: this.way);
}

class _HomeAppState extends State<HomeApp> {
  
  String way;
  _HomeAppState({this.way});

  //var file = new File('way');
  SharedPreferences preferences;

  double time;

  LocationServices a;


  


  getHour() 
  {
    setState(() async{
    time = await a.getTime();      
    });

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => TaskRead()));
            }
          ),
          SpeedDialChild(
            child: Icon(Icons.directions_run),
            backgroundColor: Colors.green,
            label: 'Sport',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Sport()));
            }
          ),
          SpeedDialChild(
            child: Icon(Icons.local_movies),
            backgroundColor: Colors.indigo,
            label: 'Movies',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Movie()));

            }
          ),
          SpeedDialChild(
            child: Icon(Icons.code),
            backgroundColor: Colors.brown,
            label: 'Coding',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Coding()));
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
         Row(
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.only(right: 150.0,top: 20.0,left: 20.0),
               child: Container(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/login.png"),
                ),
                 ),
             ),
             Text("HH:MM"),
           ],
         ),
         Padding(
           padding: const EdgeInsets.only(right: 40.0),  
           child: Text("Hello ,"+way.toString(),style: TextStyle(
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
              height: 200.0,
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
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 100.0,top: 10.0,bottom: 50.0),
                                child: Icon(Icons.school,color:Colors.blue,),
                              ),
                              Padding(
                                padding:const EdgeInsets.only(left: 100.0,top: 10.0,bottom: 50.0),
                                child: Icon(Icons.more_vert), 
                                )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150.0,top: 45.0),
                            child: Text("1 Task restants"),
                          ),
                          Padding(
                            padding:EdgeInsets.only(right: 200.0,top: 10.0),
                            child: Text("READ"), 
                            )
                        ],
                      ),                        
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Padding(
                    padding:const EdgeInsets.all(8.0),
                    child: Container(
                      child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 100.0,top: 10.0,bottom: 50.0),
                                child: Icon(Icons.school,color:Colors.blue,),
                              ),
                              Padding(
                                padding:const EdgeInsets.only(left: 100.0,top: 10.0,bottom: 50.0),
                                child: Icon(Icons.more_vert), 
                                )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150.0,top: 45.0),
                            child: Text("1 Task restants"),
                          ),
                          Padding(
                            padding:EdgeInsets.only(right: 200.0,top: 10.0),
                            child: Text("READ"), 
                            )
                        ],
                      ),                        
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Padding(
                    padding:const EdgeInsets.all(8.0),
                    child: Container(
                      child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 100.0,top: 10.0,bottom: 50.0),
                                child: Icon(Icons.school,color:Colors.blue,),
                              ),
                              Padding(
                                padding:const EdgeInsets.only(left: 100.0,top: 10.0,bottom: 50.0),
                                child: Icon(Icons.more_vert), 
                                )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150.0,top: 45.0),
                            child: Text("1 Task restants"),
                          ),
                          Padding(
                            padding:EdgeInsets.only(right: 200.0,top: 10.0),
                            child: Text("READ"), 
                            )
                        ],
                      ),                        
                      ),
                    ),
                  ),
                SizedBox(width: 10.0),
                  Padding(
                    padding:const EdgeInsets.all(8.0),
                    child: Container(
                      child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 100.0,top: 10.0,bottom: 50.0),
                                child: Icon(Icons.school,color:Colors.blue,),
                              ),
                              Padding(
                                padding:const EdgeInsets.only(left: 100.0,top: 10.0,bottom: 50.0),
                                child: Icon(Icons.more_vert), 
                                )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150.0,top: 45.0),
                            child: Text("1 Task restants"),
                          ),
                          Padding(
                            padding:EdgeInsets.only(right: 200.0,top: 10.0),
                            child: Text("READ"), 
                            )
                        ],
                      ),
                      ),
                    ),
                  ),
                ],
              ),   
            ),
          )
       ],
     )
    );
  }
}