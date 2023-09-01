import 'package:sqflite/sqflite.dart';
import 'package:test_project/screens/all_news/bloc/news_bloc.dart';
import 'package:test_project/service/database_helper.dart';
import 'package:test_project/models/local/news.dart';

class NewsHelper {

  static Future<void> insertAll(
      {required List<News> newsList, required String tableName}) async {
    final db = await DatabaseHelper.getDB();
    if (db == null) {
      print('no database found');
      return;
    }
    Batch batch = db.batch();
    for (News news in newsList) {
      batch.insert(tableName, news.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
    return;
  }

  static Future<List<News>?> getAllNews({
    required String tableName
}) async {
    final db = await DatabaseHelper.getDB();
    if (db == null) print('No database found');

    final List<Map<String, dynamic>> maps =
        await db.rawQuery('SELECT * FROM $tableName');


    if (maps.isEmpty) {
      print('no data found in db');
      return null;
    }

    return List.generate(
        maps.length, (index) => News.fromJson(maps[index]));
  }
}
