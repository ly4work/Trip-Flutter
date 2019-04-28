import 'package:flutter/material.dart';

void main() =>
    runApp(MyApp(items: new List<String>.generate(50, (i) => "item $i")));

class MyApp extends StatelessWidget {
  final List<String> items;
  MyApp({Key key, @required this.items}) : super(key: key);

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
                new ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return new ListTile(
                      key: key,
                      title: new Text('${items[index]}'),
                    );
                  },
                ),
                new Container(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Home: '),
                        TextSpan(text: 'https://flutterchina.club', style: TextStyle(
                          color: Colors.blue,
                        ),
                        // recognizer: _tapRecognizer
                        )
                      ]
                    )
                  ),
                )
              ],
            )));
  }
}

class BannerListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        new Container(
          width: 180.0,
          color: Colors.blueAccent,
        ),
        new Container(
          width: 180.0,
          color: Colors.orange,
        ),
        new Container(
          width: 180.0,
          color: Colors.pink,
        )
      ],
    );
  }
}

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
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
    );
  }
}
