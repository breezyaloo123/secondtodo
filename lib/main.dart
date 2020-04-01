import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'connection/login.dart';
import 'models/home.dart';
import 'package:flutter/services.dart';



Future<void> main() async
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
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:test,
  ));
}