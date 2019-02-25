import 'package:flutter/material.dart';
import 'pages/index_page.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  final Widget child;

  MyApp({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'sunnyshop',
        debugShowCheckedModeBanner: false, // 不显示debug图标
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: IndexPages(),

      ),
    );
  }
}