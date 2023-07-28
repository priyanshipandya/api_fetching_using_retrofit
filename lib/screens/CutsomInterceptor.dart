import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'get_page.dart';

class CustomInterceptor extends Interceptor{
  CustomInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("BaseUrl - ${options.baseUrl}");
    final context  = globalKeyScaffold.currentState?.context;
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text("BaseUrl - ${options.headers}")));
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("Error Message - ${err.message}");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("OnResponse - ${response.statusCode}");
    final context = globalKeyScaffold.currentState?.context;
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text("Status Code: ${response.statusCode}")));
    handler.next(response);
  }
}