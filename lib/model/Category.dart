import 'package:flutter/material.dart';
import 'package:news_application/l10n/app_localizations.dart';

import '../app_colors.dart';

class Category {
  String id;
  String imagePath;

  String title;

  Color color;

  Category(
      {required this.id,
      required this.imagePath,
      required this.title,
      required this.color});

  static List<Category> getCategories( BuildContext context) {
    return [
      Category(
          id: 'sports',
          imagePath: 'assets/images/sports.png',
          title: AppLocalizations.of(context)!.sports,
          color: AppColors.redColor),
      Category(
          id: 'general',
          imagePath: 'assets/images/general.png',
          title: AppLocalizations.of(context)!.general,
          color: AppColors.darkBlueColor),
      Category(
          id: 'health',
          imagePath: 'assets/images/health.png',
          title: AppLocalizations.of(context)!.health,
          color: AppColors.pinkColor),
      Category(
          id: 'business',
          imagePath: 'assets/images/bussines.png',
          title: AppLocalizations.of(context)!.business,
          color: AppColors.brownColor),
      Category(
          id: 'entertainment',
          imagePath: 'assets/images/entertainment.png',
          title: AppLocalizations.of(context)!.entertainment,
          color: AppColors.blueColor),
      Category(
          id: 'science',
          imagePath: 'assets/images/science.png',
          title: AppLocalizations.of(context)!.science,
          color: AppColors.yellowColor),
      Category(
          id: 'technology',
          imagePath: 'assets/images/technology.png',
          title: AppLocalizations.of(context)!.technology,
          color: AppColors.darkBlueColor),
    ];
  }
}
