import 'package:flutter/material.dart';
import 'package:trab/pages/login_page.dart';

import 'package:trab/pages/nav_bar.dart';

main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          textTheme: TextTheme(bodyLarge: TextStyle(fontFamily: 'Poppins'))),
      home: LoginPage(),
    );
  }
}
