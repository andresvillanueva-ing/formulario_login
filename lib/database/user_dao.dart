import 'package:formulario_login/database/database_helper.dart';
import 'package:formulario_login/src/user_model.dart';

class UserDao{
  final database = Databasehelper.instance.db;

  Future<List<UserModel>> readAll() async{
    final data = await database.query('users');
    return data.map((e) => UserModel.fromMap(e)).toList();
  }

  Future<int> insert(UserModel user) async{
    return await database.insert('users', {'nombre': user.nombre, 'gmail': user.gmail, 'password': user.password });
  }

  Future<void> update(UserModel user) async{
    await database.update('users', user.toMap(), )
  }
}