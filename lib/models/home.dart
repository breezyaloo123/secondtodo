
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo1/connection/login.dart';
import 'package:todo1/models/otherinfo.dart';
import '../tasks/read.dart';
import 'package:intl/intl.dart';
import 'globalThing.dart' as value;
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
class HomeApp extends StatefulWidget {

 
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  
  final Geolocator geolocator= Geolocator()..forceAndroidLocationManager;
  Position position;
  String address;
  String username1=value.username;
  var temp;
  

  

 //var file = new File('way');

 


  String type1="READ";
  String type2="SPORT";
  String type3="MOVIES";
  String type4="CODING";
  String val;

  TimeOfDay timeOfDay = new TimeOfDay.now();
  TimeOfDay timeOfDay1;
  Future<Null> selectTime(BuildContext context) async
  {
    timeOfDay1= await showTimePicker(context: context
    , 
    initialTime: timeOfDay);

    setState(() {
      timeOfDay=timeOfDay1;
      print(timeOfDay);
    });
  }
  String usernamee;
  String formatTimeOfDay(TimeOfDay time)
  {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }


 DateFormat aa;
 static DateTime dateTime;

var time;


  void getHour() 
  {
    setState(() {
      aa = new DateFormat("HH:mm");
      
      dateTime.toLocal();
      print(dateTime.toLocal());
    });

  }
  @override
  void initState() {
    super.initState();
    //getimage();
    //print(way.toString());
    setState(() {
     var ab = DateTime.now();
     time = ab.hour.toString()+":"+ab.minute.toString();
     print(time);
    //  SharedPreferences prefs= await SharedPreferences.getInstance();
    //  usernamee= prefs.getString('username');
    });
    if(position!=null)
    {
      getLocation();
    }
 
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
              val="READ";
              Navigator.push(context, MaterialPageRoute(builder: (context) => TaskRead(val: this.val,)));
            }
          ),
          SpeedDialChild(
            child: Icon(Icons.directions_run),
            backgroundColor: Colors.green,
            label: 'Sport',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: ()
            {
              val="SPORT";
             Navigator.push(context, MaterialPageRoute(builder: (context) => TaskRead(val: this.val,)));
            }
          ),
          SpeedDialChild(
            child: Icon(Icons.local_movies),
            backgroundColor: Colors.indigo,
            label: 'Movies',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: ()
            {
              val="MOVIES";
              Navigator.push(context, MaterialPageRoute(builder: (context) => TaskRead(val: this.val,)));

            }
          ),
          SpeedDialChild(
            child: Icon(Icons.code),
            backgroundColor: Colors.brown,
            label: 'Coding',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: ()
            {
              val="CODING";
              Navigator.push(context, MaterialPageRoute(builder: (context) => TaskRead(val: this.val,)));
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
         IconButton(icon: Icon(Icons.exit_to_app), 
         onPressed:() async
         {
           SharedPreferences preferences= await SharedPreferences.getInstance();
           await preferences.setBool('connect', false);
           
           Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
         } )
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
                  backgroundImage:AssetImage("assets/login.png"),
                ),
                 ),
             ),
             Text(""+timeOfDay.hour.toString()+":"+timeOfDay.minute.toString()),
           ],
         ),
         Padding(
           padding: const EdgeInsets.only(right: 40.0),  
           child: Text("Hello , " ,style: TextStyle(
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
                position!=null?Text(address, style: TextStyle(
                  color: Colors.white,
                )):Text(""),
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
                    child: GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AllTasks()));
                      },
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
//methid which get the localisation
   void getLocation()
  {
    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).
    then((Position pp)
    {
      setState(() {
        position=pp;
      });
      getAddress();
    }).catchError((e)
    {
      print(e);
    });
  }
  //method whiche translate the coordinates into an address
   void getAddress() async
  {
    try {
      List<Placemark> p= await geolocator.placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place=p[0];
      setState(() {
        address = "${place.subLocality},${place.locality},${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  //get the temperature

    void getTemp() async
  {
    var response = await http.get("https://samples.openweathermap.org/data/2.5/weather?q=Dakar&appid=cdb3fafadc8c3e51b26442472ce85574");
    var dd=json.decode(response.body);
    temp=dd["main"]['temp'];
    print(temp);
  }
}