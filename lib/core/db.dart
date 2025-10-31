import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDB {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), "dukaandost.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE customers(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            phone TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE transactions(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            customer_id INTEGER,
            amount REAL,
            type TEXT,
            date TEXT
          )
        ''');

        // await db.execute('''
        // CREATE TABLE inventory (
        //   id INTEGER PRIMARY KEY AUTOINCREMENT,
        //   item_name TEXT,
        //   quantity INTEGER,
        //   threshold INTEGER
        // );
        // ''');

        await db.execute('''
  CREATE TABLE inventory(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    price REAL NOT NULL
  )
''');
      },
    );
  }
}
