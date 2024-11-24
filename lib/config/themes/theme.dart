import 'package:app_aws_recipes/config/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    colorSchemeSeed: AppColors.primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
