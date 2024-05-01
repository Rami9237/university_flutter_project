import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/common/styles/spacing_styles.dart';
import 'package:mobile_project/features/authentication/screens/login/login.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: TSpacingStyle.paddingWithAppBarHeight * 2,
                child: Column(children: [
                  Image(
                    image: AssetImage(image),
                    width: THelperFunctions.getScreenWidth() * 0.6,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: onPressed,
                          child: const Text(TTexts.tContinue))),
                ]))));
  }
}
