import 'package:flutter/material.dart';
import 'package:formulario_login/components/button.dart';
import 'package:formulario_login/components/colors.dart';
import 'package:formulario_login/src/myApp.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 77,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("Image/user.jpg"),
                    radius: 75,
                  ),
                ),
                  
                SizedBox(height: 10,),
                Text("Perfil de ejemplo", style: TextStyle(fontSize: 28, color: primaryColor),),
                Text("Perfildeejemplo@gmail.com", style: TextStyle(fontSize: 17, color: Colors.grey),),
                  
                Button(label: "SIGN UP", press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                }),
                  
                const ListTile(
                  leading: Icon(Icons.person, size: 30,),
                  subtitle: Text("Full Name"),
                  title: Text("Perfil de ejemplo"),
                ),
                  
                const ListTile(
                  leading: Icon(Icons.email, size: 30,),
                  subtitle: Text("email"),
                  title: Text("Perfildeejemplo@gmail.com"),
                ),
                  
                const ListTile(
                  leading: Icon(Icons.account_circle, size: 30,),
                  subtitle: Text("UserName"),
                  title: Text("admin"),
                ),
                  
              ],
            ),
          )
          ),
      ),
    );
  }
}