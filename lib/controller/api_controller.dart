import 'package:db_miner/helper/api/api_helper.dart';
import 'package:db_miner/modal/db_model.dart';
import 'package:flutter/material.dart';

class QuotesController extends ChangeNotifier {
  List<Quotes> allquotes = [];

  QuotesController() {
    getQuotes();
  }

  Future<void> getQuotes() async {
    allquotes = await QuotesHelper.apiHelper.getApi();
    notifyListeners();
  }
}
