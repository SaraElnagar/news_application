import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_application/home/news/news_details_screen.dart';

import '../../app_colors.dart';
import '../../model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetailsScreen.routeName,
            arguments: news);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        margin: const EdgeInsets.only(bottom: 35, top: 30),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primaryLightColor,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              news.author ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.greyColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              news.title ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              news.publishedAt ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.greyColor),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
