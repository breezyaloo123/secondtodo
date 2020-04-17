import 'package:flutter/material.dart';
import 'package:todo1/Database/dbhelper.dart';
import 'package:todo1/models/task.dart';
import 'globalThing.dart' as global;

class AllTasks extends StatefulWidget {
 AllTasks(this.listTask);
List<Task> listTask;
//  final String value;
//   AllTasks({Key key,@required this.value}) : super(key:key);
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  //  String value;
  // _AllTasksState({this.value});
 
 var db = new DbHelper();

    String typeTask = global.typeTask;
    bool ischecked;

//   Future getData() async
//  {
//    listTask = await db.fetchTask(value); 
//    print(listTask);
//    return listTask;
//  }
  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$typeTask Tasks"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.check), 
          onPressed:() async
          {
            for (var i = 0; i < widget.listTask.length; i++) 
              {

                var dbInstance = await DbHelper().db;
                  if(widget.listTask[i].val==true)
                  {
                    int requestUpdate =await dbInstance.rawUpdate("UPDATE tache SET etat=1 WHERE id= ${widget.listTask[i].id}");
                    print(requestUpdate);
                  }
                  else
                  {
                    int requestUpdate = await dbInstance.rawUpdate("UPDATE tache SET etat=0 WHERE id= ${widget.listTask[i].id}");
                    print(requestUpdate);
                    print("gooooood");
                  }

                }
          }),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.listTask.length,
        itemBuilder: (BuildContext context,int position)
        {
         
          var list = widget.listTask[position];
          return Card(
            color: Colors.cyan,
            elevation: 5.0,
            margin: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0
            ),
              child: Container(
              padding: EdgeInsets.all(5.0),
              child: CheckboxListTile(
                title: Text(list.task.toString()),
                value: list.val, 
              onChanged:(ischecked)
              {
                setState(() {
                  list.val = ischecked;
                  widget.listTask[position].val = list.val;
                });
              }),
            ),
          );
        }
        
        ),
    );
  }

 

}