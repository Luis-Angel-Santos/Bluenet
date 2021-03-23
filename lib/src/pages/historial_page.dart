import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class HistorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Entradas'),
        centerTitle: true,
      ),
      body: _entradas(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_return_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _entradas() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('entradas').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<DocumentSnapshot> docs = snapshot.data.docs;

          return Container(
              padding: EdgeInsets.all(15),
              child: ListView.builder(
                itemCount: docs.length,
                itemBuilder: (_, i) {
                  Map<String, dynamic> data = docs[i].data();
                  //convirtiento la fecha a tipo datetime
                  DateTime timestamp = data['hora_entrada'].toDate();
                  //dando formato a la fecha para que se vea bonito xD
                  DateFormat dateFormat = DateFormat("dd/MM/yy HH:mm");
                  String hora = dateFormat.format(timestamp);

                  //creacion de Cards con los datos de la BD
                  return Card(
                    elevation: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            Text('Usuario', style: TextStyle(fontSize: 15)),
                            SizedBox(height: 20),
                            Text(data['usuario']),
                            SizedBox(height: 10)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('Clave', style: TextStyle(fontSize: 15)),
                            SizedBox(height: 20),
                            Text(data['clave']),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('Entrada', style: TextStyle(fontSize: 15)),
                            SizedBox(height: 20),
                            Text(hora),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ));
        });
  }
}
