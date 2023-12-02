import 'package:flutter/material.dart';
import 'package:trab/pages/pedido_page.dart';
import 'package:trab/pages/popularesMassas.dart';
import 'package:trab/pages/popularesPizza_page.dart';
import 'package:trab/pages/popularesRefrigerantes_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String categoriaSelecionada = 'Pizzas';
  bool clickBotao1 = true;
  bool clickBotao2 = false;
  bool clickBotao3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.red[200],
            ),
            _generateText(
                'Belo Horizonte, ', 18, Colors.black, FontWeight.bold),
            _generateText('MG', 18, Colors.white, FontWeight.normal),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(197, 23, 30, 1),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  _generateText(
                    'Olá',
                    40,
                    Colors.black,
                    FontWeight.normal,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  _generateText(
                      'Faça seu pedido', 30, Colors.grey, FontWeight.w800)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Procure pela sua comida favorita',
                      prefixIcon: Icon(Icons.search),
                      fillColor: Colors.black,
                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _generateBotaoCategoia(
                      clickBotao1,
                      () {
                        setState(() {
                          atualizaItens('Pizzas');
                          clickBotao1 = true;
                          clickBotao2 = false;
                          clickBotao3 = false;
                        });
                      },
                      Colors.white,
                      'assets/images/pizza.jpg',
                      'Pizzas',
                      Colors.black,
                      Colors.white,
                      Colors.black,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    _generateBotaoCategoia(
                      clickBotao2,
                      () {
                        setState(() {
                          atualizaItens('Refrigerantes');
                          clickBotao1 = false;
                          clickBotao2 = true;
                          clickBotao3 = false;
                        });
                      },
                      Colors.white,
                      'assets/images/refrigerantes.png',
                      'Refrigerantes',
                      Colors.black,
                      Colors.white,
                      Colors.black,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    _generateBotaoCategoia(
                      clickBotao3,
                      () {
                        setState(() {
                          atualizaItens('Massas');
                          clickBotao1 = false;
                          clickBotao2 = false;
                          clickBotao3 = true;
                        });
                      },
                      Colors.white,
                      'assets/images/lasanha.png',
                      'Massas',
                      Colors.black,
                      Colors.white,
                      Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  _generateText('Populares', 20, Colors.black, FontWeight.bold),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        if (clickBotao1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PopularesPizza(),
                              ));
                        } else if (clickBotao2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PopularesRefrigerantes(),
                              ));
                        } else if (clickBotao3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PopularesMassas(),
                              ));
                        }
                      },
                      child: _generateText(
                          'Ver todos >', 18, Colors.red[900]!, FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
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
              _itemProdutoBotao(
                  'Pizza de chocolate',
                  'Uma deliciosa pizza de Chocolate, adoçe a sua noite',
                  44.90,
                  'assets/images/pizzaChocolate.png',
                  'Pizzas'),
              _itemProdutoBotao('Coca Cola 2L', 'Coca Cola 2L', 11.00,
                  'assets/images/coca2.png', 'Refrigerantes'),
              _itemProdutoBotao('Fanta Laranja 2L', 'Fanta Laranja 2L', 7.90,
                  'assets/images/fanta2.png', 'Refrigerantes'),
              _itemProdutoBotao(
                  'Lasanha de Presunto',
                  'Lasanha de Presunto 500g',
                  15.90,
                  'assets/images/lasanhaPresunto.png',
                  'Massas'),
              _itemProdutoBotao('Lasanha de Frango', 'Lasanha de Frango 500g',
                  15.90, 'assets/images/lasanhaFrango.png', 'Massas')
            ],
          ),
        ],
      ),
    );
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

  ElevatedButton _generateBotaoCategoia(
    bool clickado,
    VoidCallback onPressed,
    Color corBotao,
    String pathImagem,
    String conteudo,
    Color corTitulo,
    Color corIcone,
    Color corBotaoIcone,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 15,
        backgroundColor: !clickado ? corBotao : Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      child: SizedBox(
        height: 200,
        width: 60,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                width: 60,
                height: 60,
                child: Center(
                  child: Image.asset(
                    pathImagem,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              Text(
                conteudo,
                style: TextStyle(
                  color: clickado ? Colors.white : corTitulo,
                  fontSize: 14,
                ),
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: !clickado ? corBotaoIcone : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: clickado ? Colors.red : corIcone,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemProdutoBotao(String titulo, String conteudo, double valor,
      String pathImagem, String categoria) {
    if (categoria != categoriaSelecionada) {
      return SizedBox
          .shrink(); // Retorna um widget vazio para itens de outras categorias
    }
    return ElevatedButton(
      onPressed: () {
        _navigateToPedidoPage(titulo, conteudo, valor, pathImagem);
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      child: Container(
        width: 400,
        height: 300,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.red[900],
              ),
              width: 400,
              height: 200,
              child: Center(
                child: Image.asset(
                  pathImagem,
                  width: 300,
                  height: 200,
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
              padding: EdgeInsets.all(0),
              child:
                  _generateText(conteudo, 15, Colors.grey, FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }

  void atualizaItens(String novaCategoria) {
    setState(() {
      categoriaSelecionada = novaCategoria;
    });
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
