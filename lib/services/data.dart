import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTemp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cool"),
        centerTitle: true,
      ),
      body: Text(""),
    );
  }

  void getTemp() async
  {
    var response = await http.get("https://samples.openweathermap.org/data/2.5/weather?q=Dakar&appid=cdb3fafadc8c3e51b26442472ce85574");
    var dd=json.decode(response.body);
    var d=dd["main"]['temp'];
    print(d);
  }

}