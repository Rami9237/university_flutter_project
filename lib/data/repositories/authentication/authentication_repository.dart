import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_project/features/authentication/screens/signup/verify_email.dart';
import 'package:mobile_project/features/studentDashboard/screens/categories_selection.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/studentDashboard/screens/navigation_menu_student.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => CategorySelectionScreen());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull("IsFirstTime", true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Get the currently signed-in user (assuming this is within a successful registration context)
      final user = FirebaseAuth.instance.currentUser;

      // Create an empty CategoriesSub array
      final List<String> categoriesSub = [];

      // Create a new document in the CategoriesSubscription collection with user ID and empty CategoriesSub
      await FirebaseFirestore.instance
          .collection('CategoriesSubscription')
          .doc(user!.uid)
          .set({
        'userID': user.uid,
        'CategoriesSub': categoriesSub,
      });

      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw 'something went wrong';
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      throw 'an error occured';
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'an error occured';
    }
  }
}
