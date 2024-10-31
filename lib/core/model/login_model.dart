// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

@JsonSerializable()
class LoginModel {
  String accessToken;
  String refreshToken;
  String email;
  String role;
  int userId;

  LoginModel({
    required this.accessToken,
    required this.refreshToken,
    required this.email,
    required this.role,
    required this.userId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        email: json["email"],
        role: json["role"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "email": email,
        "role": role,
        "userId": userId,
      };
}
