import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../models/user.dart';
import 'package:image_picker/image_picker.dart';
import '../Database/dbhelper.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/home.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String nom;
  String prenom;
  String pseudo;
  String password;
  String password1;
  var image;
  final db = DbHelper();
  bool ischecked = false;
  final _final = GlobalKey<FormState>();

  File _image;
  SharedPreferences pref;
  String way;
  String test;

  var result;

  Future getImage() async
  {
   File image = await ImagePicker.pickImage(source: ImageSource.gallery);
   print (image);
  Directory directory= await getApplicationDocumentsDirectory();
  final String path = directory.path;
  final String filename = basename(path);
  final File localImage= await image.copy('$path/$filename');
  test = '$path/$filename';
  pref = await SharedPreferences.getInstance();
  pref.setString('test', test);
  way = pref.getString('test');
  print(localImage);
  print(filename);
   setState(() {
     _image = image;
     result = image;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: Text("Inscription"),
        actions: <Widget>[
          Icon(Icons.supervisor_account)
        ],
      ),
      body: Container(
        width: 500,
        height: 600,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.purple,Colors.cyan]),
          //borderRadius: BorderRadius.circular(30)
        ),
        child: Form(
              key: _final,
              child: ListView(
                children:<Widget>[
                  Image.asset("assets/signin.png"),
                  Row(
                    children: <Widget>[
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: _image == null?
                          Text("No Image"):
                          Image.file(_image,fit: BoxFit.cover),
                        ),
                        width: 90,
                        height: 90,
                      ),
                      IconButton(
                        icon: Icon(Icons.add_a_photo),
                        onPressed: getImage,
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                    hintText: "Entrer votre prenom",
                    icon: Icon(Icons.account_circle)
                  ),
                  validator: (value)
                  {
                    return value.length<1? "trop court ": null;
                  },
                  onChanged: (value)
                  {
                    prenom = value.toString();
                  },
                ),
                  TextFormField(
                    decoration: InputDecoration(
                    hintText: "Entrer votre nom",
                    icon: Icon(Icons.account_circle)
                  ),
                  validator: (value)
                  {
                    return value.length<1? "trop court ": null;
                  },
                  onChanged: (value)
                  {
                    nom = value.toString();
                  },
                ),
                  TextFormField(
                    decoration: InputDecoration(
                    hintText: "Entrer votre pseudo",
                    icon: Icon(Icons.account_circle)
                  ),
                  validator: (value)
                  {
                    return value.length<5? "trop court ": null;
                  },
                  onChanged: (value)
                  {
                    pseudo = value.toString();
                  },
                ),
                  TextFormField(
                    decoration: InputDecoration(
                    hintText: "Donner le password",
                    icon: Icon(Icons.vpn_key),
                  ),
                  obscureText: true,
                  validator: (value)
                  {
                    return value.length<6 ?"password too short":null;
                  },
                  onChanged: (value)
                  {
                    password = value.toString();
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Confirmer le password",
                    icon: Icon(Icons.vpn_key),
                  ),
                  obscureText: true,
                  validator: (value)
                  {
                    if(value.length<6 && password!=password1)
                    {
                      return "password too short and differents";
                    }
                    else if(value.length==0)
                    {
                      return "passwords too short";
                    }
                      return password != password1? "passwords are difference" : null;
                    },
                  onChanged: (value)
                  {
                    password1 = value.toString();
                  },
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  child: RaisedButton(
                    child: Text("S'inscrire"),
                    onPressed: ()
                    {
                      if(_final.currentState.validate())
                      {
                        //User user = new User(prenom,nom,pseudo,password,image.toString());
                        insert();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeApp()));
                      }
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: ischecked,
                      onChanged: (value)
                      {
                        setState(() {
                          ischecked = ! ischecked;
                        });
                      },
                    ),
                    Text("Se souvenir de moi"),
                    Icon(Icons.restore)
                  ],
                )
                ]
              ),
            )
        ),
      );
  }

void insert() async
{
  
  User aa= User(prenom,nom,pseudo,password,_image.toString());
  await db.addTodo(aa);
  //setupList();
  /*
  User user = User(pseudo,password);
  await db.insertUser(user);
  */
 print("Data inserted successfully");
}

}