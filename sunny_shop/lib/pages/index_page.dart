import 'package:flutter/material.dart'; // 谷歌风格
import 'package:flutter/cupertino.dart';// 类似iOS风格


class IndexPages extends StatefulWidget {
  final Widget child;

  IndexPages({Key key, this.child}) : super(key: key);

  _IndexPagesState createState() => _IndexPagesState();
}

class _IndexPagesState extends State<IndexPages> {
  // 底部4个tabbar
  final List<BottomNavigationBarItem> bottomTabs = [
     BottomNavigationBarItem(
       icon: Icon(CupertinoIcons.home),
       title: Text('首页')
     ),
     BottomNavigationBarItem(
       icon: Icon(CupertinoIcons.search),
       title: Text('分类')
     ),
     BottomNavigationBarItem(
       icon: Icon(CupertinoIcons.shopping_cart),
       title: Text('购物车')
     ),
     BottomNavigationBarItem(
       icon: Icon(CupertinoIcons.profile_circled),
       title: Text('个人中心')
     ), 
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
       child: widget.child,
    );
  }
}