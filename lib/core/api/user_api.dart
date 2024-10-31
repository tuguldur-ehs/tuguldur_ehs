// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:hab_security_fornt/core/model/login_model.dart';
// import '../utils/token_preference.dart';
// import 'dio_client.dart';

// class UserApi {
//   final Dio _dio = DioClient().getInstance();

//   Future<LoginModel> getUserData(String email, String password) async {
//     LoginModel? authData;

//     Response response = await _dio.post(
//       'auth/signin',
//       data: ({
//         "email": email,
//         "password": password,
//       }),
//     );

//     Map<String, dynamic> data = response.data;

//     var token = data["accessToken"];
//     var id = data["userId"];

//     if (token == null || id == null || !(token is String)) {
//       throw new NotNullableError("Token Not Found");
//     }

//     await TokenPreference.setToken(token);

//     await TokenPreference.setUserId(id.toString());
//     authData = LoginModel.fromJson(data);

//     return authData;
//   }
// }
