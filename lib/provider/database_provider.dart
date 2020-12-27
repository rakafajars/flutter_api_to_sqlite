import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_flutter/model/meals.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  String nameTable = 'meals';
  String nameDatabase = "makanan.db";

  DBProvider._();

  Future<Database> get database async {
    // Jika database ada maka
    // kembalikan database
    if (_database != null) return _database;

    // Jika database tidak ada
    // buat 1 database
    _database = await initDB();

    return _database;
  }

  // Fungsi untuk membuat database
  // dan table meals
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, '$nameDatabase');
    print('insert database $path');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE $nameTable('
          'idCategory,'
          'strCategory TEXT,'
          'strCategoryThumb TEXT,'
          'strCategoryDescription TEXT'
          ')');
    });
  }

  insertMeals(Category newMeal) async {
    await deleteAllMeal();
    final Database db = await database;
    final res = await db.insert("$nameTable", newMeal.toJson());
    print("inserting data RAKA $res");
    return res;
  }

  deleteAllMeal() async {
    final Database db = await database;
    final res = await db.rawDelete("DELETE FROM $nameTable");
    print("Delete All Data $res");
    return res;
  }
}
