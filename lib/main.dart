import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/controller/theme_controller.dart';
import 'package:db_miner/my_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => QuotesController(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TheamController(sp: sharedPreferences),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
