import 'package:flutter/material.dart';
import 'package:todo1/Database/dbhelper.dart';
import 'package:todo1/models/task.dart';

class AllTasks extends StatefulWidget {
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  var db = new DbHelper();

  List<Task> test= new List<Task>();

showTask() async
{
  var res = await db.fetchTask();
  
  for(var i in res)
  {
   
    print(i);
    print(i.values.elementAt(2));
    test.add(new Task(task: i.values.elementAt(2),datedeb: i.values.elementAt(3),dateFin: i.values.elementAt(4),
    type: i.values.elementAt(1),userID: "",val: false));

  }

  return 0;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read Tasks"),
        centerTitle: true,

      ),
      body: FutureBuilder(
        future: showTask(),
        builder: (BuildContext context, AsyncSnapshot snapchot)
      {
          if(snapchot.hasData)
          {
            
            return listview();
          }
          else if(snapchot.hasError)
          {
            return Text(snapchot.error.toString());
          }
          else
          {
            return Center(
              child: CircularProgressIndicator(
                
                backgroundColor: Colors.green,
              ),
            );
          }
      }),
      
    );
  }

  Widget listview()
  {
    return ListView.builder(
        itemCount: test.length,
        itemBuilder: (BuildContext context,int position)
        {
          return show(position);
        });
  }



Widget show(int position)
{
  
  return Card(
    elevation: 5.0,
    margin: EdgeInsets.symmetric(
      vertical: 5.0,
      horizontal: 10.0,
    ),
    child: Container(
      padding: EdgeInsets.all(5.0),
      child: ListTile(
    leading: Text(test[position].task),
    trailing: Checkbox(value: test[position].val, onChanged: (value)
    {
      setState(() {
       test[position].val = ! test[position].val;
      });
    }),
  ),
    ),
  );
}


}