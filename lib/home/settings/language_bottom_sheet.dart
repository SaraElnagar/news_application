import 'package:flutter/material.dart';
import 'package:news_application/app_colors.dart';
import 'package:news_application/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
   var provider=Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              /// change language to english
              provider.changeLanguage("en");
            },
              ///english selected
            child:provider.appLanguage=="en"?getSelectedItemWidget(AppLocalizations.of(context)!.english):getUnSelectedItemWidget(AppLocalizations.of(context)!.english),
          ),
          SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: (){
              /// change language to spanish
              provider.changeLanguage("es");
            },
              ///spanish selected
              child: provider.appLanguage=="es"?getSelectedItemWidget(AppLocalizations.of(context)!.spanish):getUnSelectedItemWidget(AppLocalizations.of(context)!.spanish),
          ),
          SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: (){
              /// change language to french
              provider.changeLanguage("fr");
            },
            /// french selected
            child:provider.appLanguage=="fr"?getSelectedItemWidget(AppLocalizations.of(context)!.french):getUnSelectedItemWidget(AppLocalizations.of(context)!.french),
          ),
          SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: (){
              /// change language to arabic
              provider.changeLanguage("ar");
            },
              /// arabic selected
            child:provider.appLanguage=="ar"?getSelectedItemWidget(AppLocalizations.of(context)!.arabic):getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text){
    return  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.primaryLightColor),
      ),
      Icon(Icons.check,color: AppColors.primaryLightColor,size: 35,),
    ]);
  }
  Widget getUnSelectedItemWidget(String text){
    return Text(
text ,     style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
