import 'package:flutter/material.dart';

import '../../model/Category.dart';
import 'category_item.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = Category.getCategories();
  Function onCategoryItemClick;

  CategoryFragment({required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category\nof interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryItemClick(categoriesList[index]);
                    },
                    child: CategoryItem(
                        category: categoriesList[index], index: index));
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
