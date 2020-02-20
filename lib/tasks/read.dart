import 'package:flutter/material.dart';

class TaskRead extends StatefulWidget {
  @override
  _TaskReadState createState() => _TaskReadState();
}

class _TaskReadState extends State<TaskRead> {
    DateTime _dateTime;
    DateTime _dateTime1;
    String task;
    String nn;
  @override
  Widget build(BuildContext context) {


    
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text("READ"),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.check), 
          onPressed: ()
          {

          })
          
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
              Text(_dateTime1==null?'':_dateTime1.toString()),
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
                          initialDate: _dateTime1==null? DateTime.now():_dateTime1, 
                          firstDate: DateTime(1960),
                          lastDate: DateTime(2222)
                            )
                    .then((date)
                      {
                          setState(() {
                          _dateTime1=date;
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
                      setState(() {
                        
                      });
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