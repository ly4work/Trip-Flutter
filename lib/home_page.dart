import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
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
                          Chip(
                              avatar: Icon(Icons.gps_fixed),
                              label: Text('打开定位'),
                              backgroundColor: Colors.white12),
                          Container(
                            height: 200.0,
                            margin: EdgeInsets.only(top: 10),
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                            child: PageView(
                              children: <Widget>[
                                _item('banner1', Colors.deepPurple),
                                _item('banner2', Colors.green),
                                _item('banner3', Colors.pink),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: _handleRefresh,
              )
            : Container(
                child: Center(
                  child: Text(
                    '个人中心',
                    textAlign: TextAlign.center,
                  ),
                ),
                padding: EdgeInsets.all(20.0),
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
}
