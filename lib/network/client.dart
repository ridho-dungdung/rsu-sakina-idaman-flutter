import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient{
  final Dio dio = Dio(
    BaseOptions(
      // baseUrl: 'http://10.0.2.2:8000/api',
      baseUrl: 'http://192.168.1.9:8001/api',
    )
  )..interceptors.add(LogInterceptor(
  logPrint: (o) => debugPrint(o.toString()),
  ));

  // Options options = Options(
  //   contentType: 'application/json',
  //   headers: {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Accept': "*/*",
  //     'connection': 'keep-alive',
  //     'Accept-Encoding' : 'gzip, deflate, br',
  //   }
  // );

  Future get(
      String uri, ) async {
    try{
      final response = await dio.get(
        uri,
        // options: options,
      );
      // print('DIO COG $response');
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future post(
      String uri, {
        dynamic data,
        Map<String, dynamic>? params,
        Options? options,
      }) async {
    try{
      final response = await dio.post(
        uri,
        data: data,
        queryParameters: params,
        options: options,
      );
      return response.data;
    } catch(err) {
      return {'success': false};
    }
  }
}