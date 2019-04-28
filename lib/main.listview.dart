import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'pmtalk',
        home: Scaffold(
            appBar: new AppBar(
              title: Text('Listview Widget'),
            ),
            body: new ListView(
              children: <Widget>[
                new Image.network(
                    'https://www.ipmtalk.com/public/uploads/20190417/735d9b8213392d785befb8e68eb3f263_300240.jpg', 
                    // scale: 1.5,
                    ),
                new Image.network(
                    'https://www.ipmtalk.com/public/uploads/20190417/af09f4dd82663cf9d25dc77114a0dade_300240.png', 
                    // scale: 1.5,
                    ),
                new Image.network(
                    'https://www.ipmtalk.com/public/uploads/20190417/af09f4dd82663cf9d25dc77114a0dade_300240.png', 
                    // scale: 1.5,
                    ),
                new ListTile(
                  leading: new Icon(Icons.bluetooth_audio),
                  title: Text('蓝牙'),
                ),
                new ListTile(
                  leading: new Icon(Icons.wifi),
                  title: Text('网络连接'),
                ),
                new ListTile(
                  leading: new Icon(Icons.apps),
                  title: Text('应用市场'),
                ),
              ],
            )));
  }
}
