import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/src/pages/editarUsuario.dart';

class UsuariosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de usuarios'),
        centerTitle: true,
      ),
      body: _usuarios(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text('Agregar Usuario'),
          SizedBox(width: 10),
          FloatingActionButton(
            child: Icon(
              Icons.person_add_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'crearUsuario');
            },
          ),
        ],
      ),
    );
  }

  Widget _usuarios() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('usuarios').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<DocumentSnapshot> docs = snapshot.data.docs;

          return Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: docs.length,
                itemBuilder: (_, i) {
                  Map<String, dynamic> data = docs[i].data();
                  String nombre = data['nombre'];
                  String correo = data['correo'];
                  String clave = data['clave'];
                  String telefono = data['telefono'];
                  print(docs[i].id);
                  return Card(
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(nombre),
                            Text(correo),
                          ],
                        ),
                        FlatButton(
                          child: Text('Editar',
                              style: TextStyle(color: Colors.blueAccent)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditarUsuario(nombre,
                                      correo, clave, telefono, docs[i].id)),
                            );
                          },
                        ),
                        FlatButton(
                          child: Text('Eliminar',
                              style: TextStyle(color: Colors.red)),
                          onPressed: () {
                            CollectionReference users = FirebaseFirestore
                                .instance
                                .collection('usuarios');

                            return users
                                .doc(docs[i].id)
                                .delete()
                                .then((value) => print("Usuario Eliminado"))
                                .catchError((error) => print(
                                    "Fallo al borrar usuario, error: $error"));
                          },
                        ),
                      ],
                    ),
                  );
                },
              ));
        });
  }
}
