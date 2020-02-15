import 'package:flutter/material.dart';

class TaskRead extends StatefulWidget {
  @override
  _TaskReadState createState() => _TaskReadState();
}

class _TaskReadState extends State<TaskRead> {
  
  @override
  Widget build(BuildContext context) {
    String task;
    String nn;
    DateTime _dateTime;
    
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text("READ"),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          Icon(Icons.done_outline),
          
        ],
      ),
      body: Stack(
        alignment:AlignmentDirectional.bottomStart ,
        children: [
        Container(
          height: 540.0,
          child: ListView(
            children: <Widget>[
              Center(child: Text("Cool")),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
              border: Border.all(width: 2.0,color: Colors.blue),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.add_alarm),
                    onPressed: () async
                    {
                        await showDatePicker(
                          context: context, 
                          initialDate: _dateTime==null? DateTime.now():_dateTime, 
                          firstDate: DateTime(1960),
                          lastDate: DateTime(2222)
                            )
                    .then((date)
                      {
                          setState(() {
                          _dateTime=date;
                      });
                      });
                    }),
                    Text("Debut"),
                  ],
                ),
                Container(
                  height: 100,
                  width: 190,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Que voulez vous faire?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        
                      )
                      ),
                      onChanged: (value){
                        task=value.toString();
                      },
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add_alarm),
                      onPressed: () async
                      {
                        await showDatePicker(
                          context: context, 
                          initialDate: _dateTime==null? DateTime.now():_dateTime, 
                          firstDate: DateTime(1960),
                          lastDate: DateTime(2222)
                            )
                    .then((date)
                      {
                          setState(() {
                          _dateTime=date;
                      });
                      });
                      },
                    ),
                    Text("Fin"),
                  ],
                ),
                IconButton(icon: Icon(Icons.call_missed), 
                onPressed: ()
                {
                  setState(() {
                    nn=task;
                  });
                })
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}