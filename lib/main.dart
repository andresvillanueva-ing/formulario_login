import 'package:flutter/material.dart';
import 'package:formulario_login/src/index.dart';


// Documento inicial donde contiene la funcion (index()) que se mostrara en la pantalla. 

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
      home:  index(),
    );
  }
}