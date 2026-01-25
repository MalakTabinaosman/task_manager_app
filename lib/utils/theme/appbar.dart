import 'package:flutter/material.dart';

import '../constants/colors.dart';

/// Builds the AppBar theme.
AppBarTheme buildAppBarTheme() {
  return const AppBarTheme(
    elevation: 0,
    centerTitle: true,

    
    backgroundColor: AppColors.lightBackground,
    foregroundColor: AppColors.lightTextPrimary,

    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextPrimary,
    ),

    iconTheme: IconThemeData(
      color: AppColors.lightTextPrimary,
    ),
  );
}
