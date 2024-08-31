import 'dart:math';

import 'package:db_miner/headers.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuotesController mutable = Provider.of<QuotesController>(context);
    QuotesController unmutable =
        Provider.of<QuotesController>(context, listen: false);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/736x/cb/31/0c/cb310c2f85868ec882758d5e17ee28e6.jpg"),
              ),
              accountName: Text(
                "DB MINER",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              accountEmail: Text(
                "dbminer@gmail.com",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HOME PAGE"),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  mutable.allquotes.contains(e)
                      ? Icons.brightness_2_outlined
                      : Icons.brightness_2,
                ),
                onPressed: () {
                  Provider.of<TheamController>(context, listen: false)
                      .changeTheme();
                },
              ),
              IconButton(
                icon: Icon(
                  mutable.allquotes.contains(e)
                      ? Icons.favorite_border
                      : Icons.favorite,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.instance.favoritepage);
                  // Provider.of<FavController>(context, listen: false).like;
                },
              ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Provider.of<TheamController>(context).isDark
                ? const AssetImage("lib/assets/image/dark.png")
                : const AssetImage("lib/assets/image/light.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: (mutable.allquotes.isNotEmpty)
              ? ListView.builder(
                  itemCount: mutable.allquotes.length,
                  itemBuilder: (context, Index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.instance.detailpage,
                        arguments: mutable.allquotes[Index],
                      );
                    },
                    child: Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ExpansionTile(
                          title: Text(
                            mutable.allquotes[Index].quote,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    mutable.allquotes[Index].author,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      unmutable.allquotes.contains(e)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                    ),
                                    onPressed: () {
                                      // Provider.of<FavController>(context,
                                      //         listen: false)
                                      //     .changeLike();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: Text("No Quotes Available"),
                ),
        ),
      ),
    );
  }
}
