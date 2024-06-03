import 'package:db_miner/routes/app_routes/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.instance.homepage,
        );
      },
    );

    return Scaffold(
      body: Text("Splash Screen"),
    );
  }
}
