var t;
final t = 'hello world';

main() {
  String say(String from, String msg, [String device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
  }

  say('Hello', 'World', 'HeiHei!!!');
  void enableFlags({bool bold, bool hidden}) {}
  enableFlags(bold: true, hidden: false);

  Future.delayed(new Duration(seconds: 2), () {
    throw AssertionError('Error');
    return 'hi wolrd';
  }).then((data) {
    print(data);
  }, onError: (e) {
    print(e);
  }).catchError((e) {
    print(e);
  }).whenComplete(() {
    print('compelete');
  });

  Future.wait([
    Future.delayed(new Duration(seconds: 2), () {
      return 'hellow';
    }),
    Future.delayed(new Duration(seconds: 3), () {
      return 'wolrd';
    })
  ]).then((results) {
    print(results[0] + results[1]);
  });

  // callback hell
  Future<String> login(String userName, String pwd) {
    //  用户登录
    String id = '11232';
    // return id;
  }

  Future<String> getUserInfo(String id) {
    //  获取用户信息
  }

  Future saveUserInfo(String userInfo) {
    //  保存用户信息
  }

  login('nardo', '*******').then((id) {
    getUserInfo(id).then((userInfo) {
      saveUserInfo(userInfo).then((res) {});
    });
  });

  task() async {
    try {
      String id = await login('nardo', '***');
      String userInfo = await getUserInfo(id);
      await saveUserInfo((userInfo));
    } catch (e) {
      print(e);
    }
  }


  //  stream
  Stream.fromFutures([
    //  1s after
    Future.delayed(new Duration(seconds: 1), () {
      return 'hellow 1';
    }),
    //  2s after
    Future.delayed(new Duration(seconds: 2), () {
      throw AssertionError('error 1');
    }),
    //  3s after
    Future.delayed(new Duration(seconds: 3), () {
      return 'hellow 3';
    })
  ]).listen((data) {
    print(data);
  }, onError: (e) {
    print(e.message);
  }, onDone: (){
    
  });
}

enum Status { OK, FAIL }
