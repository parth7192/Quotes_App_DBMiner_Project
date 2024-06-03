import 'dart:convert';
import 'package:db_miner/modal/db_model.dart';
import 'package:http/http.dart' as http;

class QuotesHelper {
  QuotesHelper._();

  static QuotesHelper apiHelper = QuotesHelper._();
  String ApiLink = "https://dummyjson.com/quotes";

  Future<List<Quotes>> getapi() async {
    List<Quotes> quotes = [];
    http.Response response = await http.get(Uri.parse(ApiLink));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List quote = data['quotes'];
      quotes = quote.map((e) => Quotes.fromJson(e)).toList();
    }
    return quotes;
  }
}
