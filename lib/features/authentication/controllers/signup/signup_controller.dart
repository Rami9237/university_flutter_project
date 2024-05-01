import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_project/common/widgets/loaders.dart';
import 'package:mobile_project/data/repositories/authentication/authentication_repository.dart';
import 'package:mobile_project/data/repositories/user/user_repository.dart';
import 'package:mobile_project/features/authentication/screens/signup/verify_email.dart';
import 'package:mobile_project/utils/popups/full_screen_loader.dart';

import '../../../../data/services/network_manager.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final policyCheck = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final userRepository = Get.put(UserRepository());

  void signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          "We are processing your information", TImages.loading);
      // check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }
      // form validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      if (!policyCheck.value) {
        TLoaders.warningSnackBar(
            title: 'Accept terms of use',
            message:
                'In order to create an account you need to approve the terms of use');
        return;
      }

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      userRepository.saveUserRecord(newUser);
      // Stop loading dialog
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: 'Congrats!',
          message:
              'Your account has been created successfully! Verify your email to continue');
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      // Stop loading dialog in case of error
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error!', message: e.toString());
    }
  }
}
