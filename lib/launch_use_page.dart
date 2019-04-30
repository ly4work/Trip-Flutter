import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  String printString = '';
  double moveX = 0;
  double moveY = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('LaunchUrl'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _launchURL();
              },
              child: Text('打开浏览器'),
            ),
            RaisedButton(
              onPressed: () {
                _openMap();
              },
              child: Text('打开地图'),
            ),
          ],
        ),
      ),
    ));
  }

  void _launchURL() async {
    const String url = 'http://www.devio.org/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openMap() async {
    //  打开schema_url
    // android
    String schema = 'geo:52.32,4.917';
    if (await canLaunch(schema)) {
      //  说明是安卓应用
      await launch(schema);
    } else {
      //  否则是ios应用
      schema = 'http://maps.apple.com/?ll=52.32,4.917';
      if(await canLaunch(schema)) {
        await launch(schema);
      }else {
        throw 'Could not launch $schema';
      }
    }
  }
}
