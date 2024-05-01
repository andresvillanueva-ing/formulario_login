import 'package:formulario_login/JSON/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  final databaseName = "database.db";

  //table

  String user = '''
  CREATE TABLE users (
    userId INTEGER PRIMARY KEY AUTOINCREMENT,
    fullName TEXT,
    email TEXT,
    userName TEXT UNIQUE,
    userPassword TEXT
  )
 ''';
 Future<Database> initDB() async{
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, databaseName);
  
  return openDatabase(path, version: 1,
    onCreate: ((db, version) async {
      await db.execute(user);
    })
  );


  // ignore: dead_code
  Future<bool> authenticate(Users usr)async{
    final Database db = await initDB();
    var results = await db.query("SELECT * FROM users where userName= '${usr.userName}' AND userPassword '${usr.password}' ");
    if(results.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }


  
}
}
