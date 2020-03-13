import 'package:flutter/material.dart';
import 'package:todo1/Database/dbhelper.dart';

class AllTasks extends StatefulWidget {
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  var db = new DbHelper();
  String val;
  bool taskVal = false;
  List<Map<String, dynamic>> map = new List<Map<String, dynamic>>();
  List<String> tt = new List<String>();
  @override
  void initState() {
    super.initState();
   
  }
  showTask() async
{
  var res = await db.fetchTask();
  
  for(var i in res)
  {
   // map.add(i);
    //map[0].values.elementAt(2);
    print(i.values.elementAt(2));
    tt.add(i.values.elementAt(2));
    val=i.values.elementAt(2);
  }
  
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
        itemCount: tt.length,
        itemBuilder: (BuildContext context,int position)
        {
          return show(position);
        });
  }



Widget show(int position)
{
  //showTask();
  return ListTile(
    leading: Text(tt[position].toString()),
    trailing: Checkbox(value: taskVal, onChanged: (value)
    {
      setState(() {
       taskVal= !taskVal;
      });
    }),
  );
}


}