class DatabaseSchema {

  static const String dbName = 'news.db';
  static const String appleTableName = 'apple';
  static const String teslaTableName = 'tesla';
  static const int version = 1;

  static const appleTable = 'CREATE TABLE $appleTableName('
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
      ');';

  static const teslaTable = 'CREATE TABLE $teslaTableName('
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
      ');';

}
