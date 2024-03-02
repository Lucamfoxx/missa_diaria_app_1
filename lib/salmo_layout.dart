import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class SalmoPage extends StatefulWidget {
  final int salmoNumber;

  SalmoPage({required this.salmoNumber});

  @override
  _SalmoPageState createState() => _SalmoPageState();
}

class _SalmoPageState extends State<SalmoPage> {
  late Future<String> _futureSalmo;
  double _fontSize = 18.0;
  late int _currentSalmoNumber;

  @override
  void initState() {
    super.initState();
    _currentSalmoNumber = widget.salmoNumber;
    _futureSalmo = _carregarSalmo(widget.salmoNumber);
  }

  Future<String> _carregarSalmo(int salmoNumber) async {
    return await rootBundle.loadString('assets/salmo_$salmoNumber.txt');
  }

  void _aumentarFonte() {
    setState(() {
      _fontSize += 2.0;
    });
  }

  void _diminuirFonte() {
    setState(() {
      _fontSize = (_fontSize - 2.0).clamp(12.0, 48.0);
    });
  }

  void _proxSalmo() {
    setState(() {
      _currentSalmoNumber = (_currentSalmoNumber % 150) + 1;
      _futureSalmo = _carregarSalmo(_currentSalmoNumber);
    });
  }

  void _salmoAnterior() {
    setState(() {
      _currentSalmoNumber = (_currentSalmoNumber - 2) % 150 + 1;
      _futureSalmo = _carregarSalmo(_currentSalmoNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salmo $_currentSalmoNumber'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder(
                future: _futureSalmo,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Erro ao carregar o salmo.'),
                      );
                    } else {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.symmetric(vertical: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Text(
                          snapshot.data!,
                          style: TextStyle(fontSize: _fontSize),
                          textAlign: TextAlign.left,
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 31.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              key: ValueKey('anterior'), // Chave única para este botão
              onPressed: _salmoAnterior,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              elevation: 0, // Remover sombra
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  key: ValueKey('aumentar'), // Chave única para este botão
                  onPressed: _aumentarFonte,
                  backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                  elevation: 0, // Remover sombra
                  child: Icon(Icons.zoom_in,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton(
                  key: ValueKey('diminuir'), // Chave única para este botão
                  onPressed: _diminuirFonte,
                  backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                  elevation: 0, // Remover sombra
                  child: Icon(Icons.zoom_out,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton(
                  key: ValueKey('proximo'), // Chave única para este botão
                  onPressed: _proxSalmo,
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                  elevation: 0, // Remover sombra
                  child: Icon(Icons.arrow_forward, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
