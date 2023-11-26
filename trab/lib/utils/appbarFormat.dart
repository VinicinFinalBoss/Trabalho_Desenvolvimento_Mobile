import 'package:flutter/material.dart';

class AppBarFormat1 extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;

  AppBarFormat1(this.titulo);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titulo,
        style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal),
      ),
      backgroundColor: const Color.fromRGBO(197, 23, 30, 1),
      centerTitle: true,
    );
  }
}
