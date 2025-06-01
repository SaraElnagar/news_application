import 'package:flutter/material.dart';
import 'package:news_application/l10n/app_localizations.dart';
import 'package:news_application/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';
import 'language_bottom_sheet.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.settings,
              style: Theme.of(context).textTheme.titleMedium),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.primaryLightColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.appLanguage == "en"
                          ? AppLocalizations.of(context)!.english
                          : provider.appLanguage == "es"
                              ? AppLocalizations.of(context)!.spanish
                              : provider.appLanguage == "fr"
                                  ? AppLocalizations.of(context)!.french
                                  : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 15, color: AppColors.primaryLightColor)),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.primaryLightColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }
}
