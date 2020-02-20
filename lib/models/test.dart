import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent:100,
      
      children: <Widget>[
        Container(
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Material(
          child: ListTile(
          leading: Icon(Icons.shopping_cart),
          trailing: Icon(Icons.add_call),
        ),
    ),
        ),
        Container(
    decoration: BoxDecoration(
    color: Colors.green,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Material(
          child: ListTile(
        leading: Icon(Icons.shopping_cart),
        trailing: Icon(Icons.add_call),
      ),
    ),
        ),
        Container(
          
    decoration: BoxDecoration(
      color: Colors.purple,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Material(
          child: ListTile(
        leading: Icon(Icons.shopping_cart),
        trailing: Icon(Icons.add_call),
      ),
    ),
        ),
        Container(
          
    decoration: BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Material(
          child: ListTile(
        leading: Icon(Icons.shopping_cart),
        trailing: Icon(Icons.add_call),
      ),
    ),
        ),
        Container(
          
    decoration: BoxDecoration(
      color: Colors.yellow,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Material(
          child: ListTile(
        leading: Icon(Icons.shopping_cart),
        trailing: Icon(Icons.add_call),
      ),
    ),
        ),
        Container(
          
    decoration: BoxDecoration(
      color: Colors.brown,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Material(
          child: ListTile(
        leading: Icon(Icons.shopping_cart),
        trailing: Icon(Icons.add_call),
      ),
    ),
        ),
        Container(
          
    decoration: BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Material(
          child: ListTile(
        leading: Icon(Icons.shopping_cart),
        trailing: Icon(Icons.add_call),
      ),
    ),
        ),
       
      ],);
  }
}