import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hab_security_fornt/core/utils/navigation_service.dart';
import 'package:hab_security_fornt/pages/auth/login.dart';

import '../utils/constants.dart';
import '../utils/token_preference.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseURL,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
    ),
  )..interceptors.add(CustomInterceptors());

  Dio getInstance() {
    return _dio;
  }
}

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Here you can add the Authorization header if needed
    String? token = await TokenPreference.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 403) {
      await TokenPreference.setToken("");
      // Navigate to LoginPage using NavigationService
      if (NavigationService.navigatorKey.currentContext != null) {
        Navigator.pushReplacement(
          NavigationService.navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    }

    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
        error: err);
    log('ERROR[${err.response?.statusMessage}] => PATH: ${err.requestOptions.path}',
        error: err);
    log('ERROR[${err.response?.data}] => PATH: ${err.requestOptions.path}',
        error: err);

    return super.onError(err, handler);
  }
}
