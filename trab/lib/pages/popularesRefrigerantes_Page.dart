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
      home: const PopularesRefrigerantes(),
    );
  }
}

class PopularesRefrigerantes extends StatefulWidget {
  const PopularesRefrigerantes({super.key});

  @override
  State<PopularesRefrigerantes> createState() => _PopularesRefrigerantesState();
}

class _PopularesRefrigerantesState extends State<PopularesRefrigerantes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarFormat1('Refrigerantes'),
        body: ListView(children: [
          _itemProdutoBotao('Coca Cola 2L', 'Coca Cola 2L', 11.00,
              'assets/images/coca2.png', 'Refrigerantes'),
          SizedBox(height: 20),
          _itemProdutoBotao('Fanta Laranja 2L', 'Fanta Laranja 2L', 8.00,
              'assets/images/fanta2.png', 'Refrigerantes'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Coca Cola Zero 2LL', 'Coca Cola Zero 2L', 11.00,
              'assets/images/cocaZero.png', 'Refrigerantes'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Fanta Uva 2L', 'Fanta Uva 2L', 8.00,
              'assets/images/fantaUva.png', 'Refrigerantes'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Guaraná Antárctica 2L', 'Guaraná Antárctica 2L',
              8.00, 'assets/images/guaranaAntartica.png', 'Refrigerantes'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Guarapan 2L', 'Guarapan 2L', 8.00,
              'assets/images/guarapan.png', 'Refrigerantes'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Mate Couro 2L', 'Mate Couro 2L', 8.00,
              'assets/images/mateCouro.png', 'Refrigerantes'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Pepsi 2L', 'Pepsi 2L', 8.00,
              'assets/images/pepsi.png', 'Refrigerantes'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Coca Cola 1L', 'Coca Cola 1L', 7.00,
              'assets/images/cocacola1L.png', 'Refrigerantes'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Guaraná Antárctica 1L', 'Guaraná Antárctica 1L',
              7.50, 'assets/images/guaranaAntartica1L.png', 'Refrigerantes'),
          SizedBox(
            height: 20,
          ),
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
                  width: 100,
                  height: 300,
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
                _generateText('R\$${valor.toStringAsFixed(2)}', 20,
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
