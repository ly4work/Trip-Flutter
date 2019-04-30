import 'package:chak/flutter_layout_page.dart';
import 'package:chak/gesture_page.dart';
import 'package:chak/home_page.dart';
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
        body: RouteNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        'layout': (BuildContext context) => LayoutPage(),
        'home': (BuildContext context) => HomePage(),
        'gesture': (BuildContext context) => GesturePage(),
        'resource': (BuildContext context) => ResPage(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => new _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text('${byName ? "": "不"}通过路由名跳转'),
            value: byName,
            onChanged: (value) {
              setState(() {
                byName = value;
              });
            },
          ),
          _item('layout 组件 Demo', LayoutPage(), 'layout'),
          _item('HomePage 组件 Demo', HomePage(), 'HomePage'),
          _item('GesturePage 组件 Demo', GesturePage(), 'GesturePage'),
          _item('ResPage 组件 Demo', ResPage(), 'ResPage'),
        ],
      ),
    );
  }

  _item(String title, page, String routerName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          //  通过路由名跳转
          if(byName){
            Navigator.pushNamed(context, routerName);
          }else {
            //  通过路由直接builder组件
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
