import 'package:flutter/material.dart';
import 'package:trab/pages/fila.dart';
import 'package:trab/pages/home_page.dart';
import 'package:trab/pages/mainPerfil.dart';
import 'package:trab/pages/pedido_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<NavBar> {
  bool clickBotao1 = false;
  bool clickBotao2 = false;
  bool clickBotao3 = false;
  int _indicePagina = 0;
  final List<Widget> _pages = [
    HomePage(),
    CadastroPage(),
    // FavoritosPage(),

    PedidoPage(),
    FilaPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: 'Favoritos'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_rounded,
                  size: 30,
                ),
                label: 'Perfil'),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz_sharp), label: 'fila')
          ],
          currentIndex: 0,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(color: Colors.red),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          elevation: 100,
          onTap: (indice) {
            setState(() {
              _indicePagina = indice;
            });
          },
        ),
        body: Container(
          child: _pages.elementAt(_indicePagina),
        ));
  }

  Text _generateText(
      String txt, double fontsize, Color color, FontWeight weight) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: fontsize,
        color: color,
        fontWeight: weight,
        fontFamily: 'Poppins',
      ),
    );
  }
}
