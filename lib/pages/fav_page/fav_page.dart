import 'package:db_miner/headers.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuotesController mutable = Provider.of<QuotesController>(context);
    QuotesController unmutable =
        Provider.of<QuotesController>(context, listen: false);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favorite Page"),
        actions: [],
      ),
    );
  }
}
