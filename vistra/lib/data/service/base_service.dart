import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum RequestType { reqGet, reqPost }

class BaseService {
  final Dio dio = Dio();

  Future<Response> request({
    required String url,
    required RequestType type,
    Map<String, dynamic>? data,
    String? token,
    Map<String, String>? extraHeaders,
  }) async {
    final headers = <String, String>{
      'Accept': 'application/json',
      'x-api-version': '1.0.0',
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
      if (extraHeaders != null) ...extraHeaders,
    };

    final options = Options(headers: headers);

    debugPrint('📡 Request Type: $type');
    debugPrint('🌐 URL: $url');
    debugPrint('📦 Headers: $headers');
    if (data != null) debugPrint('📝 Body: $data');

    try {
      late final Response response;

      if (type == RequestType.reqGet) {
        response = await dio.get(url, options: options);
      } else {
        response = await dio.post(url, data: data, options: options);
      }

      debugPrint('✅ Response [${response.statusCode}]: ${response.data}');

      return response;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final errorData = e.response?.data;
      debugPrint('❌ DioException [$statusCode] $url');
      debugPrint('📥 Error response: $errorData');

      // Optional: throw with more structure
      throw DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        error: e.message,
        type: e.type,
      );
    } catch (e) {
      debugPrint('❌ Unexpected error in request: $e');
      throw Exception("Unexpected error");
    }
  }
}
