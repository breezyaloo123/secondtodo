import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_dateTime==null?'not available':_dateTime.toString()),
            IconButton(icon: Icon(Icons.access_alarms),
             onPressed: () async
             {
              await showDatePicker(
                context: context, 
                initialDate: _dateTime==null? DateTime.now():_dateTime, 
                firstDate: DateTime(1960),
                lastDate: DateTime(2222))
                .then((date)
                {
                  setState(() {
                    _dateTime=date;
                });
                });
              }),
          ],
        ),
      ),
    );
  }
}