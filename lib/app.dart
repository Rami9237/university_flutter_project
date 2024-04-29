import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/features/authentication/screens/onboarding/onboarding.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Use GetMaterialApp instead of MaterialApp
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
