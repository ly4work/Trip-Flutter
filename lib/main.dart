import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hellow World',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Welcome Flutter'),
            ),
            body: Center(
              // child: Text(
              //   '# nali ',
              //   textAlign: TextAlign.left,
              //   style: TextStyle(
              //       fontSize: 25.0,
              //       color: Color.fromARGB(255, 255, 150, 150),
              //       decoration: TextDecoration.underline,
              //       decorationStyle: TextDecorationStyle.solid),
              //   maxLines: 6,
              //   overflow: TextOverflow.fade,
              // ),
              child: new TapBoxA()
            )));
  }
}

class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);
  @override
  _TapBoxAState createState() => new _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(_active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}
