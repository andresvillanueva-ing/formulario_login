
import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

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

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        userId: json["userId"],
        fullName: json["fullName"],
        email: json["email"],
        userName: json["userName"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "fullName": fullName,
        "email": email,
        "userName": userName,
        "password": password,
    };
}
