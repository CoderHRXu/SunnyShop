import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'package:provide/provide.dart';
import 'provide/counter.dart';


// void main()=>runApp(MyApp());
// 改造main函数
void main() {
  var counter = Counter();
  var providers = Providers();
  providers
  ..provide(Provider<Counter>.value(counter));

  runApp(ProviderNode(child: MyApp(), providers: providers,));
}


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