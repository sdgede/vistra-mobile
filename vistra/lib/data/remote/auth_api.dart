import 'package:flutter/widgets.dart';
import 'package:vistra/data/models/common_response_model.dart';
import 'package:vistra/data/service/base_service.dart';
import 'package:vistra/res/constants/enpoints.dart';

class AuthApi extends BaseService {
  Future<CommonResponseModel?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final data = {'email': email, 'password': password};
      debugPrint('📦 Body: $data');

      final result = await request(
        url: APpEnpoints.urllogin,
        type: RequestType.reqPost,
        data: data,
        extraHeaders: null,
      );

      final statusCode = result.statusCode ?? 201;

      if (result.data is Map<String, dynamic>) {
        final json = result.data as Map<String, dynamic>;
        final commonResponse = CommonResponseModel.fromJson(statusCode, json);

        debugPrint("🎯 Parsed CommonResponse: ${commonResponse.message}");

        return commonResponse;
      } else {
        debugPrint(
          "❌ Response data bukan Map<String, dynamic>: ${result.data}",
        );
      }

      return null;
    } catch (e, stacktrace) {
      debugPrint('🚨 Error loginPassword: $e');
      debugPrint('📛 Stacktrace: $stacktrace');
      return null;
    }
  }
}
