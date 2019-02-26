import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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



  

