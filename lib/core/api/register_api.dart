import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:hab_security_fornt/core/model/register_model.dart';

import '../utils/token_preference.dart';
import 'dio_client.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class RegisterApi {
  final Dio _dio = DioClient().getInstance();
  // final storage = new FlutterSecureStorage();
  Future<RegisterModel?> getRegisterData(
      String firstname,
      String lastname,
      String email,
      String password,
      String confirmationPassword,
      String role) async {
    RegisterModel? authData;

    log("$firstname,$lastname,$email,$password,$role");

    // try {
    Response response = await _dio.post(
      'auth/signup',
      data: ({
        "lastname": lastname,
        "fisrtname": firstname,
        "email": email,
        "password": password,
        "confirmationPassword": confirmationPassword,
        "role": role
      }),
      options: Options(headers: {
        "Content-Type": "application/json",
      })
    );

    // Map<String, dynamic> data = response.data;
    log("data---> , $response");
    Map<String, dynamic> data = response.data;
    authData = RegisterModel.fromJson(data);

    // var token = data["accessToken"].toString();
    // var id = data["result"]["_id"].toString();
    // log("---------->" + id);

    // if (token != null) {
    //   await TokenPreference.setToken(token);
    //   await TokenPreference.setUserId(id);
    // } else {
    //   await TokenPreference.setToken("");
    //   await TokenPreference.setUserId("");
    // }
    // } catch (e) {
    //   log("errer ====>  " + e.toString());
    // }

    return authData;
  }
}
