import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/src/models/autenticacion.dart';
import 'package:proyecto/src/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //regresaremos un MaterialApp
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Authentication(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner:
              false, //declaramos que no mostraremos el icono de debug
          initialRoute: 'login', //declaramos nuestra ruta inicial /
          routes:
              getApplicationRoutes(), //llamamos a nuestro metodo con las rutas
        ));
  }
}
