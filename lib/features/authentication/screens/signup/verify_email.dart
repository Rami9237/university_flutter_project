import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/common/widgets/success_screen.dart';
import 'package:mobile_project/data/repositories/authentication/authentication_repository.dart';
import 'package:mobile_project/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:mobile_project/utils/constants/image_strings.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false, actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ]),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(children: [
                  Image(
                    image: AssetImage(TImages.email),
                    width: THelperFunctions.getScreenWidth() * 0.6,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Text(
                    TTexts.verifyYourEmail,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Text(
                    email ?? '',
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Text(
                    TTexts.verifyParagraph,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () =>
                              controller.checkEmailVerificationStatus(),
                          child: const Text(TTexts.tContinue))),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () => controller.sendEmailVerification(),
                          child: const Text(TTexts.resendEmail))),
                ]))));
  }
}
