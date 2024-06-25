import 'dart:math';
import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/controller/theme_controller.dart';
import 'package:db_miner/routes/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuotesController mutable = Provider.of<QuotesController>(context);
    QuotesController unmutable =
        Provider.of<QuotesController>(context, listen: false);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
