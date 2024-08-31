import 'package:db_miner/headers.dart';

class QuotesController extends ChangeNotifier {
  List<Quotes> allquotes = [];

  QuotesController() {
    getQuotes();
  }

  Future<void> getQuotes() async {
    allquotes = await QuotesServices.services.getallQuotes();
    notifyListeners();
  }
}
