import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_project/styles/database_schema.dart';

class DatabaseHelper{

  static Future<Database> getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), DatabaseSchema.dbName),
      onCreate: (db, version) async {
        await db.execute(DatabaseSchema.appleTable);
        await db.execute(DatabaseSchema.teslaTable);
      },
      version: DatabaseSchema.version,

    );
  }
}
