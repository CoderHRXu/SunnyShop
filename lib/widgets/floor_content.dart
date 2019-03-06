import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloorTitleWidget extends StatelessWidget {
  final String picture_address; // 图片地址 

  FloorTitleWidget({Key key, this.picture_address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(picture_address),
    );
  }
}


class FloorContentWidget extends StatelessWidget {
  final List floorGoodsList;

  FloorContentWidget({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _firstRow(),
        _otherGoods(),
      ],
    );
  }

  Widget _firstRow (){
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(Map good){
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: (){
          print('点击了楼层商品');
        },
        child: Image.network(good['image']),
      ),
    );
  }
}