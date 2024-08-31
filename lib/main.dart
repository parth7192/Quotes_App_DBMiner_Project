import 'package:db_miner/headers.dart';

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
