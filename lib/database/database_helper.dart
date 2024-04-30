import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  static DatabaseHelper? _databasehelper;
  DatabaseHelper._internal();
  static DatabaseHelper get instance => _databasehelper ?? DatabaseHelper._internal();

  late Database _db; 
  Database get db => _db;

 Future<void> init() async{
  await DatabaseHelper.instance.init();
  _db = await openDatabase(
    'database.db',
    version: 1,
    onCreate: ((db, version) {
      db.execute('CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT,nombre TEXT, gmail TEXT, password TEXT)');
    })
  );
}
}
