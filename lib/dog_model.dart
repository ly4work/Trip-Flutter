import 'dart:convert';
import 'dart:io';

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;

  // All dogs start out at 10, because they're good dogs.
  int rating = 10;
  Dog(this.name, this.location, this.description);

  //  获取图片信息
  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = HttpClient();

    try {
      var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      imageUrl = json.decode(responseBody)['message'];
    }catch(exception) {
      print(exception);
    }
  }
}
