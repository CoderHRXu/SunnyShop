import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

class CartPage extends StatelessWidget {
  final Widget child;

  CartPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: <Widget>[
            Number(),
            MyButton()
          ],
        )
      ),
    );
  }

}


class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: Provide<Counter>(
        builder: (context, child, counter){
          return Text(
            '${counter.value}', 
            style:Theme.of(context).textTheme.display1,
            );
        },
      ),
    );
  }
}

class MyButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          // 直接编写按钮的单击事件，并调用provide里的方法，代码修改如下。
          Provide.value<Counter>(context).increment();
        },
        child: Text('递增按钮'),
      )
    );
  }
}