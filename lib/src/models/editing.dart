import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/src/pages/usuarios_page.dart';

class EditarUser extends StatelessWidget {
  final String name;
  final String correo;
  final String clave;
  final String number;
  final String id;

  EditarUser(this.name, this.correo, this.clave, this.number, this.id);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');

    Future<void> updateUser() {
      return users
          .doc(id)
          .update({
            'nombre': name,
            'correo': correo,
            'clave': clave,
            'telefono': number
          })
          .then((value) => Navigator.of(context).pop())
          .catchError((error) => print("Failed to update user: $error"));
    }

    return Scaffold(
      body: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('¿Esta Seguro?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Editar este usuario'),
            Icon(Icons.edit, size: 50),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Aceptar'),
            onPressed: updateUser,
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
