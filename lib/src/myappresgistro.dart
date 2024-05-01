import 'package:flutter/material.dart';
import 'package:formulario_login/components/button.dart';
import 'package:formulario_login/components/colors.dart';
import 'package:formulario_login/components/textfield.dart';
import 'package:formulario_login/src/myApp.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {

  //controller
  final FullName = TextEditingController();
  final email = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Registrer New Account",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                  ),),
                ),

                const SizedBox(height: 20,),
                InputField(hint: "Full Name", icon: Icons.person, controller: FullName),
                InputField(hint: "email", icon: Icons.email, controller: email),
                InputField(hint: "User Name", icon: Icons.account_circle, controller: userName),
                InputField(hint: "Password", icon: Icons.lock, controller: password),
                InputField(hint: "Re-enter", icon: Icons.lock, controller: confirpassword),

                const SizedBox(height: 20,),
                Button(label: "SIGN UP", press: (){}),
          
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account", style: TextStyle(color: Colors.grey),),
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                    }, child: Text("LOGIN"))
                  ],
                ),
              ],
            ),
            ),
        ),
      ),
    );
  }
}