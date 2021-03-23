import 'package:flutter/material.dart';
import 'package:proyecto/src/models/editing.dart';

class EditarUsuario extends StatelessWidget {
  EditarUsuario(this.name, this.correo, this.clave, this.number, this.id);

  String name;
  String correo;
  String clave;
  String number;
  String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar usuario'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          _nombre(),
          Divider(),
          _correo(),
          Divider(),
          _clave(),
          Divider(),
          _telefono(),
          Divider(),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EditarUser(name, correo, clave, number, id)),
              );
            },
            child: Text(
              "Editar Usuario",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            splashColor: Colors.blueAccent,
            color: Colors.lightBlue,
          )
        ],
      ),
    );
  }

  Widget _nombre() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Usuario',
          labelText: name,
          helperText: 'Escriba el nuevo nombre del usuario',
          suffixIcon: Icon(Icons.person_add_alt_1),
          icon: Icon(Icons.person)),
      onChanged: (valor) {
        name = valor;
      },
    );
  }

  Widget _correo() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Correo',
          labelText: correo,
          helperText: 'Escriba el correo nuevo del usuario',
          suffixIcon: Icon(Icons.alternate_email_sharp),
          icon: Icon(Icons.email)),
      onChanged: (valor) {
        correo = valor;
      },
    );
  }

  Widget _clave() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Clave',
          labelText: clave,
          helperText: 'Escriba la clave nueva con la que se accedera',
          suffixIcon: Icon(Icons.security),
          icon: Icon(Icons.lock)),
      onChanged: (valor) {
        clave = valor;
      },
    );
  }

  Widget _telefono() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Telefono',
          labelText: number,
          helperText: 'Escriba el telefono nuevo del usuario',
          suffixIcon: Icon(Icons.phone),
          icon: Icon(Icons.phone_android)),
      onChanged: (valor) {
        number = valor;
      },
    );
  }
}
