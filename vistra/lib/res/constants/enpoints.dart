import 'package:flutter_dotenv/flutter_dotenv.dart';

class APpEnpoints {
  static final baseUrl = dotenv.env['BASE_URL'] ?? '';

  // Auth
  static String urlRegiter = '$baseUrl/register';
  static String urlVerification = '$baseUrl/send-verification-email';
  static String urllogin = '$baseUrl/login';
}
