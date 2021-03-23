import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child:
                Text('Opciones'), //definimos una appbar con el titulo centrado
          ),
        ),
        //creamos una listview que regresara todo el contenido de las cards
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            //Mostramos toda la informacion que usaremos
            _cardInfo(), //llamamos el cardInfo
            SizedBox(height: 50.0), //dejamos un espacio de 50 px
            _cardSiguenos(), //llamamos el cardSiguenos
            SizedBox(height: 30.0), //dejamos un espacio de 30 px
            _cardCalificanos(), //llamamos el cardCalificanos
            SizedBox(height: 30.0), //dejamos un espacio de 30 px
            _cardNosotros(context), //llamamos el cardNosotros
            SizedBox(height: 30.0), //dejamos un espacio de 30 px
            _cardCompartir(), //llamamos el cardCompartir
            SizedBox(height: 30.0), //dejamos un espacio de 30 px
          ],
        ),
        backgroundColor: Colors.blueAccent //definimos un fondo a la pagina
        );
  }

  //Creamos todos los widgets que usaremos

  Widget _cardSiguenos() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Siguenos'),
            leading: Icon(
              Icons.favorite_outlined,
              color: Colors.lightBlue,
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () => launch('https://www.youtube.com/watch?v=POKvYE1yVbY'),
          ),
        ],
      ),
    );
  }

  Widget _cardCalificanos() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Calificanos'),
            leading: Icon(
              Icons.check_circle_sharp,
              color: Colors.lightBlue,
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _cardNosotros(context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Nosotros'),
            leading: Icon(
              Icons.emoji_people_sharp,
              color: Colors.lightBlue,
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () => _mostrarAlerta(context),
          ),
        ],
      ),
    );
  }

  Widget _cardCompartir() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Compartir'),
            leading: Icon(
              Icons.share_outlined,
              color: Colors.lightBlue,
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _cardInfo() {
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

  _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('BlueNet Security',
                style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    'Bluenet Security esta desarrollado por el increible "Team Bandicoot", que esta conformado por Emanuel, Sherlin, Jonathan y Luis Angel. Pertenecientes a la Universidad Tecnologica de Tlaxcala.'),
                Image(
                  image: AssetImage('assets/logo_bluenet.png'),
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Listo'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
