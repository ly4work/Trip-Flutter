import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                title: Text('首页'),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                title: Text('个人中心'))
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              ClipOval(
                                child: SizedBox(
                                  width: 100.0,
                                  height: 100.0,
                                  child: Image.network(
                                    'http://www.devio.org/img/avatar.png',
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                ),
                              ),
                              Padding(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    child: Opacity(
                                      opacity: 0.6,
                                      child: Image.network(
                                        'http://www.devio.org/img/avatar.png',
                                        width: 100.0,
                                        height: 100.0,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10.0)),
                            ],
                          ),
                          Chip(
                              avatar: Icon(Icons.gps_fixed),
                              label: Text('打开定位'),
                              backgroundColor: Colors.white12),
                          Container(
                            height: 200.0,
                            margin: EdgeInsets.all(10.0),
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                            child: PhysicalModel(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(6.0),
                              clipBehavior: Clip.antiAlias,
                              child: PageView(
                                children: <Widget>[
                                  _item('banner1', Colors.deepPurple),
                                  _item('banner2', Colors.green),
                                  _item('banner3', Colors.pink),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              FractionallySizedBox(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent),
                                    child: new Align(
                                      child: Text('宽度Full'),
                                      alignment: Alignment.center,
                                    )),
                                widthFactor: 1.0,
                              ),
                              Stack(
                                children: <Widget>[
                                  Image.network(
                                    'http://www.devio.org/img/avatar.png',
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                  Positioned(
                                    child: Image.network(
                                      'http://www.devio.org/img/avatar.png',
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                    left: 0,
                                    bottom: 0,
                                  )
                                ],
                              )
                            ],
                          ),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 6.0,
                            children: <Widget>[
                              _chip('Flutter'),
                              _chip('Flutter'),
                              _chip('Flutter'),
                              _chip('Flutter'),
                              _chip('Flutter'),
                              _chip('Flutter'),
                              _chip('Flutter'),
                              _chip('Flutter'),
                              _chip('Flutter'),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: _handleRefresh,
              )
            : Column(
                children: <Widget>[
                  Text('liebiao'),
                  Expanded(
                    child: Container(
                      child: Text('拉伸填满高度'),
                      decoration: BoxDecoration(color: Colors.red),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _item(String title, MaterialColor color) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: color),
        child: Text(title,
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.white,
            )));
  }

  _chip(String s) {
    return Chip(
        label: Text(
          s.substring(0, 1),
          style: TextStyle(fontSize: 10.0),
        ),
        avatar: CircleAvatar(
          backgroundColor: Colors.blue.shade900,
        ));
  }
}
