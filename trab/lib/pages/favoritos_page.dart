import 'package:flutter/material.dart';
import 'package:trab/pages/home_page.dart';

import '../utils/appbarFormat.dart';

class FavoritosPage extends StatefulWidget {
  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class FavoritoItem {
  final String nome;
  final String preco;
  final String imagePath;

  FavoritoItem(this.nome, this.preco, this.imagePath);
}

class _FavoritosPageState extends State<FavoritosPage> {
  List<FavoritoItem> favoritos = [
    FavoritoItem('Pizza de Muçarela', 'Preço: 30', 'assets/images/pizza.png'),
    FavoritoItem('Coca Cola', 'Preço: 10', 'assets/images/coca2.png'),
    FavoritoItem('Lasanha', 'Preço: 20', 'assets/images/lasanhaPresunto.png'),
    // Adicione mais itens de favoritos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFormat1('Favoritos'),
      body: ListView.builder(
        itemCount: favoritos.length,
        itemBuilder: (context, index) {
          return _buildFavoritoItem(favoritos[index]);
        },
      ),
    );
  }

  Widget _buildFavoritoItem(FavoritoItem item) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(item.imagePath),
      ),
      title: Text(item.nome),
      subtitle: Text(item.preco),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove_circle_outline_outlined),
            onPressed: () {
              // Remover a linha quando o botão de remoção é pressionado
              setState(() {
                favoritos.remove(item);
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart_outlined),
            onPressed: () {
              // Adicione o código para navegar para pagina do carrinho
            },
          ),
        ],
      ),
    );
  }
}
