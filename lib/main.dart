import 'package:chak/home_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '指尖',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Trip-Lik'),
        ),
        body: HomePage(),
      ),
    );
  }
}
