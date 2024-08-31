import 'package:db_miner/headers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: AppRoutes.instance.routes,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      themeMode: Provider.of<TheamController>(context).tm,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
