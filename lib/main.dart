import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

const COUNTRY = {
  '中国': ['北京', '上海', '广州', '深圳', '成都', '武汉', '杭州', '苏州', '重庆', '天津'],
  '俄罗斯': ['莫斯科', '列宁格勒', '斯大林格勒', '索契', '西伯利亚'],
  '美国': ['华盛顿', '纽约', '波士顿', '洛杉矶', '阿拉斯加'],
  '日本': ['东京', '京都', '大阪', '冲绳', '奈良', '早稻田'],
  '韩国': ['北京', '上海', '广州', '深圳', '成都', '武汉', '杭州', '苏州', '重庆', '天津'],
  '新加坡': ['莫斯科', '列宁格勒', '斯大林格勒', '索契', '西伯利亚'],
  '马拉西亚': ['华盛顿', '纽约', '波士顿', '洛杉矶', '阿拉斯加'],
  '英国': ['东京', '京都', '大阪', '冲绳', '奈良', '早稻田'],
};
void main() => runApp(MyApp());
Utf8Decoder utf8decoder = Utf8Decoder();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> cities = [
    '北京',
    '上海',
    '广州',
    '深圳',
    '成都',
    '武汉',
    '杭州',
    '苏州',
    '重庆',
    '天津'
  ];

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _load();
      }
    });
    super.initState();

  }
  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(
            //  设置列表方向
            // scrollDirection: Axis.horizontal,
            controller: _scrollController,
            children: _buildNewList(),
          ),
        ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cities = cities.reversed.toList();
    });
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    COUNTRY.keys.forEach((key) {
      widgets.add(_item(key, COUNTRY[key]));
    });
    return widgets;
    // return COUNTRY.map((city) => _item(city)).toList();
  }

  List<Widget> _buildNewList() {
    return cities.map((city) => _itemCity(city)).toList();
  }

  Widget _buildSub(String subCity) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(color: Colors.lightBlue),
        child: Text(subCity),
      ),
    );
  }

  Widget _item(String country, List<String> subCities) {
    return ExpansionTile(
      title: Text(
        country,
        style: TextStyle(color: Colors.black54, fontSize: 20),
      ),
      children: subCities.map((subCity) => _buildSub(subCity)).toList(),
    );
  }

  Widget _itemCity(String city) {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.teal),
      margin: EdgeInsets.only(bottom: 5),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }

  void _load() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      List<String> list = List<String>.from(cities);
      list.addAll(cities);
      cities = list;
    });
  }
}
