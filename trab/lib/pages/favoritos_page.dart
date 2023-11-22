import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({Key? key}) : super(key: key);
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritosPage> {
  List<Widget> favorites = ['Item 1', 'Item 2', 'Item 3'];

  void toggleFavorite(String item) {
    setState(() {
      if (favorites.contains(item)) {
        favorites.remove(item);
      } else {
        favorites.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favorites[index]),
            trailing: IconButton(
              icon: favorites.contains(favorites[index])
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              onPressed: () => toggleFavorite(favorites[index]),
            ),
          );
        },
      ),
    );
  }
}
