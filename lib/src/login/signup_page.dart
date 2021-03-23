import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/autenticacion.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

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
          .signUp(_authData['email'], _authData['password']);
      Navigator.of(context).pushReplacementNamed('/');
    } catch (error) {
      var errorMessage = 'Hubo un error, intente de nuevo';
      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Registrarse'),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[Text('Ya tengo cuenta'), Icon(Icons.person)],
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('login');
            },
          )
        ],
      ),*/
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.white, Colors.blueAccent])),
          ),
          Center(
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                //height: 300,
                //width: 350,
                padding: EdgeInsets.all(16),
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
                          decoration:
                              InputDecoration(labelText: 'Correo Electronico'),
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
                          decoration: InputDecoration(labelText: 'Contraseña'),
                          obscureText: true,
                          controller: _passwordController,
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

                        //Confirm Password
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Confirmar Contraseña'),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty ||
                                value != _passwordController.text) {
                              return 'Contraseña Incorrecta';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RaisedButton(
                          child: Text('Registrarse'),
                          onPressed: () {
                            _submit();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                        TextButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Ya tengo cuenta'),
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('login');
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
    );
  }
}
