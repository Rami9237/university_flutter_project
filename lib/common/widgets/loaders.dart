import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';

class TLoaders {
  static void warningSnackBar({required String title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: TColors.warning,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: TColors.white));
  }

  static void errorSnackBar({required String title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: TColors.error,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: TColors.white));
  }

  static void successSnackBar({required String title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: TColors.success,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.check, color: TColors.white));
  }
}
