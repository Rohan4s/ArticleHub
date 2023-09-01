import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 2;
  static const String _dbName = 'news.db';
  static const String _appleTableName = 'apple';
  static const String _teslaTableName = 'tesla';

  static Future<Database> getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $_appleTableName('
          'id INTEGER PRIMARY KEY,'
          'source_id STRING,'
          'source_name STRING,'
          'author STRING,'
          'title STRING,'
          'description STRING,'
          'url STRING,'
          'urlToImage STRING,'
          'publishedAt STRING,'
          'content STRING'
          ');',
        );
        await db.execute(
          'CREATE TABLE $_teslaTableName('
          'id INTEGER PRIMARY KEY,'
          'source_id STRING,'
          'source_name STRING,'
          'author STRING,'
          'title STRING,'
          'description STRING,'
          'url STRING,'
          'urlToImage STRING,'
          'publishedAt STRING,'
          'content STRING'
          ');',
        );
      },
      version: _version,
      // onUpgrade: (db, oldVersion, newVersion) async {
      //   if (oldVersion < 2) {
      //     await db.execute(
      //       'CREATE TABLE $_teslaTableName('
      //       'id INTEGER PRIMARY KEY,'
      //       'source_id STRING,'
      //       'source_name STRING,'
      //       'author STRING,'
      //       'title STRING,'
      //       'description STRING,'
      //       'url STRING,'
      //       'urlToImage STRING,'
      //       'publishedAt STRING,'
      //       'content STRING'
      //       ');',
      //     );
      //   }
      // }
    );
  }
}
