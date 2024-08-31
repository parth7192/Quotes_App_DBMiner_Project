import 'package:db_miner/headers.dart';

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

    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(
            "lib/assets/logo/logo.gif",
          ),
        ),
      ),
    );
  }
}
