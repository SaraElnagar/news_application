import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
      drawerTheme: const DrawerThemeData(shape: ContinuousRectangleBorder()),
      primaryColor: AppColors.primaryLightColor,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppColors.whiteColor),
          backgroundColor: AppColors.primaryLightColor,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor),
        titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor),
        titleSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor),
      ));
}
