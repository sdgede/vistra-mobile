import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  /// Membuat header standar untuk request API
  static Options header({
    String token = '',
    Map<String, String>? extraHeaders,
    bool isJson = true,
  }) {
    final Map<String, String> baseHeaders = {
      'Accept': 'application/json',
      'x-api-version': '1.0.0',
      if (isJson) 'Content-Type': 'application/json; charset=utf-8',
      if (token.isNotEmpty) 'Authorization': 'Bearer $token',
    };

    // Gabungkan dengan custom headers (jika ada)
    if (extraHeaders != null && extraHeaders.isNotEmpty) {
      baseHeaders.addAll(extraHeaders);
    }

    return Options(headers: baseHeaders);
  }
}
