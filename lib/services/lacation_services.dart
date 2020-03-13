import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
      final Geolocator geolocator= Geolocator()..forceAndroidLocationManager;
  Position position;
  String address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            position!=null?Text(address):Text(""),
            RaisedButton(
              child: Text("data"),
              onPressed: ()
            {
              getLocation();
            })
          ],
        ),
      ),
    );
  }

  void getLocation()
  {
    geolocator.getLastKnownPosition(desiredAccuracy: LocationAccuracy.best).
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
}