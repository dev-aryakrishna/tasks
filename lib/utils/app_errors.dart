class AppErrors {
  static const String invalidCredentials  = 'AUTH_001';
  static const String signupFailed        = 'AUTH_002';
  static const String emailAlreadyInUse   = 'AUTH_003';
  static const String logoutFailed        = 'AUTH_004';

  static const String emailRequired           = 'VAL_001';
  static const String invalidEmail            = 'VAL_002';
  static const String nameRequired            = 'VAL_003';
  static const String invalidName             = 'VAL_004';
  static const String phoneRequired           = 'VAL_005';
  static const String invalidPhone            = 'VAL_006';
  static const String passwordRequired        = 'VAL_007';
  static const String passwordTooShort        = 'VAL_008';
  static const String confirmPasswordRequired = 'VAL_009';
  static const String passwordMismatch        = 'VAL_010';
  static const String titleRequired           = 'VAL_011';
  static const String descriptionRequired     = 'VAL_012';

  static const Map<String, String> _messages = {
    'AUTH_001': 'Invalid email or password.',
    'AUTH_002': 'Signup failed. Please try again.',
    'AUTH_003': 'This email is already registered.',
    'AUTH_004': 'Logout failed. Please try again.',
    'VAL_001': 'Email is required.',
    'VAL_002': 'Please enter a valid email.',
    'VAL_003': 'Name is required.',
    'VAL_004': 'Name should contain only letters.',
    'VAL_005': 'Phone number is required.',
    'VAL_006': 'Phone number must be exactly 10 digits.',
    'VAL_007': 'Password is required.',
    'VAL_008': 'Password must be at least 6 characters.',
    'VAL_009': 'Please confirm your password.',
    'VAL_010': 'Passwords do not match.',
    'VAL_011': 'Please enter a title.',
    'VAL_012': 'Please enter a description.',
  };

  static String getMessage(String code) {
    return _messages[code] ?? 'Something went wrong. [$code]';
  }
}
