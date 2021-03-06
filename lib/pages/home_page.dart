import 'package:flutter/material.dart';
import '../service/service_methods.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// 自定义view
import '../widgets/swiper_diy.dart';
import '../widgets/top_navigator.dart';
import '../widgets/ad_banner.dart';
import '../widgets/leader_phone.dart';
import '../widgets/recommend.dart';
import '../widgets/floor_content.dart';
import '../widgets/hot_good.dart';

// model
import '../model/model_homepage.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  int pageNo = 1;
  List<Map> hotGoodsList = [];
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();
  @override
  bool get wantKeepAlive => true;

  String homePageContent = '正在获取数据';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var formData = {'lon' : '115.02932', 'lat':'35.76189'};

    return Scaffold(
      appBar: AppBar(title: Text('百姓生活+'),),
      body: FutureBuilder(
        future: getHomePageContent(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            var data                = json.decode(snapshot.data.toString());
            List<Map> swiper        = (data['data']['slides'] as List).cast();
            List<Map> navigatorList = (data['data']['category'] as List).cast();
            String adUrl            =data['data']['advertesPicture']['PICTURE_ADDRESS'];
            String leaderImage      =data['data']['shopInfo']['leaderImage'];
            String leaderPhone      =data['data']['shopInfo']['leaderPhone'];
            List<Map> recommendList =(data['data']['recommend'] as List).cast();
            String floor1Title      = data['data']['floor1Pic']['PICTURE_ADDRESS'];
            String floor2Title      = data['data']['floor2Pic']['PICTURE_ADDRESS'];
            String floor3Title      = data['data']['floor3Pic']['PICTURE_ADDRESS'];
            List<Map> floor1        =(data['data']['floor1'] as List).cast();
            List<Map> floor2        =(data['data']['floor2'] as List).cast();
            List<Map> floor3        =(data['data']['floor3'] as List).cast();
            // var homeData            = HomePageDataModel.fromJson(data);

            ListView listView = ListView(
              children: <Widget>[
                SwiperDiy(swiperDataList: swiper,),
                  TopNavigator(navigatorList: navigatorList),
                  AdBanner(adUrl: adUrl,),
                  LeaderPhone(leaderImage: leaderImage, leaderPhone: leaderPhone,),
                  Recommend(recommendList: recommendList,),
                  FloorTitleWidget(picture_address: floor1Title,),
                  FloorContentWidget(floorGoodsList: floor1,),
                  FloorTitleWidget(picture_address: floor2Title,),
                  FloorContentWidget(floorGoodsList: floor2,),
                  FloorTitleWidget(picture_address: floor3Title,),
                  FloorContentWidget(floorGoodsList: floor3,),
                  // HootGoods()
                  _hotGoods()
              ],
            );
            
            return EasyRefresh(
              refreshFooter: ClassicsFooter(
                key: _footerKey,
                bgColor: Colors.white,
                textColor: Colors.pink,
                moreInfoColor: Colors.pink,
                showMore: true,
                noMoreText: "没有更多数据了",
                loadingText: "正在加载...",
                loadReadyText: "即将开始加载更多",
                loadText: "上拉加载更多"
                
              ),
              loadMore: loadMoreHotGoods,
              child: listView,
            );
            
             
          }else{
              return Center(child: Text('正在加载'));
          }
        },
      )

    );
  }

  /**
   * 获取火爆专区商品数据
   */
  Future loadMoreHotGoods() async {
    print("start load more hot goods");
    pageNo++;
    await getHomePageBelowContent(pageNo).then((value){
        var data =json.decode(value.toString());
        List<Map> newsGoods = (data['data'] as List).cast();
        print(newsGoods.length);
        setState(() {
          hotGoodsList.addAll(newsGoods);
        });
    });
  }

  Widget hotTitle =Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(width: 0.5, color: Colors.black)
      )
    ),    
    child: Text('火爆专区'),
  );
  
  // 火爆专区子项
  Widget _warpList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget =hotGoodsList.map((value){
          return InkWell(
            onTap: (){

            },
            child:Container(
              width: ScreenUtil().setWidth(372),
              color: Colors.white,
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(bottom: 3.0), 
              child: Column(
                children: <Widget>[
                  Image.network(value['image'], width:ScreenUtil().setWidth(375)),
                  Text(
                    value['name'],
                    maxLines:1,
                    overflow:TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                  ),
                  Row(
                    children: <Widget>[
                      Text("¥${value['mallPrice']}"),
                      Text(
                        "¥${value['price']}",
                        style: TextStyle(color: Colors.black26, decoration: TextDecoration.lineThrough),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
      }).toList();

      return Wrap(
        spacing: 2, // 2列
        children: listWidget,
      );

    } else {
      // 火爆专区没数据
      return Text("无数据");
    }
  }

  Widget _hotGoods() {
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _warpList(),
        ],
      ),
    );
  }

}






/*
class HomePage extends StatefulWidget {
  final Widget child;
  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String showText = '还没有请求数据';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('请求远程数据'),),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('请求数据'),
                onPressed: _geek
              ),

              Text(showText),
            ],
          ),
      ),
    );
  }

  void _geek(){
    print('开始向极客时间请求数据.....');
    getHttp().then((data){
      setState(() {
        showText =data['data'].toString();
      });
    });
  }

  Future getHttp() async {
    try {
      var url = 'https://time.geekbang.org/serv/v1/column/newAll';
      Response response;
      Dio  dio =Dio();
      dio.options.headers =httpHeaders;
      response = await dio.get(url);
      print(response);
      return response.data;

    } catch (e) {
      return print(e);
    }
  }
}
*/

/*
class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController typeController =TextEditingController();
  String showText = '欢迎来到美好人间';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Scaffold(
            appBar: AppBar(title: Text('美好人间'),),
            body: SingleChildScrollView(
              child: Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: typeController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: '妹子类型',
                      helperText: '请输入你喜欢的类型', // 下方的提示图片
                    ),
                    autofocus: false, // 不获取焦点，不呼出键盘

                  ),

                  RaisedButton(
                    child: Text('选择完毕'),
                    onPressed: _chooseAction,
                  ),
                  Text(
                    showText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )

                ],
              ),
            ),
          ),
      ),
            )
            
            
            
    );
  }


  void _chooseAction(){
    print('开始选择你喜欢的类型..........');
    // 判断文本框为空
    var searchText =  typeController.text.toString();
    if (searchText =='') {
      showDialog(
        context: context,
        builder: (context)=> AlertDialog(title: Text('美女类型不能为空'),)
      );

    }else{
      getHttp(searchText).then((value){
        setState((){

          showText = value['data']['name'];

        });
      });
    }
  }

  Future getHttp(String typeName) async{
    var url = 'https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian';
    try {
      Response response;
      var data = {'name' : typeName};
      response =await Dio().get(url, queryParameters :data);
      return response.data;

    } catch (e) {
      return print(e);
    }
  }

  Future postHttp(String typeName) async{

    var url = 'https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/post_dabaojian';
    try {
      Response response;
      var data = {'name' :typeName};
      response =await Dio().post(url, queryParameters:data);
      return response;
    } catch (e) {
    }
  }
}
*/


  

