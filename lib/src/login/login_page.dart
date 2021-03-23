import 'package:flutter/material.dart';
import 'package:proyecto/src/models/autenticacion.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {'email': '', 'password': ''};

  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Error'),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                  child: Text('Entendido'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    try {
      await Provider.of<Authentication>(context, listen: false)
          .logIn(_authData['email'], _authData['password']);
      Navigator.of(context).pushReplacementNamed('/');
    } catch (error) {
      var errorMessage = 'Fallo al ingresar, intente de nuevo';
      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          title: Text('Iniciar Sesión'),
          actions: <Widget>[
            FlatButton(
              child: Row(
                children: <Widget>[
                  Text('Registrarse  '),
                  Icon(Icons.person_add)
                ],
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('signup');
              },
            )
          ],
        ),*/

        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.blueAccent,
                Colors.white,
              ])),
            ),
            Center(
              child: Card(
                elevation: 30,
                margin: EdgeInsets.symmetric(horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  //height: 250,
                  // width: 350,
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/logo.png'),
                            width: 150,
                          ),
                          Text('Bluenet Security',
                              style: TextStyle(fontSize: 20)),
                          SizedBox(height: 10),
                          //email
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Correo Electronico'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Correo Invalido';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['email'] = value;
                            },
                          ),

                          //password
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Contraseña'),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty || value.length <= 5) {
                                return 'Contraseña Incorrecta';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RaisedButton(
                            child: Text('Iniciar Sesion'),
                            onPressed: () {
                              _submit();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Colors.blue,
                            textColor: Colors.white,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[Text('No tengo cuenta')],
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('signup');
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.lightBlueAccent);
  }
}
