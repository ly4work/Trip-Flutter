import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() => runApp(MaterialApp(
      home: HeroAnimation(),
    ));

class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
          tag: photo,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Image.network(
                photo,
                fit: BoxFit.contain,
              ),
            ),
          )),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: PhotoHero(
          photo:
              'http://hbimg.b0.upaiyun.com/5e778c4fbfbe612b250babce22631bbcc26ff8bb1a674-FKsJib_fw658',
          width: 100.0,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Flippers Page'),
                ),
                body: Container(
                  color: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.topLeft,
                  child: PhotoHero(
                    photo:
                        'http://hbimg.b0.upaiyun.com/5e778c4fbfbe612b250babce22631bbcc26ff8bb1a674-FKsJib_fw658',
                    width: 200.0,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}
