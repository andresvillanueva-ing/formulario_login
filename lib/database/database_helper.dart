import 'package:sqflite/sqflite.dart';

class Databasehelper{

  static Databasehelper? _databasehelper;
  Databasehelper._internal();
  static Databasehelper get instace => _databasehelper ?? Databasehelper._internal();

  Database? _db; 
  Database get db => _db!;

  Future<void> init() async{
    _db = await openDatabase(
      'database.db',
      version: 1,
      onCreate: ((db, version) {
        db.execute('CREATE TABLE users (id INTEGER PRIMARY KEY, gmail TEXT, password TEXT)');
      })
    );

  }

}