import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:todo1/services/data.dart';

class LocationServices {
  UserLocation userLocation;

  Location location = Location();

  StreamController<UserLocation> streamController = 
  StreamController<UserLocation>.broadcast(); 
  double time;

  LocationServices()
  {
    location.requestPermission().then((granted)
    {
      if(granted)
      {
        
        location.onLocationChanged().listen((data)
        {
          
          if (data!=null) {
            
            streamController.add(UserLocation(longitude: data.longitude,latitude: data.latitude));
          }
        });
      }
    });
  }

  Stream<UserLocation> get stream => streamController.stream;

  Future<UserLocation> getLocation() async 
  {
    try {
      var currentLocation = await location.getLocation();
      userLocation = UserLocation(longitude: currentLocation.longitude,latitude: currentLocation.latitude);
    } catch (e) {
      print("verify your connexion $e");
    }

    return userLocation;
  }

  Future<double> getTime() async
  {
    await location.requestPermission().then((granted)
    {
      if(granted)
      {
        
        location.onLocationChanged().listen((timee)
        {
          
          if (timee!=null) {
                  time= timee.time;
          }
        });
      }
    });

    return time;
  }
  
}