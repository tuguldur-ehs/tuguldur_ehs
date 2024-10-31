// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      message: json['message'] as String,
      userId: (json['userId'] as num).toInt(),
      email: json['email'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      role: json['role'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userId': instance.userId,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'role': instance.role,
      'statusCode': instance.statusCode,
    };
