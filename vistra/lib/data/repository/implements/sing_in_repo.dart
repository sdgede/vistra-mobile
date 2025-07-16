import 'package:flutter/widgets.dart';
import 'package:vistra/data/models/auth_model.dart';
import 'package:vistra/data/remote/auth_api.dart';
import 'package:vistra/data/repository/interface/sing_in_int.dart';
import 'package:vistra/data/service/auth_service.dart';

class SignInRepo implements SignInInterface {
  final authApi = AuthApi();

  @override
  Future<AuthModel?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authApi.signIn(email: email, password: password);

      if (response != null && response.isSuccess()) {
        final rawData = response.data;

        if (rawData is Map<String, dynamic>) {
          final userData = rawData['user'];
          final token = rawData['token'] ?? '';

          if (userData == null || token.isEmpty) {
            debugPrint("⚠️ Data user atau token kosong di response");
            return null;
          }

          final authModel = AuthModel.fromJson({
            'userModel': userData,
            'loginResponse': {'user': userData, 'token': token},
            'metaModel': {
              'type': 'success', // hardcoded karena tidak ada di response
              'message': response.message,
            },
            'loginRequest': {'email': email, 'password': password},
          });

          await AuthService.instance.saveToken(token);
          debugPrint('✅ Token berhasil disimpan');

          return authModel;
        } else {
          debugPrint(
            '⚠️ Response.data bukan Map<String, dynamic>: ${response.data}',
          );
        }
      } else {
        debugPrint('❌ Gagal login: ${response?.message}');
      }

      return null;
    } catch (e) {
      debugPrint('🚨 Repo Login Error: $e');
      return null;
    }
  }
}
