import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../../app_colors.dart';
import '../../model/Category.dart';
import '../../model/SourceResponse.dart';
import '../tabs/tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryLightColor,
            ));
          } else if (snapshot.hasError) {
            return Column(
              children: [
                const Text('Something went wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.category.id);
                      setState(() {});
                    },
                    child: const Text('Try Again'))
              ],
            );
          }

          /// server (response) => success , error
          if (snapshot.data!.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.category.id);
                      setState(() {});
                    },
                    child: const Text('Try Again'))
              ],
            );
          }

          /// success
          var sourceList = snapshot.data!.sources!;
          return TabWidget(
            sourcesList: sourceList,
          );
        });
  }
}
