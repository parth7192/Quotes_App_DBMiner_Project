import 'package:db_miner/headers.dart';

class TheamController extends ChangeNotifier {
  SharedPreferences sp;
  TheamController({required this.sp}) {
    initTheme();
  }

  bool isDark = false;
  ThemeMode tm = ThemeMode.system;
  void initTheme() {
    isDark = sp.getBool('isDark') ?? false;
    tm = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void changeTheme() {
    isDark = !isDark;
    sp.setBool('isDark', isDark);
    tm = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
