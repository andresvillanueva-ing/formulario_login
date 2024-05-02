import 'package:flutter/material.dart';
import 'package:formulario_login/JSON/user.dart';
import 'package:formulario_login/components/button.dart';
import 'package:formulario_login/components/colors.dart';
import 'package:formulario_login/components/textfield.dart';
import 'package:formulario_login/database/database_helper.dart';
import 'package:formulario_login/src/myappresgistro.dart';
import 'package:formulario_login/src/perfil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final userName = TextEditingController();
  final password = TextEditingController();
  bool isCheckd = false;
  bool isLoginTrue = false;

  final db = DatabaseHelper();
  //Login Method
  Login()async{
    var res = await db.authenticate(Users(userName: userName.text, password: password.text));
    if (res == true) {
      if (!mounted) return;
      Navigator.push(context, MaterialPageRoute(builder: ((context) => const Profile())));    
    }else{
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //texto que se muestra en el inicio del login
                 const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45.0,
                        color: primaryColor,
                      ),
                    ),
          
                    //logo que aparece en la pantalla 
                    CircleAvatar(
                      radius: 100.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('Image/logouni.png'),
                    ),
          
                    
          
                    //textField 
                  InputField(hint: "Username", icon: Icons.account_circle, controller: userName),
                  InputField(hint: "Password", icon: Icons.lock, controller: password, passwordInvisible: true,),
          
                  ListTile(
                    horizontalTitleGap: 2,
                    title: const Text('Remember me'),
                    leading: Checkbox(
                      activeColor: primaryColor,
                      value: isCheckd,
                      onChanged:(value){
                        setState(() {
                          isCheckd = !isCheckd;
                        });
                      },
                    ),
                  ),
                  Button(label: "Login", press: (){
                    Login();
                  }),
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('don´t have an account?', style: TextStyle(color: Colors.grey),),
                      TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                                  MaterialPageRoute(builder: (context) => const SingupScreen())
                          );
                        },
                        child:  const Text('SING UP')
                        ),
                    ],
                  ),
          
                  isLoginTrue? Text("username or password is incorrect", 
                  style: TextStyle(color: Colors.red.shade900),):
                  const SizedBox(),
              ],
              ),
            ),
        ),
      ),
    );
  }
}


