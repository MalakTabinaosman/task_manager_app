import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'text.dart';
import 'buttons.dart';
import 'appbar.dart';

/// Aggregates theme pieces into ThemeData.
class AppTheme {
  AppTheme._();

  // ================= LIGHT THEME =================
  static ThemeData light() {
    final ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.lightPrimary,
      onPrimary: Colors.white,
      secondary: AppColors.lightSecondary,
      onSecondary: Colors.white,
      error: AppColors.lightError,
      onError: Colors.white,
      background: AppColors.lightBackground,
      onBackground: AppColors.lightTextPrimary,
      surface: AppColors.lightCard,
      onSurface: AppColors.lightTextPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.lightBackground,
      textTheme: buildTextTheme().apply(
        bodyColor: AppColors.lightTextPrimary,
        displayColor: AppColors.lightTextPrimary,
      ),
      elevatedButtonTheme: buildElevatedButtonTheme(),
      textButtonTheme: buildTextButtonTheme(),
      outlinedButtonTheme: buildOutlinedButtonTheme(),
      appBarTheme: buildAppBarTheme().copyWith(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightTextPrimary,
      ),
      dividerColor: AppColors.lightDivider,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }

  // ================= DARK THEME =================
  static ThemeData dark() {
    final ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.darkBackground,
      secondary: AppColors.darkSecondary,
      onSecondary: AppColors.darkBackground,
      error: AppColors.darkError,
      onError: Colors.black,
      background: AppColors.darkBackground,
      onBackground: AppColors.darkTextPrimary,
      surface: AppColors.darkCard,
      onSurface: AppColors.darkTextPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.darkScaffold,
      textTheme: buildTextTheme().apply(
        bodyColor: AppColors.darkTextPrimary,
        displayColor: AppColors.darkTextPrimary,
      ),
      elevatedButtonTheme: buildElevatedButtonTheme(),
      textButtonTheme: buildTextButtonTheme(),
      outlinedButtonTheme: buildOutlinedButtonTheme(),
      appBarTheme: buildAppBarTheme().copyWith(
        backgroundColor: AppColors.darkScaffold,
        foregroundColor: AppColors.darkTextPrimary,
      ),
      dividerColor: AppColors.darkDivider,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
