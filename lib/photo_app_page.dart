import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// 拍照和相册功能
class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  File _image;

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
        child: _image == null ? Text('No image selected') : Image.file(_image),
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

  Future _getImage(bool isTakePhoto) async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  _item(String name, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
          leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
          title: Text(name),
          onTap: () => _getImage(isTakePhoto))
    );
  }
}
