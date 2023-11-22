import 'dart:async';

import 'package:flutter/material.dart';

class FilaPage extends StatefulWidget {
  const FilaPage({Key? key}) : super(key: key);
  @override
  _FilaPage createState() => _FilaPage();
}

DateTime now = DateTime.now();

class _FilaPage extends State<FilaPage> {
  int contador = 125;
  int? horas;
  int? minutos;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _botaocontainer(Icons.arrow_back_ios_new_outlined),
            Text('Fila de Espera', style: TextStyle(color: Colors.black)),
            _botaocontainer(Icons.more_vert)
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: retornaLinhaContador(),
          ),
          _pedido('assets/images/pizza.png', 'Geovane'),
          _pedido('assets/images/pizza.png', 'Vinícius')
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

Container _pedido(
  String caminhoImagem,
  String nome,
) {
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
        'Pedido às: ${now.hour}:${now.minute}',
        textAlign: TextAlign.right,
      ),
    ),
  );
}
