import 'package:flutter/material.dart';
import 'package:trab/pages/home_page.dart';

import '../utils/appbarFormat.dart';

class FavoritosPage extends StatefulWidget {
  final int? confirmarFavorito;
  final String? imagePath;
  final String? nome;
  final double? valor;
  
  FavoritosPage({this.confirmarFavorito, this.imagePath, this.nome, this.valor, Key? key}) : super(key: key);
  
  @override

  _FavoritosPage createState() => _FavoritosPage();
}

class _FavoritosPage extends State<FavoritosPage> {
  List<Widget> favoritos = [];

  Widget favoritos3() {
    if (widget.confirmarFavorito == 1) {
      return _favoritos(widget.imagePath!, widget.nome!, widget.valor!);
    }
    return Container(); // ou algum valor padrão
  }

  @override
  void initState() {
    super.initState();
      favoritos.add(_favoritos('assets/images/pizza.png', 'Pizza de Muçarela', 15.00));
      favoritos.add(_favoritos('assets/images/coca2.png', 'Coca Cola', 5.00 ));
      favoritos.add(_favoritos('assets/images/lasanhaPresunto.png', 'Lasanha', 20.00 ));
      favoritos.add(favoritos3());

    if (widget.confirmarFavorito != 0) {
      favoritos.add(favoritos3());
  }

}
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBarFormat1('Favoritos'),
        body: Column(
          children: [
            favoritos[0],
            favoritos[1],
            favoritos[2],
            favoritos[3],
          ],
        ),
      );
    }
     Container _favoritos(String imagePath, String nome, double valor) {
  return Container(
    margin: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Colors.grey),
    ),
    child: ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(nome),
      subtitle: Text('R\$${valor.toStringAsFixed(2)}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.add_shopping_cart_outlined),
            onPressed: () {
              Navigator.pop(context);
              // Adicione o código para navegar para a página do carrinho AQUIII
            },
          ),
        ],
      ),
    ),
  );
}
  }


 

