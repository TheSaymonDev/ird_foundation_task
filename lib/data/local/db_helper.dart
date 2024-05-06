import 'dart:io';
import 'package:flutter/services.dart';
import 'package:ird_foundation_task/data/models/hadith_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  Future<Database> initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "hadith_db.db");
    var exists = await databaseExists(path);
    if (!exists) {
      try {
        await _copyAssetToDatabase(path);
      } catch (e) {
        throw Exception("Error copying database: $e");
      }
    }
    // Open the database
    return await openDatabase(path, readOnly: true);
  }
  Future<void> _copyAssetToDatabase(String dbPath) async {
    var data = await rootBundle.load('assets/hadith_db.db');
    var bytes = data.buffer.asUint8List();
    await File(dbPath).writeAsBytes(bytes);
  }
  Future<List<HadithModel>> getHadithByChapterAndBookId(int chapterId, int bookId) async {
    final db = await initializeDatabase();
    List<Map> hadith = await db.rawQuery(
        'SELECT * FROM hadith WHERE chapter_id = $chapterId AND book_id = $bookId');
    List<HadithModel> hadithList = hadith.map((map) => HadithModel.fromMap(map)).toList();
    await db.close();
    return hadithList;
  }
}