import 'package:db_miner/helper/db/like_db.dart';
import 'package:db_miner/modal/db_model.dart';
import 'package:db_miner/services/quotes_services/quotes_services.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class QuoteController extends ChangeNotifier {
  QuoteController() {
    // getallQutos();
  }

  List<Quotes> allquotes = [];
  List<Quotes> allFavQuotes = [];
  List allFavAuthor = [];

  // Future<void> getallQutos() async {
  //   allquotes = await QuotesServices.services.getallQuotes();
  // }

  Future<void> initDataBase() async {
    allFavQuotes = await LikeDB.likedb.getAllData();
    Logger().i('!DB! quotes in ctr: $allFavQuotes');
    notifyListeners();
  }

  Future<void> addFavDatabase({required Quotes quote}) async {
    await LikeDB.likedb.insertData(quote: quote);
    initDataBase();
  }

  Future<void> deleteFavDatabase({required Quotes quote}) async {
    await LikeDB.likedb.deleteData(quote: quote);
    initDataBase();
  }
}
