import 'package:flutter/material.dart';
import 'package:trab/pages/nav_bar.dart';

import '../validation.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _Login_pageState();
}

class _Login_pageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final Validation validar = Validation();

  final fieldNome = TextEditingController();

  final fieldSenha = TextEditingController();
  bool passwordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: Color.fromARGB(220, 209, 16, 22),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            color: Color.fromARGB(220, 209, 16, 22),
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'login',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                //   autofocus: true,controller: fieldNome,
                                controller: fieldNome,
                                validator: (nome) =>
                                    validar.campoNome(nome.toString()),
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: 'Digite seu usuário:',
                                  labelStyle: TextStyle(color: Colors.black),
                                  hintText: 'Digite seu usuário: ',
                                  errorStyle: TextStyle(color: Colors.white),
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(220, 102, 124, 138),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TextFormField(
                                validator: (senha) =>
                                    validar.campoSenha(senha.toString()),
                                keyboardType: TextInputType.number,
                                obscureText: passwordObscured,
                                controller: fieldSenha,
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (value) {
                                  _onSubmit(context);
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: 'Digite sua senha:',
                                  labelStyle: TextStyle(color: Colors.black),
                                  hintText: 'Digite sua senha: ',
                                  errorStyle: TextStyle(color: Colors.white),
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(220, 102, 124, 138)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                      borderRadius: BorderRadius.circular(20)),
                                  suffixIcon: IconButton(
                                    icon: Icon(passwordObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() =>
                                          passwordObscured = !passwordObscured);
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                child: Text(
                                  'Entrar',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  fixedSize: Size(120, 50),
                                  backgroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  _onSubmit(context);
                                },
                              ),
                            ],
                          ),
                        )))
              ],
            )));
  }

  void _onSubmit(inContext) {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NavBar(),
          ));
    } else {
      showDialog(
        context: inContext,
        barrierDismissible: false,
        builder: (inContext) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text('Usúario ou senha incorretos',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black)),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(inContext);
                  },
                  child: Center(child: Text('OK')),
                ),
              ],
            ),
          );
        },
      );
    }
    _formKey.currentState!.save();
    // Limpa os campos do formulário
    clearFields();
  }

  void clearFields() {
    fieldNome.clear();
    fieldSenha.clear();
  }
}
