class TValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required.";
    }

  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }

    return null;
  }

static String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  // Check for at least 8 characters
  if (value.length < 8) {
    return 'Password must contain at least 8 characters';
  }

  // Check for at least one lowercase letter
  if (!value.contains(RegExp(r'[a-z]'))) {
    return 'Password must contain at least one lowercase letter';
  }

  // Check for at least one uppercase letter
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one uppercase letter';
  }

  // Check for at least one number
  if (!value.contains(RegExp(r'[0-9]'))) {
    return 'Password must contain at least one number';
  }

  // Check for at least one special character
  if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return 'Password must contain at least one special character';
  }

  return null;
}

}