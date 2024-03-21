import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
class BibliaPage extends StatefulWidget {
  const BibliaPage({Key? key}) : super(key: key);

  @override
  _BibliaPageState createState() => _BibliaPageState();
}

class _BibliaPageState extends State<BibliaPage> {
  bool _velhoTestamentoExpanded = false;
  bool _novoTestamentoExpanded = false;

  Map<String, int> limitesGrade = {};
  Map<String, String> menuTitles = {};
  Map<String, int> limitesGradeNovo = {};
  Map<String, String> menuNovo = {};

  @override
  void initState() {
    super.initState();
    carregarDadosDosJSON();
  }

  Future<void> carregarDadosDosJSON() async {
    final limitesGradeJsonString =
        await rootBundle.loadString('assets/mapas/limites_grade.json');
    final menuTitlesJsonString =
        await rootBundle.loadString('assets/mapas/menu_titles.json');
    final limitesGradeNovoJsonString =
        await rootBundle.loadString('assets/mapas/limites_grade_novo.json');
    final menuNovoJsonString =
        await rootBundle.loadString('assets/mapas/menu_novo.json');

    setState(() {
      Map<String, dynamic> limitesGradeJson = json.decode(limitesGradeJsonString);
      limitesGrade = limitesGradeJson.map((key, value) => MapEntry(key, value as int));

      Map<String, dynamic> menuTitlesJson = json.decode(menuTitlesJsonString);
      menuTitles = menuTitlesJson.map((key, value) => MapEntry(key, value as String));

      Map<String, dynamic> limitesGradeNovoJson = json.decode(limitesGradeNovoJsonString);
      limitesGradeNovo = limitesGradeNovoJson.map((key, value) => MapEntry(key, value as int));

      Map<String, dynamic> menuNovoJson = json.decode(menuNovoJsonString);
      menuNovo = menuNovoJson.map((key, value) => MapEntry(key, value as String));
    });
  }

  void _saveComment(String livro, int grade, String comentario) async {
    Map<String, dynamic> commentMap = {
      "livro": livro,
      "grade": grade,
      "comentario": comentario,
    };

    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/comments.json');

    if (!await file.exists()) {
      await file.create();
      await file.writeAsString(json.encode([commentMap]));
    } else {
      List<dynamic> comments = json.decode(await file.readAsString());
      comments.add(commentMap);
      await file.writeAsString(json.encode(comments));
    }
  }

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
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 180, 101),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _velhoTestamentoExpanded = !_velhoTestamentoExpanded;
                    _novoTestamentoExpanded = false; // Fechar o Novo Testamento
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Velho Testamento',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            if (_velhoTestamentoExpanded)
              Column(
                children: limitesGrade.keys.map((livro) {
                  return _buildBookItem(livro, limitesGrade, menuTitles);
                }).toList(),
              ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 180, 101),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _novoTestamentoExpanded = !_novoTestamentoExpanded;
                    _velhoTestamentoExpanded = false; // Fechar o Velho Testamento
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Novo Testamento',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            if (_novoTestamentoExpanded)
              Column(
                children: limitesGradeNovo.keys.map((livro) {
                  return _buildBookItem(livro, limitesGradeNovo, menuNovo);
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookItem(String livro, Map<String, int> limites, Map<String, String> menu) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 250, 234),
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
        title: Text(menu[livro] ?? livro.replaceAll('_', ' ').capitalize()),
        onTap: () {
          _openBook(livro, limites, menu);
        },
      ),
    );
  }
  void _openBook(String livro, Map<String, int> limites, Map<String, String> menu) {
    int limiteGrade = limites[livro] ?? 1;
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
                mainAxisSpacing: 5.0, // aumentando o espaço entre os quadrados
                crossAxisSpacing: 5.0, // aumentando o espaço entre os quadrados
                childAspectRatio: 1, // alterando o aspect ratio para tornar os quadrados um pouco maiores
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
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold, // alterando o tamanho da fonte dos números
                        ),
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
        builder: (context) => ChapterPage(fileName: livroCapitulo, content: content, livro: livro, grade: grade),
      ),
    );
  }
}


class ChapterPage extends StatefulWidget {
  final String fileName;
  final String content;
  final String livro;
  final int grade;

  const ChapterPage({Key? key, required this.fileName, required this.content, required this.livro, required this.grade})
      : super(key: key);

  @override
  _ChapterPageState createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  double _fontSize = 16.0;
  List<dynamic> comments = [];

  @override
  void initState() {
    super.initState();
    loadComments();
  }

  Future<void> loadComments() async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/comments.json');

    if (await file.exists()) {
      List<dynamic> allComments = json.decode(await file.readAsString());
      setState(() {
        comments = allComments.where((comment) => comment['livro'] == widget.livro && comment['grade'] == widget.grade).toList();
      });
    }
  }

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

  void _saveComment(String comentario) async {
    if (comentario.isNotEmpty) {
      final Map<String, dynamic> commentMap = {
        "fileName": widget.fileName,
        "content": widget.content,
        "livro": widget.livro,
        "grade": widget.grade,
        "comentario": comentario,
      };

      _writeCommentToJson(commentMap);
    }
  }

  void _writeCommentToJson(Map<String, dynamic> commentMap) async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/comments.json');

    List<dynamic> allComments = [];

    if (await file.exists()) {
      allComments = json.decode(await file.readAsString());
    }

    allComments.add(commentMap);
    await file.writeAsString(json.encode(allComments));

    loadComments();
  }

  void _deleteComment(int index) async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/comments.json');

    List<dynamic> allComments = [];

    if (await file.exists()) {
      allComments = json.decode(await file.readAsString());
    }

    allComments.removeAt(index);
    await file.writeAsString(json.encode(allComments));

    loadComments();
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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String comentario = '';

                  return AlertDialog(
                    title: Text('Adicionar Comentário'),
                    content: TextField(
                      onChanged: (value) {
                        comentario = value;
                      },
                      decoration: InputDecoration(hintText: 'Digite seu comentário'),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Cancelar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Salvar'),
                        onPressed: () {
                          _saveComment(comentario);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                widget.content,
                style: TextStyle(fontSize: _fontSize),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Comentários:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (comments.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: comments.asMap().entries.map<Widget>((entry) {
                  int index = entry.key;
                  dynamic comment = entry.value;
                  return Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(comment['comentario']),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteComment(index);
                          },
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            if (comments.isEmpty)
              Text(
                'Nenhum comentário disponível.',
                style: TextStyle(fontSize: 16),
              ),
          ],
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