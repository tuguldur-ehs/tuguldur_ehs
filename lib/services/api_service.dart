import 'package:dio/dio.dart' as dio;

class ApiService {
  final _dio = dio.Dio(dio.BaseOptions(
      baseUrl: "http://172.16.151.226:3000",
      // baseUrl: "http://192.168.1.157:1024/api",
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      validateStatus: (status) {
        if (status == null) return false;
        return true;
      }));

  Future<dio.Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
      await _dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } on dio.DioException catch (e) {
      throw Exception("GET request failed: ${e.message}");
    }
  }

  Future<dio.Response> post(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on dio.DioException catch (e) {
      throw Exception("Post Request failed: ${e}");
    }
  }

  Future<dio.Response> put(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } on dio.DioException catch (e) {
      throw Exception("Put request failed: ${e.message}");
    }
  }

  Future<dio.Response> delete(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.delete(endpoint, data: data);
      return response;
    } on dio.DioException catch (e) {
      throw Exception("Delete request failed: ${e.message}");
    }
  }
}
