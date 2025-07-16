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
        if (response.data is Map<String, dynamic>) {
          final data = response.data as Map<String, dynamic>;
          final authModel = AuthModel.fromJson(data);

          final token = authModel.loginResponse.token;
          if (token.isNotEmpty) {
            await AuthService.instance.saveToken(token);
            debugPrint('✅ Token berhasil disimpan');
          } else {
            debugPrint('⚠️ Token kosong');
          }

          return authModel;
        } else {
          debugPrint(
            '⚠️ Response data bukan Map<String, dynamic>: ${response.data}',
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
