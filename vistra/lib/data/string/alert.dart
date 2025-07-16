class AppAlertText {
  // Server-related errors
  static const String serverError = 'A server error has occurred';
  static const String serviceUnavailable =
      'The service is currently unavailable, please try again later';
  static const String badRequestError = 'Invalid request';
  static const String unauthorizedError =
      'You do not have permission to access this';

  // Network-related errors
  static const String networkError = 'A network error has occurred';
  static const String noInternet =
      'Unstable internet connection, please check your connection and try again';
  static const String timeoutError = 'Request timed out, please try again';
  static const String connectionError = 'Failed to connect to the server';

  // Authentication errors
  static const String sessionExpired = 'Session expired, please log in again';
  static const String loginFailed =
      'Login failed, please check your email and password';
  static const String invalidCredentials = 'Incorrect email or password';

  // Permission errors
  static const String forbiddenError = 'You are not allowed to view this page';
  static const String restrictedAccess = 'Access is restricted';

  // General errors
  static const String generalError = 'An error has occurred';
  static const String unexpectedError = 'An unexpected error has occurred';
  static const String tryAgain = 'Please try again';
  static const String notFoundError = 'Data not found';

  // Confirmation dialogs
  static const String logout = 'Are you sure you want to log out?';
  static const String deleteConfirmation =
      'Are you sure you want to delete this?';
  static const String discardChanges = 'Discard unsaved changes?';

  // Feature-related
  static const String featureDev = 'This feature is under development';
  static const String comingSoon = 'This feature is coming soon';
  static const String maintenanceMode =
      'The app is currently under maintenance';

  // Form validation
  static const String requiredField = 'This field is required';
  static const String invalidEmail = 'Invalid email address';
  static const String invalidPhone = 'Invalid phone number';
  static const String passwordMismatch = 'Passwords do not match';
  static const String weakPassword = 'Password is too weak';

  // Success messages
  static const String successSave = 'Data saved successfully';
  static const String successDelete = 'Data deleted successfully';
  static const String successUpdate = 'Data updated successfully';
  static const String successSubmit = 'Data submitted successfully';

  // Formatting method for dynamic values
  static String withValue(String message, dynamic value) {
    return '$message: $value';
  }

  // Formatting method for field-specific errors
  static String fieldError(String fieldName, String error) {
    return '$fieldName: $error';
  }
}
