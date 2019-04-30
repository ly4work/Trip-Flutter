import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                //  渐进式加载图片
                Center(child: CircularProgressIndicator()),
                Center(
                  child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: 'http://www.devio.org/img/avatar.png'),
                )
              ],
            ),
            Stack(
              children: <Widget>[
                //  渐进式加载图片
                Center(
                    child: CachedNetworkImage(
                      placeholder: (context, url) => CircularProgressIndicator(),
                        imageUrl: 'https://picsum.photos/250?image=9')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
