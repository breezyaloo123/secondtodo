import 'package:flutter/material.dart';
import 'package:todo1/Database/dbhelper.dart';
import 'package:todo1/models/task.dart';
import '../models/globalThing.dart' as value;

class TaskRead extends StatefulWidget {
  String val;
  TaskRead({Key key,@required this.val}):super(key:key);

  @override
  _TaskReadState createState() => _TaskReadState(val: this.val);
}

class _TaskReadState extends State<TaskRead> {
  String val;
  _TaskReadState({this.val});
    DateTime _dateTime;
    DateTime _dateTime1;
    Future<DateTime> deb;
    String task;
    String pseudo;
    String nn;
    String type ="READ";
    String datedeb;
    String datefin;

    var db = new DbHelper();
  


  @override
  Widget build(BuildContext context) {


    
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text(val),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.check), 
          onPressed: ()
          {
            addTask();
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
              Text(task==null?'':task.toString()),
              Text(_dateTime==null?'':datedeb=_dateTime.day.toString()+'-'+_dateTime.month.toString()+'-'+_dateTime.year.toString()),
              Text(_dateTime1==null?'':datefin=_dateTime1.day.toString()+'-'+_dateTime1.month.toString()+'-'+_dateTime1.year.toString()),
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

                          firstDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
                          lastDate: DateTime(2222),
                          builder: (BuildContext context, Widget child)
                          {
                            return Theme(data: ThemeData.dark(), child: child);
                          }
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
                          initialDate: _dateTime1==null? _dateTime:_dateTime1, 
                          firstDate: _dateTime,
                          lastDate: DateTime(2222),
                          builder: (BuildContext context, Widget child)
                          {
                            return Theme(data: ThemeData.dark(), child: child);
                          }
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

  DateTime getDate(DateTime t)
  {
    if(DateTime.now().compareTo(t)==0)
    {
      setState(() {
        _dateTime=t;
        return _dateTime;
      });
    }
    else{
      setState(() {
        _dateTime = DateTime.now();
        return _dateTime;
      });
    }
  }

  void addTask() async
  {
    Task task1 = new Task(task: task,datedeb: datedeb,dateFin: datefin,type: val,userID: value.pseudo,val: false);
    await db.addTask(task1);
    print("Successful");
  }
}