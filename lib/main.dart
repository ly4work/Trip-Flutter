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
              child: Text(
                '# nali @ nali# nali @ nali# nali @ nali# nali @ nali# nali @ nali# nali @ nali# nali @ nali# nali @ nali# nali @ nali# nali @ nali# nali @ nalidembp-3 in ~/Documents/nardo.li/plan/chak on git:dev x [0:34:33] C:3',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color.fromARGB(255, 255, 150, 150),
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid
                ),
                maxLines: 6,
                overflow: TextOverflow.fade,
              ),
            )));
  }
}
