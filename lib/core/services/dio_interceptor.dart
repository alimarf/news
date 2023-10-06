import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Diointerceptors extends Interceptor {
  final String token;
  Diointerceptors(this.token);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Authorization"] = "Bearer $token";
    super.onRequest(options, handler); //add this line
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('Error ${err.response?.statusCode}');
    debugPrint('Error ${err.response}');

    if (err.response?.statusCode == 401) {
      //TODO: REDIRECT USER TO SIGN IN PAGE
    }

    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(response.statusCode.toString());
    debugPrint(response.toString());
    // do something before response
    super.onResponse(response, handler);
  }
}
