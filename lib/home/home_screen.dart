import 'package:flutter/material.dart';
import 'package:news_application/home/search/news_search_delegate.dart';
import 'package:news_application/home/settings/settings_tab.dart';
import 'package:news_application/l10n/app_localizations.dart';

import '../app_colors.dart';
import '../model/category.dart';
import 'category/category_details.dart';
import 'category/category_fragment.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: AppColors.whiteColor,
        child: Image.asset(
          'assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            selectedSideMenuItem == HomeDrawer.settings
                ? AppLocalizations.of(context)!.settings
                : selectedCategory == null
                    ? AppLocalizations.of(context)!.app_title
                    : selectedCategory!.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: NewsSearchDelegate()),
                icon: const Icon(
                  Icons.search,
                  size: 28,
                ))
          ],
        ),
        drawer: Drawer(
          child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick),
        ),
        body: selectedSideMenuItem == HomeDrawer.settings
            ? SettingTab()
            : selectedCategory == null
                ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
                : CategoryDetails(category: selectedCategory!),
      )
    ]);
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newCategory) {
    //todo: newCategory => user select
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedSideMenuItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newSideMenuItem) {
    //todo: newSideMenuItem => user select
    selectedSideMenuItem = newSideMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
