import 'package:flutter/material.dart'; // 谷歌风格
import 'package:flutter/cupertino.dart';// 类似iOS风格
// pages
import 'profile_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'home_page.dart';



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

  // 4个根页面
  final List tabPages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    ProfilePage(),
  ];
  // 当前选中索引
  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    // TODO: implement initState
    currentPage =tabPages[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        // 点击tab 切换效果
        type: BottomNavigationBarType.fixed,  // 少于3个看不出效果
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex =index;
            currentPage =tabPages[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}