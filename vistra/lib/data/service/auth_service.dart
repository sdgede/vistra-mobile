import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();

  factory AuthService() => instance;

  AuthService._internal();

  static const _tokenKey = 'token';

  SharedPreferences? _prefs;

  Future<void> init() async {
    // _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> setSession({required String token, String? name}) async {
    await saveToken(token);
    if (name != null && name.isNotEmpty) {
      await saveName(name);
    }
  }

  Future<void> _savePref(String k, Object v) async =>
      (await SharedPreferences.getInstance()).setString(k, v.toString());

  Future<void> saveToken(String token) async {
    _prefs ??= await SharedPreferences.getInstance(); // fallback
    await _prefs!.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    if (_prefs == null) throw NotInitializedError();
    return _prefs!.getString(_tokenKey);
  }

  Future<void> clearToken() async {
    if (_prefs == null) throw NotInitializedError();
    await _prefs!.remove(_tokenKey);
  }

  Future<void> saveName(String name) => _savePref('name', name);
}
