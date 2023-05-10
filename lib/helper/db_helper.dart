
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../modals/data_modal.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper databaseHelper =
  DatabaseHelper._();

  String databaseName = "Movie.db";
  String tableName = "image";
  String colName = "Title";
  String colYear = "Year";
  String colImage = "Poster";

  Database? db;

  Future<Database> initDatabase() async {
    var db = await openDatabase("myImageDb.db");

    String dataBasePath = await getDatabasesPath();

    String path = join(dataBasePath, "myImageDB.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int vision) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS $tableName($colName TEXT, $colYear TEXT, $colImage BLOB);");
      },
    );
    return db;
  }

  Future<List<Movie>> fetchAllData() async {
    db = await initDatabase();

    String query = "SELECT * FROM $tableName";

    List<Map<String, dynamic>> res = await db!.rawQuery(query);

    List<Movie> Data = res.map((e) => Movie.fromDB(data: e)).toList();

    return Data;
  }

}

