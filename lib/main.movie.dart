import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '电影海报实例',
      home: Scaffold(
          appBar: AppBar(title: Text('电影海报')),
          body: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 0.5
            ),
            children: <Widget>[
              new Image.network(
                'http://img5.mtime.cn/mg/2019/04/12/101046.80895992_1280X720X2.jpg',
                fit: BoxFit.cover,
              ),
              new Image.network(
                'http://img5.mtime.cn/mg/2019/02/27/171111.35675299_1280X720X2.jpg',
                fit: BoxFit.cover,
              ),
              new Image.network(
                'http://img5.mtime.cn/mg/2018/09/28/110624.49324522_1280X720X2.jpg',
                fit: BoxFit.cover,
              ),
              new Image.network(
                'http://img5.mtime.cn/mg/2019/04/12/101046.80895992_1280X720X2.jpg',
                fit: BoxFit.cover,
              ),
              new Image.network(
                'http://img5.mtime.cn/mg/2019/02/27/171111.35675299_1280X720X2.jpg',
                fit: BoxFit.cover,
              ),
              new Image.network(
                'http://img5.mtime.cn/mg/2018/09/28/110624.49324522_1280X720X2.jpg',
                fit: BoxFit.cover,
              ),
              new Image.network(
                'http://img5.mtime.cn/mg/2019/04/12/101046.80895992_1280X720X2.jpg',
                fit: BoxFit.cover,
              ),
              new Image.network(
                'http://img5.mtime.cn/mg/2019/02/27/171111.35675299_1280X720X2.jpg',
                fit: BoxFit.cover,
              ),
              new Image.network(
                'http://img5.mtime.cn/mg/2018/09/28/110624.49324522_1280X720X2.jpg',
                fit: BoxFit.cover,
              ),
            ],
          )),
    );
  }
}
