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
    onCreate: (db, version) async {
      await db.execute(user);
    });
 }
 
  //autentificacion
  
  Future<bool> authenticate(Users usr)async{
    String sql = " users where userName = '${usr.userName}' AND userPassword = '${usr.password}' ";
    final Database db = await initDB();
    var result = await db.query(sql);
    if(result.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }

  //crear usuario
  Future<int> createUser(Users usr)async{
    final Database db = await initDB();
    return db.insert("users", usr.toMap() );
  }

  //get current user details
  Future<Users?> getUser(String userName) async{
    final Database db = await initDB();
    var res = await db.query("users", where: "userName = ?", whereArgs: [userName]);
    return res.isNotEmpty? Users.fromMap(res.first):null;
  }
  
}
