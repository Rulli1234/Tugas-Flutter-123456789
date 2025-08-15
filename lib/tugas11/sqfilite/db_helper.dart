import 'package:path/path.dart';
import 'package:ppkd_b_3/tugas11/model/user.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> databaseHelper() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'game.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE game (id INTEGER PRIMARY KEY, judul TEXT, kategori TEXT, tahun TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> registerUser(game) async {
    final db = await databaseHelper();
    await db.insert(
      'game',
      game.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<Game?> loginUser(String email, String password) async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      return Game.fromMap(results.first);
    }
    return null;
  }

  static Future<List<Game>> getAllUsers() async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query('game');
    return results.map((e) => Game.fromMap(e)).toList();
  }
}
