import 'package:flutter/material.dart';

class IndexPages extends StatelessWidget {
  final Widget child;

  IndexPages({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SunnyShop'),),
      body: Center(
        child: Text('阳光生活'),
      ),
    );
  }
}