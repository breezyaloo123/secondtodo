import 'package:flutter/material.dart';

class TaskRead extends StatefulWidget {
  @override
  _TaskReadState createState() => _TaskReadState();
}

class _TaskReadState extends State<TaskRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text("READ"),
        elevation: 0.0,
        actions: <Widget>[
          Icon(Icons.done_outline),
        ],
      ),
      body: ListView(
        children: [
        Column(
              children:<Widget>[
              Icon(Icons.add_alarm),
              Text("Debut"),
              Container(
              decoration: BoxDecoration(
                
              ),
                child: TextField(
    
                  decoration: InputDecoration(
    
                    border: OutlineInputBorder(
    
                      borderRadius: BorderRadius.circular(10.0),
    
                    ),
    
                    hintText: "Que voulez-vous faire?",
    
                    hoverColor: Colors.cyan,
    
                  ),
    
                  onChanged: (value)
    
                  {
    
    
    
                  },
    
                ),
    
              )
    
            ],
  ),
],
      ),
    );
  }
}