import 'package:flutter/material.dart';

import 'home/home_screen.dart';
import 'home/news/news_details_screen.dart';
import 'my_theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
      },
    );
  }
}
