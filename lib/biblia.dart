import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class BibliaPage extends StatefulWidget {
  const BibliaPage({Key? key}) : super(key: key);

  @override
  _BibliaPageState createState() => _BibliaPageState();
}

class _BibliaPageState extends State<BibliaPage> {
  bool _velhoTestamentoExpanded = false;
  bool _novoTestamentoExpanded = false;

  Map<String, int> limitesGrade = {
    'genesis': 50, 'Exodo': 40, 'levitico': 27, 'numeros': 36, 'deuteronomio': 34,
    'Josue': 24, 'Juizes': 21, 'Rute': 4, 'I_Samuel': 31, 'II_Samuel': 24, 'I_Reis': 22,
    'II_Reis': 25, 'I_Cronicas': 36, 'II_Cronicas': 36, 'Esdras': 10, 'Neemias': 13,
    'Ester': 16, 'Jo': 42, 'Salmos': 150, 'proverbio': 31, 'Eclesiastes': 12, 'Cantico_dos_Canticos': 8,
    'Isaias': 66, 'Jeremias': 52, 'Lamentacoes': 5, 'Ezequiel': 48, 'Daniel': 14, 'Oseias': 14,
    'Joel': 4, 'Amos': 9, 'Abdias': 1, 'jonas': 4, 'Miqueias': 7, 'Naum': 3, 'Habacuque': 3,
    'Sofonias': 3, 'Ageu': 1, 'Zacarias': 14, 'Malaquias': 3,'Apocalipse':22,
    'Atos_dos_Apostolos':28,
    'Colossenses':4,
    'Efesios':6,
    'Filemon':1,
    'Filipenses':4,
    'Hebreus':13,
    'III_Sao_Joao':1,
    'II_Corintios':13,
    'II_Sao_Joao':1,
    'II_Sao_Pedro':3,
    'II_Tessalonicenses':3,
    'II_Timoteo':4,
    'I_Corintios':16,
    'I_Sao_Joao':5,
    'I_Sao_Pedro':5,
    'I_Tessalonicenses':5,
    'I_Timoteo':6,
    'Romanos':16,
    'Sao_Joao':21,
    'Sao_Judas':1,
    'Sao_Lucas':24,
    'Sao_Marcos':16,
    'Sao_Tiago':5,
    'Sao_Mateus':28,
    'Tito':3,
  };

  Map<String, String> menuTitles = {
    'genesis': 'Gênesis', 'Exodo': 'Êxodo', 'levitico': 'Levítico', 'numeros': 'Números', 'deuteronomio': 'Deuteronômio',
    'Josue': 'Josué', 'Juizes': 'Juízes', 'Rute': 'Rute', 'I_Samuel': '1 Samuel', 'II_Samuel': '2 Samuel', 'I_Reis': '1 Reis',
    'II_Reis': '2 Reis', 'I_Cronicas': '1 Crônicas', 'II_Cronicas': '2 Crônicas', 'Esdras': 'Esdras', 'Neemias': 'Neemias',
    'Ester': 'Ester', 'Jo': 'Jó', 'Salmos': 'Salmos', 'proverbio': 'Provérbios', 'Eclesiastes': 'Eclesiastes', 'Cantico_dos_Canticos': 'Cântico dos Cânticos',
    'Isaias': 'Isaías', 'Jeremias': 'Jeremias', 'Lamentacoes': 'Lamentações', 'Ezequiel': 'Ezequiel', 'Daniel': 'Daniel', 'Oseias': 'Oséias',
    'Joel': 'Joel', 'Amos': 'Amós', 'abdias': 'Abdias', 'jonas': 'Jonas', 'Miqueias': 'Miquéias', 'Naum': 'Naum', 'Habacuque': 'Habacuque',
    'Sofonias': 'Sofonias', 'Ageu': 'Ageu', 'Zacarias': 'Zacarias', 'Malaquias': 'Malaquias',
  };

