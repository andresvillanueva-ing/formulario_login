import 'package:flutter/material.dart';
import 'package:formulario_login/database/user_dao.dart';
import 'package:formulario_login/src/user_model.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}


class _SingupScreenState extends State<SingupScreen> {

  //variables definidas igualadas al texteditingcontroler que sirve para funcionar con el formulario
  final _formKey = GlobalKey<FormState>();
  final _nombreField = TextEditingController();
  final _emailField = TextEditingController();
  final _passField = TextEditingController();
  //database
  List<UserModel> users = [];
  final dao = UserDao();
  
  @override
  void dispose() {
    _nombreField.dispose();
    _emailField.dispose();
    _passField.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    dao.readAll().then((value){
      setState(() {
        users = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //desde aqui empieza el FORM
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                //logo que aparece en la pantalla 
                CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('Image/logouni.png'),
                ),

                //texto que aparece en pantalla debajo del logo
                Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'cursive',
                    fontSize: 50.0,
                  ),
                ),
                SizedBox(
                  width: 160.0,
                  height: 15.0,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),

                //desde aqui empiezan los elementos para recopilar los datos 
                //textField del nombre de usuario. 
                TextFormField(
                  controller: _nombreField,
                  decoration:  InputDecoration(
                    labelText: 'User name',
                    suffixIcon: Icon(Icons.verified_user),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  ),
                  //funcion para validar que el campo del nombre usuario se encuentre lleno
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su nombre';
                    }
                    return null;
                  },
                ),
                Divider(
                  height: 18.0,
                ),

                //TextField del correo electronico 
                TextFormField(
                  controller: _emailField,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    suffixIcon: Icon(Icons.alternate_email),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  ),
                  //funcion para verificar que el campo del correo se encuentre lleno 
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un correo';
                    }
                    return null;
                  },
                ),
                Divider(
                  height: 18.0,
                ),

                //TextField de la contraseña
                TextFormField(
                  controller: _passField,
                  decoration:  InputDecoration(
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  ),
                  //funcion para validar que el campo de la contraseña este lleno.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor una contraseña';
                    }
                    return null;
                  },
                ),
                Divider(
                  height: 18.0,
                ),

                Divider(
                  height: 18.0,
                ),

                //este es el boton que permite el envio de la informacion registrada en los TextField
                ElevatedButton(
                  onPressed: () async{
                    if (_formKey.currentState!.validate()) {
                      final nombre = _nombreField.text;
                      final gmail = _emailField.text;
                      final password = _passField.text;
                      UserModel user = UserModel(nombre: nombre, gmail: gmail, password: password);
                      final id = await dao.insert(user);
                      user = user.copyWith(id: id);
                      _nombreField.clear();
                      _emailField.clear();
                      _passField.clear();
                      setState(() {
                      users.add(user);
                    });
                    }
                  },
                  child: const Text('REGISTRAR USUARIO'),
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}