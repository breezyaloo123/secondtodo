import 'package:flutter/material.dart';
import 'signin.dart';
import '../Database/dbhelper.dart';
//import '../models/user.dart';
import '../models/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool userVal;
  String username;
  String password;

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
              decoration: InputDecoration(
                hintText: "Entrer le mot de pass",
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
                onPressed: ()
                {
                  fetchData();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeApp()));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Creer un compte en cliquant "),
                    Icon(Icons.add_to_home_screen),
                  ],
                ),
                RaisedButton(
                  child: Text("Sign in"),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
                  },
                )
              ],
            )
            
          ],
        ),        
      ),
    );
  }

  void fetchData() async
  {
    
    var db = DbHelper();
  
    userVal = await db.fetchUser(username, password);

    if(userVal == true)
    {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeApp()));
    }
    else
    {
      _snackbar();
    }
  }

    _snackbar()
  {
    final snackbar = new SnackBar(
      content: Text("PLEASE CREATE AN ACCOUNT BEFORE CONNECTING"),
    );
    _scaffold.currentState.showSnackBar(snackbar);
}


}