import 'package:db_miner/headers.dart';
import 'package:db_miner/pages/detail_page/detail_page.dart';
import 'package:db_miner/pages/fav_page/fav_page.dart';
import 'package:db_miner/pages/home_page/home_page.dart';
import 'package:db_miner/pages/splash_screen/splash_screen.dart';

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
