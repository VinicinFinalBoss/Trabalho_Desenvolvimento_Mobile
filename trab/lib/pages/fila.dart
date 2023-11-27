import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trab/utils/appbarFormat.dart';

class FilaPage extends StatefulWidget {
  final int? confirmarPedido;
  final String? pathImagem;
  FilaPage({this.confirmarPedido, this.pathImagem, Key? key}) : super(key: key);
  @override
  _FilaPage createState() => _FilaPage();
}

class _FilaPage extends State<FilaPage> {
  List<Widget> filaPedidos = [];

  Widget pedido3() {
    if (widget.confirmarPedido == 1) {
      return _pedido(widget.pathImagem!, 'Bruna(EU)', 0);
    }
    return Container();
  }

  int contador = 125;
  int? horas;
  int? minutos;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Adiciona os pedidos iniciais
    filaPedidos.add(_pedido('assets/images/pizza.png', 'Geovane', 15));
    filaPedidos.add(_pedido('assets/images/pizza.png', 'Pedro', 10));
    filaPedidos.add(pedido3());

    if (widget.confirmarPedido != 0) {
      filaPedidos.add(pedido3());
    }

    // Inicia o timer
    startTimer();
  }

  void startTimer() {
    _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (contador > 0) {
          contador--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFormat1('Fila'),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: retornaLinhaContador(),
          ),
          filaPedidos[0],
          filaPedidos[1],
          filaPedidos[2]
        ],
      ),
    );
  }

  Row retornaLinhaContador() {
    Duration a = Duration(seconds: contador);
    int horas = a.inHours;
    int minutos = a.inMinutes % 60;
    int segundos = a.inSeconds % 60;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Tempo estimado:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        Card(
          elevation: 8.0, // Ajuste o valor conforme necessário
          margin: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                15.0), // Ajuste o valor conforme necessário
          ),
          child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                '${horas.toString().padLeft(2, '0')}:${minutos.toString().padLeft(2, '0')}:${segundos.toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              )),
        ),
      ],
    );
  }

  Container _botaocontainer(IconData icon) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 40,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(2),
          backgroundColor: Color.fromARGB(255, 228, 227, 227),
          elevation: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

Container _pedido(String caminhoImagem, String nome, int minutes) {
  DateTime now = DateTime.now().subtract(Duration(minutes: minutes));
  return Container(
    margin: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Colors.grey),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2.0),
          ),
          child: CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(caminhoImagem),
          ),
        ),
      ),
      title: Text(nome),
      trailing: Text(
        'Pedido às: ${now.hour}:${now.minute.toString().padLeft(2, '0')}',
        textAlign: TextAlign.right,
      ),
    ),
  );
}
