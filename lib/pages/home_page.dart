import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;
//  首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _appBarAlpha = 0;
  List<Map> _bannerList = [
    {
      "icon":
          "http://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg",
      "url":
          "https://gs.ctrip.com/html5/you/travels/1422/3771516.html?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
    },
    {
      "icon":
          "https://dimg04.c-ctrip.com/images/300h0u000000j05rnD96B_C_500_280.jpg",
      "url":
          "https://m.ctrip.com/webapp/vacations/tour/detail?productid=3168213&departcityid=2&salecityid=2&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
    },
    {
      "icon": "http://pages.ctrip.com/hotel/201811/jdsc_640es_tab1.jpg",
      "url":
          "https://m.ctrip.com/events/jiudianshangchenghuodong.html?disable_webview_cache_key=1"
    },
    {
      "icon":
          "https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg",
      "url":
          "https://m.ctrip.com/webapp/vacations/tour/detail?productid=53720&departcityid=2&salecityid=2&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  使用Stack来自定义appBar，而不是使用默认的appBar
      body: Stack(
        children: <Widget>[
          // MediaQuery组件可以手动移除flutter开发团队为内置类设置的默认参数如padding, margin
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Center(
              //  NotificationListener 用来监听页面滚动
              child: NotificationListener(
                onNotification: (scrollNotification) {
                  //  性能优化，避免滚动为0时导致频繁触发，同时只监听最外层的整个ListView
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                //  可滑动的页面需要使用listview列表
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 160.0,
                      child: Swiper(
                        itemCount: _bannerList.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            _bannerList[index]["icon"],
                            fit: BoxFit.cover,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Container(
                      height: 2000.0,
                      child: ListTile(
                        title: Text('首页的轮播内容'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //  自定义的动态  透明度的appBar
          Opacity(
            opacity: _appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text('首页'),
                )
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onScroll(double offset) {
    // print(pixels);
    //  动态设置 _appBarAlpha
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if(alpha < 0) {
      alpha = 0;
    }else if(alpha > 1) {
      alpha = 1;
    }
    setState((){
      _appBarAlpha = alpha;
    });
  }
}
