import 'package:flutter/material.dart';
import 'package:gifting/presentation/main_screen/main_screen.dart';
import 'package:gifting/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:gifting/presentation/onboarding_screen/welcome_screen/welcome_screen.dart';
import 'package:gifting/presentation/settings_screen/settings_screen.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';
  static const String welcomeScreen = '/welcome_screen';
  static const String mainScreen = '/main_screen';
  static const String settingsScreen = '/settings_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        onboardingScreen: OnboardingScreen.builder,
        welcomeScreen: WelcomeScreen.builder,
        mainScreen: MainScreen.builder,
        settingsScreen: SettingsScreen.builder,
      };
}
