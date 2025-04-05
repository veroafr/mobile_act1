import 'package:flutter/material.dart';
import 'pag1.dart';

void main() {
  runApp(const App1());
}

class App1 extends StatelessWidget {
  const App1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Registro",
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
    );
  }
}
