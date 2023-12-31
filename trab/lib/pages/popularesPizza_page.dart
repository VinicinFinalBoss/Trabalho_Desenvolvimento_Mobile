import 'package:flutter/material.dart';
import 'package:trab/utils/appbarFormat.dart';

import 'pedido_page.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const PopularesPizza(),
    );
  }
}

class PopularesPizza extends StatefulWidget {
  const PopularesPizza({super.key});

  @override
  State<PopularesPizza> createState() => _PopularesPizzaState();
}

class _PopularesPizzaState extends State<PopularesPizza> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarFormat1('Pizzas'),
        body: ListView(children: [
          _itemProdutoBotao(
              'Pizza de chocolate',
              'Uma deliciosa pizza de Chocolate, adoce a sua noite',
              44.90,
              'assets/images/pizzaChocolate.png',
              'Pizzas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Pizza de Carne Seca', 'Carne seca, a melhor',
              55.90, 'assets/images/CarneSeca.png', 'Pizzas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao(
              'Pizza de muçarela',
              'experimente nossa maravilhosa pizza de muçarela ',
              42.90,
              'assets/images/pizzaCompleta.png',
              'Pizzas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Pizza Vegetariana', 'Fabulosa Vegetariana', 44.90,
              'assets/images/Vegetariana.png', 'Pizzas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Pizza Portuguesa', 'Saborosa pizza de portuguesa',
              44.90, 'assets/images/portuguesa.png', 'Pizzas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Pizza Siciliana', 'Maravilhosa Siciliana', 44.90,
              'assets/images/Siciliana.png', 'Pizzas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Pizza Quatro carnes', 'Quatro Carnes recheada',
              44.90, 'assets/images/QuatroCarnes.png', 'Pizzas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Bacon e Cheddar', 'Bacon e Cheddar, cremosa',
              55.90, 'assets/images/BaconECheddar.png', 'Pizzas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Frango Catupiry', 'Frango Catupiry, saborosa',
              55.90, 'assets/images/FrangoCatupiry.png', 'Pizzas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Pizza Napolitana', 'Especial', 55.90,
              'assets/images/Napolitana.png', 'Pizzas'),
        ]));
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

  Widget _itemProdutoBotao(String titulo, String conteudo, double valor,
      String pathImagem, String categoria) {
    return ElevatedButton(
      onPressed: () {
        _navigateToPedidoPage(titulo, conteudo, valor, pathImagem);
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(220, 209, 16, 22),
              ),
              width: 300,
              height: 180,
              child: Center(
                child: Image.asset(
                  pathImagem,
                  width: 250,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _generateText(titulo, 18, Colors.black, FontWeight.normal),
                SizedBox(
                  width: 50,
                ),
                _generateText('R\$${valor.toStringAsFixed(2)}', 18,
                    Colors.black, FontWeight.bold)
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(5),
              child:
                  _generateText(conteudo, 15, Colors.grey, FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToPedidoPage(
      String titulo, String conteudo, double valor, String pathImagem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PedidoPage(
          titulo: titulo,
          conteudo: conteudo,
          valor: valor,
          pathImagem: pathImagem,
        ),
      ),
    );
  }
}
