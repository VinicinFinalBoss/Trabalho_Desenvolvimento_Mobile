import 'package:flutter/material.dart';

class FavoritosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: ListView(
        children: [
          _buildFavoritoItem('Pizza de Muçarela', 'assets/images/pizza.png'),
          _buildFavoritoItem('Coca Cola', 'assets/images/coca.png'),
          _buildFavoritoItem('Lasanha', 'assets/images/lasanha.png'),
          // Adicione mais itens de favoritos conforme necessário
        ],
      ),
    );
  }

  Widget _buildFavoritoItem(String nome, String imagePath) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(nome),
        onTap: () {
          // Implemente a lógica para lidar com o toque em um item de favorito
          // Por exemplo, você pode abrir uma página de detalhes ou realizar outra ação.
          print('Item de favorito selecionado: $nome');
        },
      ),
    );
  }
}
