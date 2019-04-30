import 'package:chak/flutter_layout_page.dart';
import 'package:chak/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '指尖',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LayoutPage(),
    );
  }
}
