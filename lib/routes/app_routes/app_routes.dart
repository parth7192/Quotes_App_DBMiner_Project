import 'package:db_miner/pages/homepage/home_page.dart';
import 'package:db_miner/pages/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();
  String homepage = '/';
  String splashscreen = 'splashscreen';

  Map<String, Widget Function(BuildContext)> routes = {
    "/": (context) => HomePage(),
    "splashscreen": (context) => SplashScreen(),
  };
}
