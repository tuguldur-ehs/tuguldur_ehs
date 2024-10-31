// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'register_model.g.dart';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

@JsonSerializable()
class RegisterModel {
  String message;
  int userId;
  String email;
  String firstname;
  String lastname;
  String role;
  int statusCode;

  RegisterModel({
    required this.message,
    required this.userId,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.role,
    required this.statusCode,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        message: json["message"],
        userId: json["userId"],
        email: json["email"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        role: json["role"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "userId": userId,
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "role": role,
        "statusCode": statusCode,
      };
}
