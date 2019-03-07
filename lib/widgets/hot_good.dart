import 'package:flutter/material.dart';
import '../service/service_methods.dart';

class HootGoods extends StatefulWidget {

  HootGoods({Key key,}) : super(key: key);

  _HootGoodsState createState() => _HootGoodsState();
}

class _HootGoodsState extends State<HootGoods> {

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    request('homePageBelowContent', 1).then((value){
      print('homePageBelowContent call back');
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('xhr'),
    );
  }
}