import 'package:flutter/material.dart';
import 'package:formulario_login/src/myappresgistro.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; 

class MyappForm extends StatefulWidget {
  const MyappForm({Key? key}) : super(key: key);

  @override
  State<MyappForm> createState() => _MyappFormState();
}

class _MyappFormState extends State<MyappForm> {

  //variables definidas igualadas al texteditingcontroler que sirve para funcionar con el formulario
  final _formKey = GlobalKey<FormState>();
  final _emailField = TextEditingController();
  final _passField = TextEditingController();
  late Database _database;
  
  @override
  void initState(){
    super.initState();
    //abrir conexion con la base de datos
    _openDatabase();
  }

   Future<void> _openDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'database.db');
    _database = await openDatabase(path);
  }

  @override
  void dispose() {
    _emailField.dispose();
    _passField.dispose();
    _database.close();
    super.dispose();
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
                  backgroundImage: AssetImage('Image/logo.png'),
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
                      return 'Por favor ingrese su correo';
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
                      return 'Por favor ingrese su contraseña';
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _login();
                    //    
                    }
                  },
                  child: const Text('INICIAR SESION'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegistroUsers())
                    );
                  },
                  child: const Text('REGISTRARSE'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async{
    String gmail = _emailField.text;
    String password = _passField.text;
    //
    List<Map<String, dynamic>> results = await _database.rawQuery(
      'SELECT * FROM users WHERE gmail = ? AND password = ?', 
      [gmail, password]
    );

    if(results.isNotEmpty){
      print('inicio de sesion exitoso');
      Navigator.push(
      context as BuildContext,
        MaterialPageRoute(builder: (context) => const RegistroUsers())
     );
    }else{
               AlertDialog(
                title: Text('Datos incorrectos.'),
              );
    }
  }
}
