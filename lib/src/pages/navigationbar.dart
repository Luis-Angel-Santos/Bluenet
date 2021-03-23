import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:proyecto/src/pages/home_page.dart';
import 'package:proyecto/src/pages/options_page.dart';
import 'package:proyecto/src/pages/settings_page.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 1; //definimos la pagina por defecto en nuestra navbar

  //creamos/llamamos todas las paginas
  final HomePage _homePage = HomePage();
  final OptionsPage _optionsPage = OptionsPage();
  final SettingsPage _settingsPage = SettingsPage();

  //creamos una nueva pagina de HomePage
  Widget _showPage = new HomePage();

  //Creamos los casos que se usaran en la navegacion
  Widget _pageSelected(int page) {
    switch (page) {
      case 0:
        return _optionsPage;
        break;
      case 1:
        return _homePage;
        break;
      case 2:
        return _settingsPage;
        break;
      default:
        return _homePage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //regresamos un NavigationBar con estilo curvo
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        height: 60, //altura de 60px
        items: <Widget>[
          //definimos los iconos que tendra
          Icon(Icons.dehaze),
          Icon(Icons.home),
          Icon(Icons.build),
        ],
        //definimos colores de los iconos y la barra de navegacion
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(
            milliseconds: 500), //definimos un animacion de 500 milisegundos
        //definimos lo que hara al tocar cada opcion
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageSelected(tappedIndex);
          });
        },
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
