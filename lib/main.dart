import 'package:flutter/material.dart';
import 'package:mobile_project/utils/theme/theme.dart';

void main() {

  // Todo: Add Widgets Binding
  // Todo: init Local Storage
  // Todo: Await Native Splash
  // Todo: init firebase
  // Todo: init auth

  runApp(const App());
}

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme
      );
  }
}