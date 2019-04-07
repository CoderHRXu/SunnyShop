import 'package:flutter/material.dart';
import '../../model/category.dart';
import '../../service/service_methods.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 左侧大类导航
class LeftCategoryNav extends StatefulWidget {
  
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {

  List<CategoryListModel> modelList = [];

  @override
  void initState() {
    // TODO: implement initState
    _getCategoryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: ListView.builder(
        itemCount: modelList.length,
        itemBuilder: (context, index){
          return _leftInkwell(index);
        }
      ),
    );
  }

  // 网络请求
  void _getCategoryData () {
    getCategory().then((value){
      var data = json.decode(value.toString());
      var dataModel = CategoryModel.fromJson(data);
      print("商品分类页返回");
      print(dataModel.data);
      // 赋值
      setState(() {
          this.modelList = dataModel.data;
      });
    });
  }

  // 
  Widget _leftInkwell (int index) {
    return InkWell(
      onTap: (){
        print("_leftInkwell tap");
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10.0, top: 20.0),
        decoration: BoxDecoration(
          color:  Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12
            )
          )
        ),
        child: Text(
          modelList[index].mallCategoryName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28)
          ),
        ),
      ),
    );
  }

}