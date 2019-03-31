import 'package:flutter/material.dart';
import '../service/service_methods.dart';
import 'dart:convert';


class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    _getCategoryData();
    return Center(
      child: Text('分类页面stf'),
    );
  }
}

void _getCategoryData () {
  getCategory().then((value){
    var data = json.decode(value.toString());
    print(data);
  });
}