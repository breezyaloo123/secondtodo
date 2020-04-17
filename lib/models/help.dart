//    List<Task> test= new List<Task>();
//   List<Task> task1 = [];
//   var db = new DbHelper();
  
//  Future getData() async
//   {
//       test =await db.fetchTask(value);
//       return test;
//   }
 
//   bool val=false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("$value Tasks"),
//         centerTitle: true,

//       ),
//       body: FutureBuilder(
//         future: getData(),
//         builder: (BuildContext context, AsyncSnapshot snapchot)
//       {
//           if(snapchot.hasData)
//           {
            
//             return listview();
//           }
//           else if(snapchot.hasError)
//           {
//             return Text(snapchot.error.toString());
//           }
//           else
//           {
//             return Center(
//               child: CircularProgressIndicator(
                
//                 backgroundColor: Colors.green,
//               ),
//             );
//           }
//       }),
      
//     );
//   }

//   Widget listview()
//   {
//     return ListView.builder(
//         itemCount: test.length,
//         itemBuilder: (BuildContext context,int index)
//         {

//           return show(index);
//         });
//   }



// Widget show(int position)
// {
//   final task = test[position];
  
//   return Card(
//     color: Colors.cyan,
//     elevation: 5.0,
//     margin: EdgeInsets.symmetric(
//       vertical: 5.0,
//       horizontal: 10.0,
//     ),
//     child: Container(
//       padding: EdgeInsets.all(5.0),
//       child:  CheckboxListTile(
//         value: task.val, 
//         title: Text(task.task),
//   onChanged: (value) 
//   {
//     setState(() {
//      task.val = value;
     
//     });
//   }),
//     ),
//   );
// }
