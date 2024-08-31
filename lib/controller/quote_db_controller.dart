import 'package:db_miner/headers.dart';

class QuoteController extends ChangeNotifier {
  QuoteController() {
    initDataBase();
  }

  List<Quotes> allquotes = [];
  List<Quotes> allFavQuotes = [];
  List allFavAuthor = [];

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
