import 'package:flutter/material.dart';

class PedidoPage extends StatefulWidget {
  const PedidoPage({super.key});

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  int quantidade = 1;
  double preco = 5;
  double precoTotal = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                height: 10,
              ),
              Text(
                'Hambúguer X-tudo',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 200,
                          height: 190,
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
                                  BorderRadius.all(Radius.circular(100))),
                        ),
                      ),
                      Center(
                          child: Column(
                        children: [
                          Text(
                              'Hambúguer especial com queijo, bacon, carne, cheddar, alface, cebola',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 67, 93, 107),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal)),
                          SizedBox(height: 20),
                          Image.asset(
                            'assets/images/hamburguer.png',
                            width: 120,
                            height: 120,
                          ),
                        ],
                      )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        textStyle: TextStyle(fontSize: 20),
                        color: Color.fromARGB(220, 242, 125, 130),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          onTap: () {
                            setState(() {
                              if (quantidade > 1) quantidade--;
                              precoTotal = preco * quantidade;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                                child: Text(
                              '-',
                            )),
                          ),
                        ),
                      ),
                      Text('$quantidade'),
                      Material(
                        textStyle: TextStyle(fontSize: 22),
                        color: Color.fromARGB(220, 242, 125, 130),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          onTap: () {
                            setState(() {
                              quantidade++;
                              precoTotal = preco * quantidade;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                                child: Text(
                              '+',
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
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
                        onPressed: () {},
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
