import 'package:flutter/material.dart';
import 'package:proyecto/src/login/login_page.dart';
import 'package:proyecto/src/login/signup_page.dart';
import 'package:proyecto/src/pages/crearUsuario.dart';
import 'package:proyecto/src/pages/editarUsuario.dart';
import 'package:proyecto/src/pages/historial_page.dart';
import 'package:proyecto/src/pages/home_page.dart';
import 'package:proyecto/src/pages/navigationbar.dart';
import 'package:proyecto/src/pages/options_page.dart';
import 'package:proyecto/src/pages/settings_page.dart';
import 'package:proyecto/src/pages/usuarios_page.dart';

//creamos un metodo para definir nuestras rutas con un nombre clave
Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'signup': (BuildContext context) => SignupPage(),
    '/': (BuildContext context) => BottomNavBar(),
    'home': (BuildContext context) => HomePage(),
    'options': (BuildContext context) => OptionsPage(),
    'settings': (BuildContext context) => SettingsPage(),
    'historial': (BuildContext context) => HistorialPage(),
    'usuarios': (BuildContext context) => UsuariosPage(),
    'crearUsuario': (BuildContext context) => CrearUsuario(),
  };
}
