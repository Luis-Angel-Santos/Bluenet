import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Regresaremos un scaffold
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              'Bluenet Security'), //declaramos una appbar con el titulo centrado
        ),
      ),
      //Regresamos una ListView con un padding de 10 y 5
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: <Widget>[
          _cardInfo(), //regresamos la card con la informacion de la app
          SizedBox(height: 30.0), //dejamos un pequeño espacio entre cada card
          _cardHora(), //regresamos la card con la hora
          SizedBox(height: 50.0), //dejamos un pequeño espacio entre cada card
          _historial(context), //regresamos la card con el historial de entradas
          SizedBox(height: 20.0), //dejamos un pequeño espacio entre cada card
          _cambiarPin(context), //regresamos la card para poder cambiar el pin
        ],
      ),
      backgroundColor:
          Colors.blueAccent, //definimos el color de fondo de nuestra pantalla
    );
  }

  //Creamos el widget que se mostrara en cada Card

  Widget _cardInfo() {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Text('Bienvenido!!', style: TextStyle(fontSize: 30)),
                Text('user'),
              ],
            ),
            Container(
              child: Image.asset('assets/logo.png', width: 180),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: Colors.lightBlue[100],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardHora() {
    DateFormat dateFormat = DateFormat("HH:mm");
    String hora = dateFormat.format(DateTime.now());
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Text(hora,
                      style: TextStyle(fontSize: 90, color: Colors.blue)),
                  Text('Bluenet Security',
                      style: TextStyle(
                          fontSize: 30, color: Colors.lightBlueAccent)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _historial(context) {
    return Card(
      //color: Colors.greenAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Registro de Entradas', style: TextStyle(fontSize: 20)),
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

  Widget _cambiarPin(context) {
    return Card(
      //color: Colors.orangeAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title:
                Text('Cambiar pin de entrada', style: TextStyle(fontSize: 20)),
            leading: Icon(
              Icons.admin_panel_settings,
              color: Colors.lightBlue,
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pushNamed(context, 'changePin');
            },
          ),
        ],
      ),
    );
  }
}
