import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// 拍照和相册功能
class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  List<File> _images = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Resource'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: _genImages(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: '选择图片',
        child: Icon(Icons.add_a_photo),
      ),
    ));
  }

  void _pickImage() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 120.0,
              child: Column(
                children: <Widget>[_item('拍照', true), _item('相册', false)],
              ),
            ));
  }

  //  获取相机或相册图片
  Future _getImage(bool isTakePhoto) async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _images.add(image);
    });
  }

  //  底部弹出框
  _item(String name, bool isTakePhoto) {
    return GestureDetector(
        child: ListTile(
            leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
            title: Text(name),
            onTap: () => _getImage(isTakePhoto)));
  }

  //  渲染图片列表
  _genImages() {
    return _images.map((file) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.file(
              file,
              width: 120.0,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 5.0,
            top: 5.0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _images.remove(file);
                });
              },
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(color: Colors.black54),
                  child: Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }).toList();
  }
}
