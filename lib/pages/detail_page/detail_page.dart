import 'package:db_miner/headers.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuotesController mutable = Provider.of<QuotesController>(context);
    QuotesController unmutable =
        Provider.of<QuotesController>(context, listen: false);

    Quotes data = ModalRoute.of(context)?.settings.arguments as Quotes ??
        mutable.allquotes[0];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Details Page"),
      ),
      body: Container(
        height: size.height * 0.1,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/564x/f9/89/b6/f989b64e90573f420ac29ad0aa436c66.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Card(
              child: Text(data.quote),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(data.author),
            ),
          ],
        ),
      ),
    );
  }
}
