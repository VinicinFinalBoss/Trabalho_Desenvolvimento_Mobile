import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _listaTarefas = [
    {'descricao': 'primeira tarefa', 'ok': true},
    {'descricao': 'segunda tarefa', 'ok': false},
    {'descricao': 'terceira tarefa', 'ok': true},
  ];
  @override
  void initState() {
    super.initState();
    print(_listaTarefas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'ToDo',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: _listaTarefas.length,
            itemBuilder: (context, index) => CheckboxListTile(
                title: Text(_listaTarefas[index]['descricao']),
                secondary: CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                  child: Icon(Icons.check),
                ),
                value: _listaTarefas[index]['ok'],
                onChanged: (value) {}),
          ))
        ],
      ),
    );
  }
}
