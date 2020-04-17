import 'package:flutter/material.dart';
import 'package:todo1/Database/dbhelper.dart';
import 'package:todo1/models/task.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class TaskHistoric extends StatefulWidget {
   TaskHistoric(this.historic);
List<Task> historic;
  @override
  _TaskHistoricState createState() => _TaskHistoricState();
}

class _TaskHistoricState extends State<TaskHistoric> {
  var parser = EmojiParser();
   

void deleteTask(int id) async
{
  var db =await DbHelper().db;
  var request = await db.rawDelete("DELETE FROM tache WHERE id = $id");
  print("Suppression $request reussi avec succes");
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.4),
      appBar: AppBar(
        title: Text("l\'historique des Taches"+" "+parser.emojify(':chains:')+parser.emojify(':wrench:'),style: TextStyle(
          color: Colors.blue
        ),),
        backgroundColor: Colors.white.withOpacity(0.5),
        centerTitle: true,
      ),
      body: ListView.builder(
        
        itemCount: widget.historic.length,
        itemBuilder: (BuildContext context,int position)
        {
          var listH = widget.historic[position];
          return Dismissible(
            key: Key(listH.task.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              child: Icon(Icons.cancel,color: Colors.black,),
            ),
            onDismissed: (direction)
            {
              setState(() {
                widget.historic.removeAt(position);
                deleteTask(listH.id);
              });
            },
            child: ListTile(
              leading:Text(listH.task.toString() + parser.emojify(':coffee:'),style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),),
            ),
          );
        }
      ),
    );
  
  }
}