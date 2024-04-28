import 'package:flutter/material.dart';

class MyappForm extends StatefulWidget {
  const MyappForm({Key? key}) : super(key: key);

  @override
  State<MyappForm> createState() => _MyappFormState();
}

class _MyappFormState extends State<MyappForm> {

  //variables definidas igualadas al texteditingcontroler que sirve para funcionar con el formulario
  final _formKey = GlobalKey<FormState>();
  final _nombreField = TextEditingController();
  final _emailField = TextEditingController();
  final _passField = TextEditingController();
  String? _CTValue;

  @override
  void dispose() {
    _nombreField.dispose();
    _emailField.dispose();
    _passField.dispose();
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

                //el DropdownButtonForm hace referencia al menu donde aparecen los centros tutoriales.
                DropdownButtonFormField<String>(
                  value: _CTValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      _CTValue = newValue!;
                    });
                  },
                  decoration:  InputDecoration(
                    labelText: 'Centro tutorial',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                    icon: Icon(Icons.location_on),
                  ),
                  items: <String>['', 'Mompox', 'Magangue', 'San juan ', 'Lorica', 'El carmen', 'Cerete']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value ?? '' ),
                    );
                  }).toList(),
                ),
                Divider(
                  height: 18.0,
                ),

                //este es el boton que permite el envio de la informacion registrada en los TextField
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      
                        showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text('Datos Registrados'),
                              content: Text(
                                'Usuario: ${_nombreField.text}\n'
                                'Correo: ${_emailField.text}\n'
                                'Contraseña: ${_passField.text}\n'
                                'Centro Tutorial: $_CTValue',
                              ),
                              actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      //limpiar los TextField despues de mostrar la informacion registrada previamente en ellos
                                      _nombreField.clear();
                                      _emailField.clear();
                                      _passField.clear();
                                      setState(() {
                                        _CTValue = null;
                                      });
                                    },
                                    child: Text('Cerrar'),
                                  ),
                              ],
                            );
                          }
                        );
                    }
                  },
                  child: const Text('submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
