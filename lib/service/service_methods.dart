import 'package:dio/dio.dart';
import 'package:async/async.dart';
import 'dart:io';
import '../config//service_url.dart';

// 通用接口
Future request(url, formData) async {
  try {
    print('开始获取数据....');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =ContentType.parse("application/x-www-form-urlencoded"); // 表单
    if (formData ==null) {
      response =await dio.post(servicePath[url]);
    }else{
      response =await dio.post(servicePath[url], data: formData);
    }
    
    if (response.statusCode == 200) {
      return response.data;
    }else{
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('ERROR: =============> $e');
  }
}

// 获取首页主体内容
Future getHomePageContent() async {
  try {
    print('开始获取首页数据....');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =ContentType.parse("application/x-www-form-urlencoded"); // 表单
    var formData = {'lon' : '115.02932', 'lat':'35.76189'};
    response =await dio.post(servicePath['homePageContent'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    }else{
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('ERROR: =============> $e');
  }
  
}


// 获火爆专区商品
Future getHomePageBelowContent() async {
  try {
    print('开始获取爆专区商品数据....');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =ContentType.parse("application/x-www-form-urlencoded"); // 表单
    int page = 1;
    response =await dio.post(servicePath['homePageBelowContent'], data: page);
    if (response.statusCode == 200) {
      return response.data;
    }else{
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('ERROR: =============> $e');
  }
  
}