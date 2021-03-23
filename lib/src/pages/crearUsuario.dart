import 'package:flutter/material.dart';
import 'package:proyecto/src/models/save.dart';

class CrearUsuario extends StatefulWidget {
  @override
  _CrearUsuarioState createState() => _CrearUsuarioState();
}

class _CrearUsuarioState extends State<CrearUsuario> {
  String name;

  String correo;

  String clave;

  String number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar un nuevo usuario'),
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
                    builder: (context) => AddUser(name, correo, clave, number)),
              );
            },
            child: Text(
              "Añadir Usuario",
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
          labelText: 'Nombre',
          helperText: 'Escriba el nombre del usuario',
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
          labelText: 'Correo',
          helperText: 'Escriba el correo del usuario',
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
          labelText: 'Clave',
          helperText: 'Escriba la clave con la que se accedera',
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
          labelText: 'Telefono',
          helperText: 'Escriba el telefono del usuario',
          suffixIcon: Icon(Icons.phone),
          icon: Icon(Icons.phone_android)),
      onChanged: (valor) {
        number = valor;
      },
    );
  }
}
