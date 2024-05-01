import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false, actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ]),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(TImages.email),
                      width: THelperFunctions.getScreenWidth() * 0.6,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    Text(
                      TTexts.changePasswordTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Text(
                      TTexts.changePasswordSubTitle,
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text(TTexts.done))),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SizedBox(
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(TTexts.resendEmail))),
                  ],
                ))));
  }
}
