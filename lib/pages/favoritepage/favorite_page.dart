import 'dart:math';
import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
