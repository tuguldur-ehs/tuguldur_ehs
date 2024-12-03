import '../../services/base_response.dart';

class LoginResponse extends ResponseBase {
  final String? accessToken;
  final String? refreshToken;
  final String? email;
  final int? userId;
  final String? username;

  LoginResponse({
    String? message,
    this.accessToken,
    this.refreshToken,
    this.email,
    this.userId,
    this.username,
  }) : super(
    message: message,
  );

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      email: json['email'] as String?,
      userId: json['userId'] as int?,
      username: json['username'] as String?,
    );
  }
}
