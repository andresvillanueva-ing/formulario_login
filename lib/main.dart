import 'package:flutter/material.dart';
// import 'package:formulario_login/src/myApp.dart';
// import 'package:formulario_login/database/database_helper.dart';
import 'package:formulario_login/src/myappresgistro.dart';


// Documento inicial donde contiene la funcion (MyappForm()) que se mostrara en la pantalla. 

void main() async { 
  runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Login',
      home:  RegistroUsers(),
    );
  }
}