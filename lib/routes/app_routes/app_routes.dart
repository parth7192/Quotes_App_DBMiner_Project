import 'package:db_miner/pages/detailpage/detail_page.dart';
import 'package:db_miner/pages/favoritepage/favorite_page.dart';
import 'package:db_miner/pages/homepage/home_page.dart';
import 'package:db_miner/pages/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();
  String splashscreen = '/';
  String homepage = 'home_page';
  String detailpage = 'detail_page';
  String favoritepage = 'favorite_page';

  Map<String, Widget Function(BuildContext)> routes = {
    "/": (context) => const SplashScreen(),
    "home_page": (context) => HomePage(),
    "detail_page": (context) => const DetailPage(),
    "favorite_page": (context) => const FavoritePage(),
  };
}
