import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/citydb.dart';

class SqliteService {
  Future<Database> intDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Cities(id INTEGER PRIMARY KEY AUTOINCREMENT, city TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<bool> inertData() async {}

  // void createTable(Database db) async {
  //   db?.execute(
  //       "CREATE TABLE Cities(id INTEGER PRIMARY KEY AUTOINCREMENT, city TEXT NOT NULL)");
  // }

  // Future<void> getCities(Database db) async {
  //   final List<Map<String, dynamic>> maps = await db!.query("Ctiy");

  //   print(maps);
  // }
}
