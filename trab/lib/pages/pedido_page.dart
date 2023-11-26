import 'package:flutter/material.dart';
import 'package:trab/pages/fila.dart';

class PedidoPage extends StatefulWidget {
  final String titulo;
  final String conteudo;
  final double valor;
  final String pathImagem;

  PedidoPage(
      {required this.titulo,
      required this.conteudo,
      required this.valor,
      required this.pathImagem,
      Key? key})
      : super(key: key);

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  int confirmarPedido = 0;
  int quantidade = 1;
  double precoTotal = 0.0;

  @override
  Widget build(BuildContext context) {
    precoTotal = widget.valor * quantidade;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                width: 30,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: Icon(
                    Icons.keyboard_backspace_rounded,
                    color: Color.fromARGB(220, 200, 22, 29),
                  ),
                )),
            Container(
                width: 30,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Color.fromARGB(220, 200, 22, 29),
                  ),
                )),
          ]),
          backgroundColor: Color.fromARGB(220, 200, 22, 29),
          centerTitle: true,
        ),
        body: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                widget.titulo,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              Column(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 25),
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: const Offset(
                                    3,
                                    3,
                                  ),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                ), //BoxShadow
                                BoxShadow(
                                  color: Colors.white,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                              //border: Border.all(color: Colors.black),
                              //  color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(360))),
                        ),
                      ),
                      Center(
                          child: Column(
                        children: [
                          SizedBox(height: 20),
                          Image.asset(
                            widget.pathImagem,
                            width: 195,
                            height: 180,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(widget.conteudo,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 67, 93, 107),
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal)),
                        ],
                      )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        textStyle: TextStyle(fontSize: 15),
                        color: Color.fromARGB(220, 242, 125, 130),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          onTap: () {
                            setState(() {
                              if (quantidade > 1) quantidade--;
                              precoTotal = widget.valor * quantidade;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                                child: Text(
                              '-',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.start,
                            )),
                          ),
                        ),
                      ),
                      Text('$quantidade'),
                      Container(
                          width: 30,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                quantidade++;
                                precoTotal = widget.valor * quantidade;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(220, 242, 125, 130),
                                padding: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100)))),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Text('Preço',
                            style: TextStyle(
                                color: Color.fromARGB(255, 67, 93, 107),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal)),
                      ),
                      Text(
                        'R\$ ${precoTotal.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Container(
                    width: 140,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            confirmarPedido = 1;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FilaPage(
                                  confirmarPedido: confirmarPedido,
                                  pathImagem: widget.pathImagem,
                                ),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(220, 200, 22, 29),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/images/SacolaCompras.png'),
                            SizedBox(width: 2),
                            SizedBox(
                                width: 70,
                                child: Text(
                                  'Confirmar Pedido',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ))
                          ],
                        )),
                  )
                ],
              )
            ],
          ),
        )));
  }
}
