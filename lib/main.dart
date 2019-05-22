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
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
   return  COUNTRY.keys.map((country) => _item(country)).toList();
    // return COUNTRY.map((city) => _item(city)).toList();
  }

  Widget _item(String country) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(country),
    );
  }
}
