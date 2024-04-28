import 'package:intl/intl.dart';

class TFormatter {

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String formatPhoneNumber(String phoneNumber) {
      return '(${phoneNumber.substring(0,3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
  }
}