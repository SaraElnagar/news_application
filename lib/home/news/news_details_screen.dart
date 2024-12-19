import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_application/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_colors.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = "NewsDetailsScreen";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as News;
    String formattedHour = DateFormat('h')
        .format(DateTime.parse(args.publishedAt ?? DateTime.now().toString()));
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset(
            "assets/images/main_background.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.primaryLightColor,
            title: Text(
              args.source?.name ?? 'No Title',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: args.urlToImage ?? "",
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primaryLightColor,
                      )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    args.author ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.greyColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    args.title ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    textAlign: TextAlign.end,
                    "$formattedHour hours ago",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Text(
                    args.content ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          _launchUrl(args.url ?? "");
                        },
                        child: Text(
                          "View Full Article",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: AppColors.blackColor),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_right_rounded,
                        color: Colors.black,
                        size: 40,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(newsUrl) async {
    final Uri _url = Uri.parse(newsUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
