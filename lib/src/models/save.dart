import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  final String name;
  final String correo;
  final String clave;
  final String number;

  AddUser(this.name, this.correo, this.clave, this.number);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'nombre': name,
            'correo': correo,
            'clave': clave,
            'telefono': number
          })
          .then((value) => Navigator.of(context).pop())
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      body: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('¿Esta Seguro?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Agregar nuevo usuario'),
            Icon(Icons.person_add, size: 50)
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Aceptar'),
            onPressed: addUser,
          ),
          FlatButton(
            child: Text('Regresar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