  Map<String, String> menunovo = {
    'Apocalipse': 'Apocalipse',
    'Atos_dos_Apostolos': 'Atos dos Apóstolos',
    'Colossenses': 'Colossenses',
    'Efesios': 'Efésios',
    'Filemon': 'Filemon',
    'Filipenses': 'Filipenses',
    'Hebreus': 'Hebreus',
    'III_Sao_Joao': 'III São João',
    'II_Coríntios': 'II Coríntios',
    'II_Sao_Joao': 'II São João',
    'II_Sao_Pedro': 'II São Pedro',
    'II_Tessalonicenses': 'II Tessalonicenses',
    'II_Timoteo': 'II Timóteo',
    'I_Corintios': 'I Coríntios',
    'I_Sao_Joao': 'I São João',
    'I_Sao_Pedro': 'I São Pedro',
    'I_Tessalonicenses': 'I Tessalonicenses',
    'I_Timoteo': 'I Timóteo',
    'Romanos': 'Romanos',
    'Sao_Joao': 'São João',
    'Sao_Judas': 'São Judas',
    'Sao_Lucas': 'São Lucas',
    'Sao_Marcos': 'São Marcos',
    'Sao_Tiago': 'São Tiago',
    'Sao_Mateus': 'São Mateus',
    'Tito': 'Tito',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bíblia'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _velhoTestamentoExpanded = !_velhoTestamentoExpanded;
                });
              },
              child: Text('Velho Testamento'),
            ),
            if (_velhoTestamentoExpanded)
              Column(
                children: limitesGrade.keys.map((livro) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(menuTitles[livro] ?? livro.replaceAll('_', ' ').capitalize()),
                      onTap: () {
                        _openBook(livro);
                      },
                    ),
                  );
                }).toList(),
              ),
            ElevatedButton( // Botão para o Novo Testamento
              onPressed: () {
                setState(() {
                  _novoTestamentoExpanded = !_novoTestamentoExpanded;
                });
              },
              child: Text('Novo Testamento'),
            ),
            if (_novoTestamentoExpanded)
              Column(
                children: menunovo.keys.map((livro) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(menunovo[livro] ?? livro.replaceAll('_', ' ').capitalize()),
                      onTap: () {
                        _openBook(livro);
                      },
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }

  void _openBook(String livro) {
    int limiteGrade = limitesGrade[livro] ?? 1;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: limiteGrade,
              itemBuilder: (BuildContext context, int index) {
                int grade = index + 1;
                return GestureDetector(
                  onTap: () {
                    _openChapter(livro, grade);
                  },
                  child: Container(
                    color: Color.fromARGB(255, 207, 180, 101),
                    child: Center(
                      child: Text(
                        grade.toString(),
                        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _openChapter(String livro, int grade) async {
    String fileName = 'assets/biblia/Testamentos/${livro}_${grade}.txt';
    String content = await rootBundle.loadString(fileName);
    String livroCapitulo = "${menuTitles[livro] ?? livro.replaceAll('_', ' ').capitalize()} $grade";

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChapterPage(fileName: livroCapitulo, content: content),
      ),
    );
  }
}

class ChapterPage extends StatefulWidget {
  final String fileName;
  final String content;

  const ChapterPage({Key? key, required this.fileName, required this.content}) : super(key: key);

  @override
  _ChapterPageState createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  double _fontSize = 16.0;

  void _increaseFontSize() {
    setState(() {
      _fontSize += 1.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      if (_fontSize > 8.0) {
        _fontSize -= 1.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fileName),
        actions: [
          IconButton(
            icon: Icon(Icons.zoom_in),
            onPressed: _increaseFontSize,
          ),
          IconButton(
            icon: Icon(Icons.zoom_out),
            onPressed: _decreaseFontSize,
          ),
          IconButton(
            icon: Icon(Icons.comment),
            onPressed: () {
              // Implemente a funcionalidade de comentário aqui
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          widget.content,
          style: TextStyle(fontSize: _fontSize),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }
}

void main() {
  runApp(MaterialApp(
    home: BibliaPage(),
  ));
}
