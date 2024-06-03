import 'package:db_miner/controller/db_controller.dart';
import 'package:db_miner/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuotesController mutable = Provider.of<QuotesController>(context);
    QuotesController unmutable =
        Provider.of<QuotesController>(context, listen: false);

    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HOME PAGE"),
        actions: [
          IconButton(
            icon: const Icon(Icons.switch_right),
            onPressed: () {
              Provider.of<TheamController>(context, listen: false)
                  .changeTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: (mutable.allquotes.isNotEmpty)
            ? ListView.builder(
                itemCount: mutable.allquotes.length,
                itemBuilder: (context, Index) => Card(
                  child: ListTile(
                    title: Text(mutable.allquotes[Index].quote),
                    subtitle: Text(mutable.allquotes[Index].author),
                  ),
                ),
              )
            : const Center(
                child: Text("No Quotes Available"),
              ),
      ),
    );
  }
}
