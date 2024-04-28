import 'package:flutter/material.dart';

class RegistroUsers extends StatefulWidget {
  const RegistroUsers({super.key});

  @override
  State<RegistroUsers> createState() => _RegistroUsersState();
}

class _RegistroUsersState extends State<RegistroUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Text('HOLA MUNDO'),
      ),
    );
  }
}