import 'package:flutter/material.dart';

void main() => runApp(LogoApp());

//  动画 anmiation类
class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((AnimationStatus state) {
        setState(() {
          animationStatus = state;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                controller.reset();
                controller.forward();
              },
              child: Text(
                'Start',
                textDirection: TextDirection.ltr,
              ),
            ),
            Text('State: ' + animationStatus.toString(),
                textDirection: TextDirection.ltr),
            Text('Value: ' + animationValue.toString(),
                textDirection: TextDirection.ltr),
            Text('abc: ', textDirection: TextDirection.ltr),
            Container(
              height: animation.value,
              width: animation.value,
              child: FlutterLogo(),
            ),
          ],
        ));
  }
}
