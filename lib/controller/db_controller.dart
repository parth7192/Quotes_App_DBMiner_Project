import 'package:db_miner/helper/db_helper.dart';
import 'package:db_miner/modal/db_model.dart';
import 'package:flutter/cupertino.dart';

class QuotesController extends ChangeNotifier {
  List<Quotes> allquotes = [];

  QuotesController() {
    getQuotes();
  }

  getQuotes() async {
    allquotes = await QuotesHelper.apiHelper.getapi();
    notifyListeners();
  }
}
