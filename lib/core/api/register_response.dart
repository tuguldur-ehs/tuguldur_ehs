import '../../services/base_response.dart';

class RegisterResponse extends ResponseBase {
  RegisterResponse({
    String? message,
    num? userId,
    String? email,
    String? firstname,
    String? lastname,
    String? role,
    num? statusCode,
  }) : super(
          message: message,
          statusCode: statusCode,
        );

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'] as String?,
      userId: json['userId'] as num?,
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      role: json['role'] as String?,
      statusCode: json['statusCode'] as num?,
    );
  }
}
