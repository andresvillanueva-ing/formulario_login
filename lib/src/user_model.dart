
class UserModel{

  final int id;
  final String nombre;
  final String gmail;
  final String password;

  UserModel({
    this.id = -1,
    required this.nombre,
    required this.gmail,
    required this.password,
  });

  UserModel copyWith({int? id, String? name, String? gmail, String? password}){
    return UserModel(
      nombre:  nombre ?? this.nombre,
      gmail: gmail ?? this.gmail,
      password: password ?? this.password,
      id: id ?? this.id,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
      nombre:  map['nombre'],
      gmail: map['gmail'],
      password: map['password'],
      id: map['id'],
    );
  }

  Map<String,dynamic> toMap() => {
    'id': id,
    'nombre':  nombre,
    'gmail': gmail,
    'password': password, 
  };
}