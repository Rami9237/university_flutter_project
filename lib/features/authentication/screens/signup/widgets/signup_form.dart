import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_project/features/authentication/controllers/signup/signup_controller.dart';
import 'package:mobile_project/features/authentication/screens/signup/verify_email.dart';
import 'package:mobile_project/utils/validators/validation.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(children: [
              Expanded(
                child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        TValidator.validateEmptyText('first name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user))),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        TValidator.validateEmptyText('last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user))),
              ),
            ]),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
                controller: controller.username,
                validator: (value) =>
                    TValidator.validateEmptyText('username', value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.username,
                    prefixIcon: Icon(Iconsax.edit))),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
                validator: (value) => TValidator.validateEmail(value),
                controller: controller.email,
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct))),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
                controller: controller.phoneNumber,
                validator: (value) => TValidator.validatePhoneNumber(value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.phoneNumber,
                    prefixIcon: Icon(Iconsax.call))),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  validator: (value) => TValidator.validatePassword(value),
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye)))),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Row(children: [
              SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(() => Checkbox(
                      value: controller.policyCheck.value,
                      onChanged: (value) => controller.policyCheck.value =
                          !controller.policyCheck.value))),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: '${TTexts.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: TTexts.policy,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary),
                ),
              ]))
            ]),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => (controller.signup()),
                    child: const Text(TTexts.createAnAccount)))
          ],
        ));
  }
}
