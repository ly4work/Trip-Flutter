import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math' as math;

void main() => runApp(MaterialApp(
      home: RadialExpansionDemo(),
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
            color: Theme.of(context).primaryColor.withOpacity(0.25),
            child: InkWell(
              onTap: onTap,
              child: LayoutBuilder(
                builder: (context, size) {
                  return Image.network(
                    photo,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
          )),
    );
  }
}

class Photo extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;
  const Photo({Key key, this.photo, this.onTap, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Material(
        color: Theme.of(context).primaryColor.withOpacity(0.25),
        child: InkWell(
          onTap: onTap,
          child: LayoutBuilder(
            builder: (context, size) {
              return Image.network(
                photo,
                fit: BoxFit.contain,
              );
            },
          ),
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  const RadialExpansion({Key key, this.maxRadius, this.child})
      : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: SizedBox(
            width: clipRectSize,
            height: clipRectSize,
            child: ClipRect(
              child: child,
            )));
  }
}

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }
  final String tit = '123';
  static Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child: RadialExpansion(
                    maxRadius: kMaxRadius,
                    child: Photo(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 2.0,
      height: kMinRadius * 2.0,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialExpansion(
            maxRadius: kMaxRadius,
            child: Photo(
              photo: imageName,
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder<void>(
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return AnimatedBuilder(
                          animation: animation,
                          builder: (BuildContext context, Widget child) {
                            return Opacity(
                              opacity: opacityCurve.transform(animation.value),
                              child:
                                  _buildPage(context, imageName, description),
                            );
                          });
                    },
                  ),
                );
              },
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0; // 1.0 is normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radial Transition Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHero(
                context,
                'http://hbimg.b0.upaiyun.com/5e778c4fbfbe612b250babce22631bbcc26ff8bb1a674-FKsJib_fw658?v=1',
                '人人影视'),
            _buildHero(
                context,
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557083450786&di=7b36ecf795cb3be710d05b4968b1bc91&imgtype=0&src=http%3A%2F%2Fpic.51yuansu.com%2Fpic3%2Fcover%2F03%2F44%2F06%2F5ba252491dc55_610.jpg',
                '喜马拉雅'),
            _buildHero(
                context,
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2683732251,1127673653&fm=26&gp=0.jpg',
                '优酷'),
          ],
        ),
      ),
    );
  }
}
