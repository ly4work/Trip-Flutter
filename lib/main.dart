import 'package:chak/res_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '指尖',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('主页'),
        ),
        body: Image(width: 24.0, height: 24.0, image: AssetImage('assets/avatar.png')),
      ),
    );
  }
}
