import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_project/common/widgets/loaders.dart';
import 'package:mobile_project/data/repositories/authentication/authentication_repository.dart';
import 'package:mobile_project/data/services/network_manager.dart';
import 'package:mobile_project/utils/popups/full_screen_loader.dart';

import '../../../../utils/constants/image_strings.dart';

class LoginController extends GetxController {
  //variables
  final email = TextEditingController();
  final password = TextEditingController();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL");
    password.text = localStorage.read("REMEMBER_ME_PASSWORD");
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in', TImages.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', email.text.trim());
      }

      final UserCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: 'Authentication Failed',
          message: 'something went wrong during authentication');
    }
  }
}
