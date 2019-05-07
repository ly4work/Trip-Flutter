import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

void main() => runApp(MyApp());
Utf8Decoder utf8decoder = Utf8Decoder();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String showResult = '点了之后显示这个区域';

  Future<CommonModel> fetchPost() async {
    final response = await Http.get(
        'http://www.devio.org/io/flutter_app/json/test_common_model.json');
    final result = json.decode(utf8decoder.convert(response.bodyBytes));
    print(CommonModel.fromJson(result));
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('http'),
        ),
        body: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                fetchPost().then((CommonModel value) {
                  setState(() {
                    showResult =
                        '请求结果: \nhideAppBar: ${value.hideAppBar} \nicon: ${value.icon}  \ntitle: ${value.title} \nurl: ${value.url} \nstatusBarColor: ${value.statusBarColor}';
                  });
                });
              },
              child: Container(
                padding: EdgeInsets.all(30.0),
                child: Text('点我'),
              ),
            ),
            Text(showResult)
          ],
        ),
      ),
    );
  }
}

//  创建数据Model
class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});
  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }
}
