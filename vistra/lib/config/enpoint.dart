import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enpoint {
  static final baseUrl = dotenv.env['BASE_URL'] ?? '';

  // Auth
  static String register = '$baseUrl/register';
  static String verification = '$baseUrl/send-verification-email';
  static String login = '$baseUrl/login';
}
