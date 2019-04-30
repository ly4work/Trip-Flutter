import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printString = '';
  double moveX = 0;
  double moveY = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          body: FractionallySizedBox(
            widthFactor: 1.0,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => _printMsg('点击'),
                      onDoubleTap: () => _printMsg('点击'),
                      onLongPress: () => _printMsg('长按'),
                      onTapCancel: () => _printMsg('取消'),
                      onTapUp: (e) => _printMsg('松开'),
                      onTapDown: (e) => _printMsg('按下'),
                      child: Container(
                        padding: EdgeInsets.all(60.0),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                        ),
                        child: Text(
                          '点我',
                          style: TextStyle(fontSize: 30.0, color: Colors.white),
                        ),
                      ),
                    ),
                    Text(printString)
                  ],
                ),
                Positioned(
                  //  跟着手指滑动的小球
                  left: moveX,
                  top: moveY,
                  child: GestureDetector(
                    onPanUpdate: (e) {
                      _doMove(e);
                    },
                    child: Container(
                      width: 72.0,
                      height: 72.0,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(36.0)
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }


  void _printMsg(String msg) {
    setState(() {
      printString = '$printString, $msg';
    });
  }

  void _doMove(DragUpdateDetails e) {
    setState(() {
      moveY = this.moveY + e.delta.dy;
      moveX = this.moveX +  e.delta.dx; 
    });
  }
}
