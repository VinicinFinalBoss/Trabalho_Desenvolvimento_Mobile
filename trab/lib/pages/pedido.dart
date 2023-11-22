import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Container'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
        ),
        body: Form(
            child: Container(
          padding: EdgeInsets.all(20),
          color: Color.fromARGB(220, 200, 22, 29),
          child: Column(
            children: [
              Text(
                'Hot Pizza',
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(220, 248, 198, 200)),
              ),
              Row(
                children: [
                  Text(
                    'login',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Digite seu usuário:',
                  hintText: 'Digite seu usuário: ',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Digite sua senha:',
                  hintText: 'Digite sua senha: ',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: Colors.black)),
                onPressed: () {},
              ),
            ],
          ),
        )));
  }
}
