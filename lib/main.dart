import 'package:flutter/material.dart';
import 'missa_diaria.dart';
import 'salmos.dart';
import 'biblia.dart';
import 'santo_do_dia.dart';
import 'oracoes.dart';
import 'paroquias.dart';
import 'proverbios.dart'; // Importação de proverbios.dart
import 'salmo_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paróquia São José',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 58, 140),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder(
              future: precacheImage(AssetImage('assets/logo.png'), context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return MissaDiariaApp();
                } else {
                  return Container(); // You can return a loading indicator here if needed
                }
              },
            ),
        '/missa_diaria': (context) => MissaDiariaPage(),
        '/salmos': (context) => SalmosPage(),
        '/biblia': (context) => BibliaPage(),
        '/santo_do_dia': (context) => SantoDoDiaPage(),
        '/oracoes': (context) => OracoesPage(),
        '/paroquias': (context) => ParoquiasPage(),
        '/proverbios': (context) => ProverbiosPage(proverbioNumber: 1),
        '/salmo_layout': (context) => SalmoPage(salmoNumber: 1),
        for (int i = 1; i <= 150; i++)
          '/salmo_$i': (context) => SalmoPage(salmoNumber: i),
      },
    );
  }
}

class MissaDiariaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paróquia São José'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    'assets/logo.png'), // Adicionando a imagem no corpo do aplicativo
                SizedBox(height: 20), // Espaçamento entre a imagem e os botões
                MenuButton('Liturgia Diária', '/missa_diaria'),
                MenuButton('Salmos', '/salmos'),
                MenuButton('Bíblia', '/biblia'),
                MenuButton('Santo do Dia', '/santo_do_dia'),
                MenuButton('Orações', '/oracoes'),
                MenuButton('Dioceses', '/paroquias'),
                MenuButton(
                    'Provérbios', '/proverbios'), // Botão para Provérbios
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
