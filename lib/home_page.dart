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
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView(
                  children: <Widget>[
                    Chip(
                      avatar: Icon(Icons.local_activity),
                      label: Text('定位'),
                    )
                  ],
                ),
              )
            : Text('个人中心'),
      ),
    );
  }
}
