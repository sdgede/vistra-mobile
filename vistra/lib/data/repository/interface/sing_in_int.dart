import 'package:vistra/data/models/auth_model.dart';

abstract class SignInInterface {
  Future<AuthModel?> signIn({required String email, required String password});
}
