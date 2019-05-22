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
        body: ListView(
          //  设置列表方向
          // scrollDirection: Axis.horizontal,
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    COUNTRY.keys.forEach((key) {
      widgets.add(_item(key, COUNTRY[key]));
    });
    return widgets;
    // return COUNTRY.map((city) => _item(city)).toList();
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
}
