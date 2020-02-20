import 'package:flutter/material.dart';
import 'signin.dart';
import '../Database/dbhelper.dart';
//import '../models/user.dart';
import '../models/home.dart';
import '../models/date_picker.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool userVal;
  String username;
  String password;
  String image;
  String name;
  var db = DbHelper();
  final _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text("Login Page"),
        actions: <Widget>[
          Icon(Icons.vpn_key)
        ],
      ),
      body: Container(
        width: 500,
        height: 600,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.purple,Colors.blue]),
          //borderRadius: BorderRadius.circular(30),
        ),
        child: ListView(
          children: <Widget>[
            Image.asset("assets/login.png"),
            TextFormField(
              
              enableSuggestions: true,
              toolbarOptions: ToolbarOptions(
                copy: true,
                cut: true,
                paste: true,
                selectAll: true
              ),
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                hintText: "Entrer votre pseudo",
                icon: Icon(Icons.account_circle),
              ),
              onChanged: (value)
              {
                username = value.toString();
              },
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "Entrer le mot de passe",
                icon: Icon(Icons.vpn_key),
              ),
              obscureText: true,
              onChanged: (value)
              {
                password=value.toString();
              },
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 10,
              height: 48,
              child: RaisedButton(
                child: Text("Login"),
                onPressed: () async
                {
                  // fetchData();
                  // //var name = await db.fetchUser1(username,password);
                  // print(name);
                  fetchUser();
                  
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Creer un compte en cliquant "),
                    IconButton(icon: Icon(Icons.add_to_home_screen), onPressed:()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
                        }
                    ),
                  ],
                ),
                // RaisedButton(
                //   child: Text("Sign in"),
                //   onPressed: ()
                //   {
                //     Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
                //   },
                // )
              ],
            )
            
          ],
        ),        
      ),
    );
  }


 void fetchUser() async
{

  var maps = await db.aa(username, password);

  if(maps.length != 0)
  {
    //return User.fromMap(maps.first);
    for(var i in maps)
    {
      print(i.values.elementAt(3)+ " "+i.values.elementAt(4) + " "+i.values.elementAt(5));
      if((i.values.elementAt(3) == username) && (i.values.elementAt(4) == password))
      {
        name=i.values.elementAt(1)+" "+i.values.elementAt(2);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeApp(way:name)));
        
      }
      else
      {
          _snackbar();
      }
    }
  }
} 

  // void fetchData() async
  // {
    
  //   userVal = await db.fetchUser(username, password);

  //   if(userVal == true)
  //   {
      
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeApp(way: username)));
  //     //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeApp()));
  //   }
  //   else
  //   {
  //     _snackbar();
  //   }
  // }

    _snackbar()
  {
    final snackbar = new SnackBar(
      content: Text("PLEASE CREATE AN ACCOUNT BEFORE CONNECTING"),
    );
    _scaffold.currentState.showSnackBar(snackbar);
}


}