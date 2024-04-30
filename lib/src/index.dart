import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formulario_login/components/button.dart';
import 'package:formulario_login/components/colors.dart';
import 'package:formulario_login/src/myApp.dart';
import 'package:formulario_login/src/myappresgistro.dart';

class index extends StatelessWidget {
  const index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BIENVENIDO',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const Text(
                'inici sesion o registrate en nuestra app',
                style: TextStyle(color: Colors.grey),
              ),
              Expanded(child: Image.asset("Image/inicio.jpg")),
              Button(label: 'LOGIN', press: () {
                Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => const LoginScreen())
                          );
              }),
              Button(label: 'SING UP', press: () {
                Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => const SingupScreen())
                          );
              }),
            ],
          ),
        ),
      )),
    );
  }
}
