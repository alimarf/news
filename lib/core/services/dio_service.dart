import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'dio_interceptor.dart';

class DioService {
  static Dio? dioSpaceId;
  static Dio? dio;

  static void initialDio(String baseUrl) async {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(minutes: 3),
        receiveTimeout: const Duration(minutes: 3),
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
  }

  static void setDioLogger(String baseUrl) async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // String? token = pref.getString(Preferences.JWT_TOKEN);
    dio!.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, responseInterceptorHandler) {
          debugPrint('${response.statusCode} - ${response.data.toString()}\n');
          if (response.statusCode == 401) {
            // Get.offAll(() => const SignInPage());
          }
          return responseInterceptorHandler.next(response);
        },
        onRequest: (request, requestInterceptorHandler) {
          debugPrint('${request.method} - ${request.path} - ${request.data}');
          //TODO: SET TOKEN
          // request.headers
          //     .addAll({HttpHeaders.authorizationHeader: 'Bearer $token'});
          return requestInterceptorHandler.next(request);
        },
        onError: (DioException error, errorInterceptor) {
          debugPrint(error.message);
          return errorInterceptor.next(error);
        },
      ),
    );
  }

  static setDioHeader(String? token) {
    dio!.options.headers = {HttpHeaders.authorizationHeader: 'Bearer $token'};
    print('token user: $token');
  }

  static setDioInterceptor(String? token) {
    dio!.interceptors.add(Diointerceptors("$token"));
    print('token user: $token');
  }
}
