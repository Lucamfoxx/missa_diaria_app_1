import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class ProverbiosPage extends StatefulWidget {
  final int proverbioNumber;

  ProverbiosPage({required this.proverbioNumber});

  @override
  _ProverbiosPageState createState() => _ProverbiosPageState();
}

class _ProverbiosPageState extends State<ProverbiosPage> {
  late Future<String> _futureProverbio;
  double _fontSize = 18.0;
  late int _currentProverbioNumber;

  @override
  void initState() {
    super.initState();
    _currentProverbioNumber = widget.proverbioNumber;
    _futureProverbio = _carregarProverbio(widget.proverbioNumber);
  }

  Future<String> _carregarProverbio(int proverbioNumber) async {
    return await rootBundle.loadString('assets/proverbio_$proverbioNumber.txt');
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

  void _proxProverbio() {
    setState(() {
      _currentProverbioNumber = (_currentProverbioNumber % 31) + 1;
      _futureProverbio = _carregarProverbio(_currentProverbioNumber);
    });
  }

  void _proverbioAnterior() {
    setState(() {
      _currentProverbioNumber = (_currentProverbioNumber - 2) % 31 + 1;
      _futureProverbio = _carregarProverbio(_currentProverbioNumber);
    });
  }

  void _selecionarProverbio(int numeroProverbio) {
    setState(() {
      _currentProverbioNumber = numeroProverbio;
      _futureProverbio = _carregarProverbio(numeroProverbio);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provérbio $_currentProverbioNumber'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder(
                future: _futureProverbio,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Erro ao carregar o provérbio.'),
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
              onPressed: _proverbioAnterior,
              backgroundColor: Color.fromARGB(0, 117, 108, 108),
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
                  onPressed: _proxProverbio,
                  backgroundColor: Color.fromARGB(0, 0, 0, 0),
                  elevation: 0, // Remover sombra
                  child: Icon(Icons.arrow_forward, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 1; i <= 31; i++)
                IconButton(
                  onPressed: () {
                    _selecionarProverbio(i);
                  },
                  icon: Text(
                    i.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
