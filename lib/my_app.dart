import 'package:db_miner/controller/theme_controller.dart';
import 'package:db_miner/routes/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
