import 'package:db_miner/modal/db_model.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

enum QuoteTable {
  id,
  quote,
  author,
}

class LikeDB {
  LikeDB._();
  static final LikeDB likedb = LikeDB._();

  late Database database;
  Logger logger = Logger();
  String db_name = 'data_base.db';
  String tablename = 'liketable';
  String sql = 'Query here';

  Future<void> addFavQuote({required Quotes q}) async {
    Map<String, dynamic> data = q.toJson();
    data.remove('id');
    await database
        .insert(tablename, data)
        .then((value) => logger.i("INSERTED ${q.author}"))
        .onError(
          (error, stackTrace) => logger.e("ERROR ${q.author}/n$error"),
        );
  }

  Future<void> initDataBase() async {
    String dbPath = await getDatabasesPath();
    database = await openDatabase(
      "$dbPath/$db_name",
      version: 2,
      onCreate: (db, version) {},
      onUpgrade: (db, v1, v2) {
        sql =
            "CREATE TABLE IF NOT EXISTS $tablename(${QuoteTable.id.name} INTEGER PRIMARY KEY AUTOINCREMENT, ${QuoteTable.quote.name} TEXT, ${QuoteTable.author.name} TEXT);";
        db
            .execute(sql)
            .then(
              (value) => logger.i('table created'),
            )
            .onError(
              (error, stackTrace) =>
                  logger.e('Table not created\n Error: $error'),
            );
      },
      onDowngrade: (version, v1, v2) {},
    );
  }

  Future<void> insertData({required Quotes quote}) async {
    Map<String, dynamic> data = quote.toJson();
    data.remove('id');
    await database
        .insert(tablename, data)
        .then(
          (value) => logger.i('!Query! ${quote.quote} inserted '),
        )
        .onError(
          (error, stackTrace) =>
              logger.e(' !Query!${quote.quote} insertion error'),
        );
  }

  Future<void> deleteData({required Quotes quote}) async {
    await database
        .delete(
          tablename,
          where: '${QuoteTable.id.name} = ?',
          whereArgs: [quote.id],
        )
        .then(
          (value) => logger.i('${quote.quote} deleted'),
        )
        .onError(
          (error, stackTrace) => logger.e('${quote.quote} deletion $error'),
        );
  }

  Future<List<Quotes>> getAllData() async {
    sql = 'SELECT * FROM $tablename;';
    List<Map<String, dynamic>> data = await database.rawQuery(sql);

    return data
        .map(
          (e) => Quotes.fromJson(e),
        )
        .toList();
  }
}
