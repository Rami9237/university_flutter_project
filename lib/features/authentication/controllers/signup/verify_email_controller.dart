import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mobile_project/common/widgets/success_screen.dart';

import '../../../../common/widgets/loaders.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please check your inbox and verify your email');
    } catch (e) {
      TLoaders.errorSnackBar(title: ' error', message: e.toString());
    }
  }

  // Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
              image: TImages.accountCreated,
              title: TTexts.accountCreated,
              subTitle: TTexts.accountCreatedParagraph,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect()),
        );
      }
    });
  }

  // manually check if email is verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: TImages.accountCreated,
          title: TTexts.accountCreated,
          subTitle: TTexts.accountCreatedParagraph,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
