import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'connection/signin.dart';
import 'connection/login.dart';


class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: CupertinoColors.link,
      appBar: AppBar(
        title: Text("Welcome"),
        leading: Icon(Icons.home),
        actions: <Widget>[
          Tooltip(
            message: "Home",
            child: Icon(Icons.info),
          ),
        ],
      ),
          body: Center(
            child: Stack(
        children: <Widget>[
            Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius:BorderRadius.circular(20),
              ),
              child: Column(

                children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/todo.png")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Login"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                      },
                    ),
                    RaisedButton(
                      child: Text("Signin"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
                      },
                    )
                  ],
                )
              ],),
            )
            
        ],
      ),
          ),
    );
  }
}