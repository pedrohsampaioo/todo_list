import 'package:sembast/sembast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

import 'package:todo_list/app/config/database/database_keys.dart';

abstract class DatabaseConfig {
  static Database? database;
  static Future<void> init() async {
    if (database == null) {
      final dbName = DatabaseKeys.databaseName;
      final dir = await getApplicationDocumentsDirectory();
      await dir.create(recursive: true);
      final dbPath = join(dir.path, dbName);
      final dbFactory = databaseFactoryIo;
      final db = await dbFactory.openDatabase(dbPath);
      database = db;
    }
  }
}
