import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// 首页轮播控件
class SwiperDiy extends StatelessWidget {
  
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 初始化
    print('设备像素密度：${ScreenUtil.pixelRatio}');
    print('设备像素高度：${ScreenUtil.screenHeight}');
    print('设备像素宽度：${ScreenUtil.screenWidth}');

    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      // width: ,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.network("${swiperDataList[index]['image']}",fit: BoxFit.fill,);
        },
        itemCount: swiperDataList.length,
        // 点点点 导航器
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}