// import 'dart:convert';
//
// import 'package:db_miner/modal/db_model.dart';
// import 'package:http/http.dart' as http;
//
// class QuotesServices {
//   QuotesServices._();
//   static final QuotesServices services = QuotesServices._();
//
//   String quotes = "https://dummyjson.com/quotes";
//   Future<List<Quotes>> getallQuotes() async {
//     List<Quotes> allquotes = [];
//
//     http.Response response = await http.get(Uri.parse(quotes));
//
//     if (response.statusCode == 200) {
//       List data = await jsonDecode(response.body)["quotes"];
//
//       allquotes = data.map((e) => Quotes.fromJson(e)).toList();
//     }
//     return allquotes;
//   }
// }
