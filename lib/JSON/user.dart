
import 'dart:convert';

Users usersFromMap(String str) => Users.fromMap(json.decode(str));

String usersToMap(Users data) => json.encode(data.toMap());

class Users {
    final int? userId;
    final String? fullName;
    final String? email;
    final String userName;
    final String password;

    Users({
         this.userId,
         this.fullName,
         this.email,
        required this.userName,
        required this.password,
    });

    factory Users.fromMap(Map<String, dynamic> json) => Users(
        userId: json["userId"],
        fullName: json["fullName"],
        email: json["email"],
        userName: json["userName"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId,
        "fullName": fullName,
        "email": email,
        "userName": userName,
        "password": password,
    };
}
