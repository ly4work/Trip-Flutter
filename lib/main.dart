import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _selectionController = new TextEditingController();
  @override
  void initState() {
    _selectionController.text = "hello world!";
    _selectionController.selection = TextSelection(
        baseOffset: 2, extentOffset: _selectionController.text.length);
    _unameController.addListener(() {
      print(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";
    return MaterialApp(
        title: '文字样式',
        home: Scaffold(
          appBar: AppBar(title: Text('文字样式')),
          // body: new _Drag(),

          body: Scrollbar(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: new Container(
                child: new Container(
                  child: DefaultTextStyle(
                      style: TextStyle(color: Colors.red, fontSize: 20.0),
                      textAlign: TextAlign.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new _ScaleTestRoute(),

                          Text('hello wolrd'),
                          Text('I am Leonaldo'),
                          Text(
                            'I am Zeus',
                            style:
                                TextStyle(inherit: false, color: Colors.grey),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              OutlineButton(
                                child: Text(
                                  "评论",
                                  style: TextStyle(color: Colors.black54),
                                ),
                                onPressed: () => {},
                                highlightedBorderColor: Colors.grey,
                              ),
                              IconButton(
                                icon: Icon(Icons.thumb_down),
                                onPressed: () => {},
                              ),
                              IconButton(
                                icon: Icon(Icons.thumb_up),
                                onPressed: () => {},
                              ),
                              IconButton(
                                icon: Icon(Icons.favorite),
                                onPressed: () => {},
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.fingerprint,
                                color: Colors.grey,
                                size: 40.0,
                              ),
                              Text(
                                '长按指纹识别',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                                                    Column(
                            children: <Widget>[
                              TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    labelText: '用户名',
                                    hintText: '用户名或邮箱',
                                    prefixIcon: Icon(Icons.person)),
                                controller: _selectionController,
                              ),
                              TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    labelText: '密码',
                                    hintText: '您的登录密码',
                                    prefixIcon: Icon(Icons.lock)),
                                obscureText: true,
                                controller: _unameController,
                              )
                            ],
                          ),
                          new SwitchAndCheckBoxTestRoute(),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ));
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Listener(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 300.0,
            height: 150.0,
            child: Text(_event?.toString() ?? "",
                style: TextStyle(color: Colors.white)),
          ),
          onPointerDown: (PointerDownEvent event) =>
              setState(() => _event = event),
          onPointerMove: (PointerMoveEvent event) =>
              setState(() => _event = event),
          onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
        ),
        Switch(
          value: _switchSelected,
          activeColor: Colors.green,
          onChanged: (value) {
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red,
          onChanged: (value) {
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}

class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }
}

class _ScaleTestRoute extends StatefulWidget {
  @override
  _ScaleTestRouteState createState() => new _ScaleTestRouteState();
}

class _ScaleTestRouteState extends State<_ScaleTestRoute> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        //指定宽度，高度自适应
        child: Image.network(
            "https://www.ipmtalk.com/public/uploads/20190418/3d6265da3ba74876a46e85167c7ad006_300240.png",
            width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            //缩放倍数在0.8到10倍之间
            _width = 200 * details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}
