import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signin.dart';
import '../Database/dbhelper.dart';
import '../models/home.dart';
import '../models/globalThing.dart' as value;
import 'package:flutter_emoji/flutter_emoji.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var parser = EmojiParser();
  String toff;
  bool userVal;
  String username;
  String password;
  String image;
  String name;
  bool checked=false;
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
                  fetchUser();  
                },
              ),
            ),
            Row(
              
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text("Creer un compte en cliquant "),
                    ),
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
            ),
            Row(
              
              children: <Widget>[
                Checkbox(value: checked ,onChanged: (value)
                {
                  setState(() {
                    checked=!checked;
                  });
                }),
                Text("Se Souvenir de moi"),
              ],
            )
            
          ],
        ),        
      ),
    );
  }


 void fetchUser() async
{

  var maps = await db.fetchUser2(username, password);

  if(maps.length != 0)
  {
    //return User.fromMap(maps.first);
    for(var i in maps)
    {
      print(i.values.elementAt(3)+ " "+i.values.elementAt(4) + " "+i.values.elementAt(5));
      if((i.values.elementAt(3) == username) && (i.values.elementAt(4) == password))
      {
        
        setState(() {
          value.username =i.values.elementAt(1);
          //value.pathImage = i.values.elementAt(5);
          value.pseudo=i.values.elementAt(3);
        });

        SharedPreferences preferences= await SharedPreferences.getInstance();

        //await preferences.setString('username', i.values.elementAt(1).toString());

        if(checked==true)
        {
          await preferences.setBool('connect', true);
        }
        else
        {
          await preferences.setBool('connect', false);
        }
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeApp()));
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
      content: Text("PLEASE CREATE AN ACCOUNT BEFORE CONNECTING "+parser.emojify(":lock:")),
    );
    _scaffold.currentState.showSnackBar(snackbar);
}


}