import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    getHttp();
    return Scaffold(
      body: Center(
        child: Text('商城首页'),
      ),
    );
  }

  void getHttp() async{
    var url = 'https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=大胸妹子';
    try {
      Response response;
      response =await Dio().get(url);
      print(response);
    } catch (e) {
      return print(e);
    }
  }


}