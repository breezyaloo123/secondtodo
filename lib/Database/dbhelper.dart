import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo1/models/task.dart';
import '../models/user.dart';


class DbHelper {
  //we implement a singleton pattern
  // DbHelper._privateConstructor();
  // static final DbHelper instance = DbHelper._privateConstructor();
  static Database _database;
  static final table = 'todo';
  static final tache='tache';
  //  factory DbHelper ()
  //  {
  //    return instance;
  //  }

  Future<Database> get db async
  {
    if(_database != null)
    {
      return _database;
    }

    _database = await init();

    return _database;
  }

  Future<Database> init() async
  {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'database.db');
    var database = openDatabase(dbPath,version: 1, onCreate: _oncreate);
    return database;
  }
  void _oncreate(Database db, int version)
  {
    db.execute('''
    CREATE TABLE $table(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      prenom TEXT,
      nom TEXT,
      username TEXT,
      password TEXT,
      image TEXT)
    ''');
    db.execute('''
    CREATE TABLE $tache(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      type TEXT,
      nom TEXT,
      datedeb TEXT,
      datefin TEXT,
      userID TEXT)
    ''');
    print("Database was created");
  }
//method which add data to the database
  Future<int> addTodo(User user) async
  {
    var todoU = await db;
    //When a UNIQUE constraint violation occurs, 
    //the pre-existing rows that are causing the constraint violation are removed prior to inserting or updating the current row.
    return todoU.insert('$table', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
  //Method which add a task
  Future<int> addTask(Task task) async
  {
    var taskU= await db;

    return taskU.insert('$tache', task.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }
  
//method which get the photo
Future<String> fetchUser1(String username, String password) async
{
  var todoU = await db;
  var res;
  final Future<List<Map<String, dynamic>>> futureMaps = todoU.query('$table'); /*where: 'username = ? and password = ?',*//*whereArgs: [id]);*/

  var maps = await futureMaps;

  if(maps.length != 0)
  {
    //return User.fromMap(maps.first);
    for(var i in maps)
    {
      //print(i.values.elementAt(3)+ " "+i.values.elementAt(4) + " "+i.values.elementAt(5));
      if((i.values.elementAt(3) == username) && (i.values.elementAt(4) == password))
      {
        res=i.values.elementAt(5);
        return res;
      }
    }
  }
  return null;
}

Future<List<Map<String,dynamic>>> fetchUser2(String username, String password) async
{
  var todoU = await db;
  final Future<List<Map<String, dynamic>>> futureMaps = todoU.query('$table');

  return futureMaps;
}
//Fetch the tasks

Future<List<Map<String,dynamic>>> fetchTask() async
{
  var todoU = await db;
  final Future<List<Map<String, dynamic>>> futureMaps = todoU.query('$tache');

  return futureMaps;
}


//method which read data
Future<bool> fetchUser(String username, String password) async
{
  var todoU = await db;
  final Future<List<Map<String, dynamic>>> futureMaps = todoU.query('$table'); /*where: 'username = ? and password = ?',*//*whereArgs: [id]);*/

  var maps = await futureMaps;

  if(maps.length != 0)
  {
    //return User.fromMap(maps.first);
    for(var i in maps)
    {
      print(i.values.elementAt(3)+ " "+i.values.elementAt(4) + " "+i.values.elementAt(5));
      if((i.values.elementAt(3) == username) && (i.values.elementAt(4) == password))
      {
        return true;
      }
    }
  }

  return false;
}

// Future<List<User>> fetchAll() async
// {
//   var todoU = await db;
//   var res =  await todoU.query('$table');

//   if(res.isNotEmpty)
//   {
//     var todos = res.map((todoMap) => User.fromMap(todoMap)).toList();
//     return todos;
//   }
//   return [];
// }


  
}