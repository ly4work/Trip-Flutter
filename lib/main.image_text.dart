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
            // child: Container(
            //   child: Text(
            //     'hello baiyuhan',
            //     style: TextStyle(
            //       fontSize: 40.0,
            //       color: Colors.white
            //     ),
            //   ),
            //   alignment: Alignment.topLeft,
            //   width: 500.0,
            //   height: 300.0,
            //   // color: Colors.lightBlue[700],
            //   padding: const EdgeInsets.fromLTRB(50.0, 30.0, 0.0, 0.0),
            //   margin: const EdgeInsets.all(20.0),
            //   decoration: new BoxDecoration(
            //     gradient: const LinearGradient(
            //       colors: [
            //         Colors.lightBlue,
            //         Colors.greenAccent, 
            //         Colors.purple
            //       ]
            //     )
            //   ),
            // ),
            child: Container(
              child: new Image.network(
                'https://pic2.zhimg.com/v2-d0ad2750e40b27687dbf15079097213f_xl.jpg',
                scale: 1.5,
                // fit: BoxFit.scaleDown,
                color: Colors.blueAccent,
                colorBlendMode: BlendMode.lighten,
                repeat: ImageRepeat.repeat,
              ),
              width: 400.0,
              height: 300.0,
              color: Colors.lightBlue,
            ),
          ),
          // child: new TapBoxA()
        ));
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
