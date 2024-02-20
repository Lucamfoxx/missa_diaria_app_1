import 'package:flutter/material.dart';
import 'missa_diaria.dart';
import 'salmos.dart';
import 'biblia.dart';
import 'santo_do_dia.dart'; // Importe a página do Santo do Dia
import 'oracoes.dart';
import 'paroquias.dart';
import 'salmo_layout.dart'; // Importe a página

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Missa Diária',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 58, 140), // Azul escuro
        primarySwatch: Colors.blue, // Cor principal
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MissaDiariaApp(),
        '/missa_diaria': (context) => MissaDiariaPage(),
        '/salmos': (context) => SalmosPage(),
        '/biblia': (context) => BibliaPage(),
        '/santo_do_dia': (context) =>
            SantoDoDiaPage(), // Rota para a página do Santo do Dia
        '/oracoes': (context) => OracoesPage(),
        '/paroquias': (context) => ParoquiasPage(),
        '/salmo_layout': (context) =>
            SalmoPage(salmoNumber: 1), // Utilize SalmoPage
        for (int i = 1; i <= 150; i++)
          '/salmo_$i': (context) => SalmoPage(salmoNumber: i)
      },
    );
  }
}

class MissaDiariaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Missa Diária'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Botões do menu
                MenuButton('Missa Diária', '/missa_diaria'),
                MenuButton('Salmos', '/salmos'),
                MenuButton('Bíblia', '/biblia'),
                MenuButton('Santo do Dia',
                    '/santo_do_dia'), // Botão para a página do Santo do Dia
                MenuButton('Orações', '/oracoes'),
                MenuButton('Paróquias', '/paroquias'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final String route;

  MenuButton(this.text, this.route);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
