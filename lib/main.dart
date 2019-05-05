import 'package:flutter/material.dart';

void main() => runApp(LogoApp());

//  动画 anmiation类
class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => new _LogoAppState();
}

//  2. AnimatedBuilder 类
class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          height: animation.value,
          width: animation.value,
          child: child,
        );
      },
      child: child,
    ));
  }
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

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
    animation = Tween<double>(begin: 0, end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      animation: animation,
      child: LogoWidget(),
    );
  }
}
