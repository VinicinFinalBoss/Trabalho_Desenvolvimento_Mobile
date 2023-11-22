import 'package:flutter/material.dart';

import 'pages/favoritos_page.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          textTheme: TextTheme(bodyLarge: TextStyle(fontFamily: 'Poppins'))),
      home: FavoritosPage(),
    );
  }
}
