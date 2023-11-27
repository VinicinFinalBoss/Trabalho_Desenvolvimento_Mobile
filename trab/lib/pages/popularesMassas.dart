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
      home: const PopularesMassas(),
    );
  }
}

class PopularesMassas extends StatefulWidget {
  const PopularesMassas({super.key});

  @override
  State<PopularesMassas> createState() => _PopularesMassasState();
}

class _PopularesMassasState extends State<PopularesMassas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarFormat1('Massas'),
        body: ListView(children: [
          _itemProdutoBotao('Lasanha de Presunto', 'Lasanha de Presunto 500g',
              15.90, 'assets/images/lasanhaPresunto.png', 'Massas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Lasanha de Frango', 'Lasanha de Frango 500g',
              17.90, 'assets/images/lasanhaFrango.png', 'Massas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Lasanha de Calabresa', 'Lasanha de Calabresa 500g',
              17.90, 'assets/images/lasanhaCalabresa.png', 'Massas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Espaguete Bolonhesa', 'Espaguete à bolonhesa',
              15.90, 'assets/images/Espaguete.png', 'Massas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Espaguete Camarão', 'Espaguete de Camarão', 20.90,
              'assets/images/EspagueteCamarao.png', 'Massas'),
          SizedBox(
            height: 20,
          ),
          _itemProdutoBotao('Macarrão na Chapa', 'Macarrão na Chapa', 18.90,
              'assets/images/macarraoChapa.png', 'Massas'),
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
