import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() => runApp(MyApp());
Utf8Decoder utf8decoder = Utf8Decoder();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('http'),
        ),
        body: Column(children: <Widget>[
          RaisedButton(
            child: Text('increment'),
            onPressed: _incrementCoutner,
          ),
          RaisedButton(
            onPressed: _getCounter,
            child: Text('get count'),
          ),
          Text(countString)
        ]),
      ),
    );
  }

  _incrementCoutner() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countString = countString + ' 1';
    });

    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', counter);
  }

  _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter').toString();
    });
  }
}
