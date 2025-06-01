import 'package:flutter/material.dart';
import 'package:news_application/home/news/news_details_screen.dart';
import 'package:news_application/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../api/api_manager.dart';
import '../../app_colors.dart';
import '../../model/NewsResponse.dart';
import '../../providers/app_config_provider.dart';
import '../news/news_item.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => showResults(context), icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final languageProvider = Provider.of<AppConfigProvider>(context).appLanguage;
    if (query.isEmpty) {
      return Center(child: Text(AppLocalizations.of(context)!.no_suggestions),);
    }
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.searchNews(query,languageProvider),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.searchNews(query,languageProvider);
                    },
                    child: Text(AppLocalizations.of(context)!.try_again))
              ],
            );
          }
          // server => success , error
          if (snapshot.data!.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.searchNews(query,languageProvider);
                    },
                    child: const Text('Try again'))
              ],
            );
          }
          var newsList = snapshot.data!.articles!;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemBuilder: (context, index) {
                var news = newsList[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, NewsDetailsScreen.routeName,
                        arguments: news);
                  },
                  child: NewsItem(news: newsList[index]),
                );
              },
              itemCount: newsList.length,
            ),
          );
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        primaryColor: AppColors.primaryLightColor,
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primaryLightColor,
            foregroundColor: AppColors.whiteColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ))),
        textTheme: TextTheme(
            titleLarge: TextStyle(
          color: AppColors.whiteColor,
        )),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ));
  }
}
