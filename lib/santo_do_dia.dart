import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class SantoDoDiaPage extends StatefulWidget {
  @override
  _SantoDoDiaPageState createState() => _SantoDoDiaPageState();
}

class _SantoDoDiaPageState extends State<SantoDoDiaPage> {
  double _fontSize = 16.0; // Tamanho inicial da fonte
  String _imagePath = '';

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    try {
      DateTime dataAtual = DateTime.now();
      String nomeArquivo = DateFormat('dd_MM').format(dataAtual);
      String nomeArquivoImagem = '$nomeArquivo' +
          '_imagem.jpg'; // Construindo o nome do arquivo de imagem
      String caminhoImagem =
          'assets/$nomeArquivoImagem'; // Alterando o caminho da imagem
      setState(() {
        _imagePath = caminhoImagem;
      });
    } catch (e) {
      print('Erro ao carregar imagem: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Santo do Dia'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarioPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: FutureBuilder<String>(
                    future: obterConteudoSantoDoDia(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text(
                          'Não foi possível carregar o Santo do dia de hoje.',
                          textAlign: TextAlign.center,
                        );
                      } else {
                        List<String> lines = snapshot.data!.split('\n');
                        String title = lines.isNotEmpty ? lines.first : '';
                        String content =
                            lines.length > 1 ? lines.sublist(1).join('\n') : '';

                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Exibição da imagem dentro do quadrado branco
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: _imagePath.isNotEmpty
                                    ? Image.asset(
                                        _imagePath,
                                        width: 300,
                                        height: 300,
                                      )
                                    : SizedBox(),
                              ),
                              SizedBox(height: 10),
                              Text(
                                title,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: _fontSize +
                                      8, // Tamanho maior para o título
                                  fontWeight:
                                      FontWeight.bold, // Negrito para o título
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                content,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: _fontSize),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            // Botão para aumentar fonte
            onPressed: () {
              setState(() {
                _fontSize += 2.0; // Aumentar o tamanho da fonte
              });
            },
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: Icon(Icons.zoom_in),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            // Botão para diminuir fonte
            onPressed: () {
              setState(() {
                _fontSize = (_fontSize - 2.0).clamp(10.0,
                    50.0); // Diminuir o tamanho da fonte, com limite mínimo de 10 e máximo de 50
              });
            },
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: Icon(Icons.zoom_out),
          ),
        ],
      ),
    );
  }

  Future<String> obterConteudoSantoDoDia() async {
    try {
      DateTime dataAtual = DateTime.now();
      String nomeArquivo = DateFormat('dd_MM').format(dataAtual);
      String caminhoArquivo = 'santo/$nomeArquivo.txt';
      String conteudo = await rootBundle
          .loadString(caminhoArquivo); // Carregar o conteúdo do arquivo
      return conteudo;
    } catch (e) {
      return 'Não foi possível encontrar o Santo do dia de hoje.';
    }
  }
}

class CalendarioPage extends StatefulWidget {
  @override
  _CalendarioPageState createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  DateTime? _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate!,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });

      String nomeArquivo = DateFormat('dd_MM').format(picked);
      String caminhoArquivo = 'santo/$nomeArquivo.txt';
      String conteudo = await rootBundle.loadString(caminhoArquivo);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ExibirSantoDoDiaPage(conteudo: conteudo)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendário'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Data Selecionada:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              DateFormat('dd/MM/yyyy').format(_selectedDate!),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Selecionar Data'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExibirSantoDoDiaPage extends StatefulWidget {
  final String conteudo;

  ExibirSantoDoDiaPage({required this.conteudo});

  @override
  _ExibirSantoDoDiaPageState createState() => _ExibirSantoDoDiaPageState();
}

class _ExibirSantoDoDiaPageState extends State<ExibirSantoDoDiaPage> {
  double _fontSize = 16.0;
  String _imagePath = ''; // Adicionando o caminho da imagem

  @override
  void initState() {
    super.initState();
    // Carregando a imagem ao iniciar a página
    _loadImage();
  }

  Future<void> _loadImage() async {
    try {
      DateTime dataAtual = DateTime.now();
      String nomeArquivo = DateFormat('dd_MM').format(dataAtual);
      String nomeArquivoImagem = '$nomeArquivo' +
          '_imagem.jpg'; // Construindo o nome do arquivo de imagem
      String caminhoImagem =
          'assets/$nomeArquivoImagem'; // Alterando o caminho da imagem
      setState(() {
        _imagePath = caminhoImagem;
      });
    } catch (e) {
      print('Erro ao carregar imagem: $e');
    }
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = (_fontSize - 2.0).clamp(10.0, 50.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> lines = widget.conteudo.split('\n');
    String title = lines.isNotEmpty ? lines.first : '';
    String content = lines.length > 1 ? lines.sublist(1).join('\n') : '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Santo do Dia'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 60, 0, 255).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Exibição da imagem
                    _imagePath.isNotEmpty
                        ? Image.asset(
                            _imagePath,
                            width: 300,
                            height: 300,
                          )
                        : SizedBox(),

                    SizedBox(height: 10),

                    // Título do santo do dia
                    Text(
                      title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: _fontSize + 8, // Tamanho maior para o título
                        fontWeight: FontWeight.bold, // Negrito para o título
                      ),
                    ),
                    SizedBox(height: 10),

                    // Conteúdo do santo do dia
                    Text(
                      content,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: _fontSize),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.zoom_in),
                  onPressed: _increaseFontSize,
                ),
                SizedBox(height: 10),
                IconButton(
                  icon: Icon(Icons.zoom_out),
                  onPressed: _decreaseFontSize,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
