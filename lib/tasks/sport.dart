import 'package:flutter/material.dart';

class Sport extends StatefulWidget {
  @override
  _SportState createState() => _SportState();
}

class _SportState extends State<Sport> {
  DateTime _dateTime;
  String task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text("SPORT"),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          Icon(Icons.check),
          
        ],
      ),
      body: Stack(
        alignment:AlignmentDirectional.bottomStart ,
        children: [
        Container(
          height: 540.0,
          child: ListView(
            children: <Widget>[
              Center(child: Text(task==null?'':task.toString())),
              Text(_dateTime==null?'':_dateTime.toString()),
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
                Column(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.arrow_upward),
                    onPressed: ()
                    {

                    }),
                    Text("Valider")
                  ],
                )
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}