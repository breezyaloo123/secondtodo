import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome.dart';
import 'connection/login.dart';
import 'models/home.dart';
import './services/lacation_services.dart';
import './services/data.dart';

void main() async
{
  //TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  Widget test;
  SharedPreferences prefs= await SharedPreferences.getInstance();
  bool tag= prefs.getBool('connect');
  if(tag==true)
  {
    test=HomeApp();
  }
  else
  {
    test=LoginPage();
  }
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:test,
  ));
}