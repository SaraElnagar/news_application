import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../../app_colors.dart';
import '../../model/NewsResponse.dart';
import '../../model/SourceResponse.dart';
import 'news_item.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(
          widget.source.id ?? "",
        ),
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
                const Text('Something went wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(
                        widget.source.id ?? '',
                      );
                      setState(() {});
                    },
                    child: const Text('Try again'))
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
                      ApiManager.getNewsBySourceId(
                        widget.source.id ?? '',
                      );
                      setState(() {});
                    },
                    child: const Text('Try again'))
              ],
            );
          }
          var newsList = snapshot.data!.articles!;
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news: newsList[index]);
              },
              itemCount: newsList.length,
            ),
          );
        });
  }
}