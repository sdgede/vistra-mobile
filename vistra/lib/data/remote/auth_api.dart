import 'package:flutter/widgets.dart';
import 'package:vistra/config/enpoint.dart';
import 'package:vistra/data/models/common_response_model.dart';
import 'package:vistra/data/service/auth_service.dart';
import 'package:vistra/data/service/base_service.dart';

class AuthApi extends BaseService {
  Future<CommonResponseModel?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final data = {'email': email, 'password': password};

      debugPrint('📦 Body: $data');

      final result = await request(
        url: Enpoint.login,
        type: RequestType.reqPost,
        data: data,
        extraHeaders: null,
      );

      if (result.statusCode == 201) {
        final Map<String, dynamic> responseData =
            result.data as Map<String, dynamic>;
        final token = responseData['token'];

        await AuthService.instance.saveToken(token);
      } else {
        debugPrint("⚠️ Gagal login. Status code: ${result.statusMessage}");
      }

      return null;
    } catch (e, stacktrace) {
      debugPrint('🚨 Error loginPassword: $e');
      debugPrint('📛 Stacktrace: $stacktrace');
      return null;
    }
  }
}
