import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //regresaremos un scaffold
    return Scaffold(
        //definimos una appbar con un titulo al centro
        appBar: AppBar(
          title: Center(
            child: Text('Configuración'),
          ),
        ),
        //regresamos una listview con una padding y la informacion que mostraremos en nuestra pantalla
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _info(),
            SizedBox(height: 50.0),
            _perfil(),
            SizedBox(height: 30.0),
            _cambiarPin(),
            SizedBox(height: 30.0),
            _gestionUsuarios(context),
            SizedBox(height: 30.0),
            _historial(context),
          ],
        ),
        backgroundColor:
            Colors.blueAccent //definimos un color de fondo a nuestra pagina
        );
  }

  //creamos los widget que usaremos

  Widget _perfil() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Perfil'),
            leading: Icon(
              Icons.person,
              color: Colors.lightBlue,
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _cambiarPin() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Cambiar pin de entrada'),
            leading: Icon(
              Icons.admin_panel_settings,
              color: Colors.lightBlue,
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _historial(context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Registro de Entradas'),
            leading: Icon(
              Icons.history_rounded,
              color: Colors.lightBlue,
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pushNamed(context, 'historial');
            },
          ),
        ],
      ),
    );
  }

  Widget _gestionUsuarios(context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Gestionar usuarios'),
            leading: Icon(
              Icons.group,
              color: Colors.lightBlue,
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pushNamed(context, 'usuarios');
            },
          ),
        ],
      ),
    );
  }

  Widget _info() {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset('assets/logo.png', width: 150),
          Column(
            children: [
              Text(
                'Bluenet Security',
                style: TextStyle(fontSize: 30, color: Colors.lightBlue),
              ),
              Text(
                'Sientete Seguro a Distancia',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
