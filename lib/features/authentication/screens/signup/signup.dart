import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_project/features/authentication/screens/login/widgets/login_divider.dart';
import 'package:mobile_project/features/authentication/screens/login/widgets/login_google_button.dart';
import 'package:mobile_project/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TTexts.signUp,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const SignUpForm(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  LoginDivider(dividerText: TTexts.orSignUpWith.capitalize!),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const GoogleButton()
                ],
              )),
        ));
  }
}
