import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:path_provider/path_provider.dart';

class MissaDiariaPage extends StatefulWidget {
  @override
  _MissaDiariaPageState createState() => _MissaDiariaPageState();
}

class _MissaDiariaPageState extends State<MissaDiariaPage> {
  String _missaDiariaContent = 'Carregando...';
  double _fontSize = 16.0;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _fetchAndSaveMissaDiariaContent(_selectedDate);
  }

  Future<void> _fetchAndSaveMissaDiariaContent(DateTime date) async {
    final url =
        'https://www.vaticannews.va/pt/palavra-do-dia/${date.year}/${_formatTwoDigits(date.month)}/${_formatTwoDigits(date.day)}.html';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final document = parser.parse(response.body);
        final startSequence = 'Leitura do Dia';
        final endSequence = 'Palavras do Santo Padre';
        final content = _extractTextBetweenSequences(
            document.body, startSequence, endSequence);
        if (content != null) {
          setState(() {
            _missaDiariaContent = _processContent(content);
          });
          await _saveContentToFile(_missaDiariaContent);
        } else {
          setState(() {
            _missaDiariaContent = 'Conteúdo não encontrado.';
          });
        }
      } else {
        setState(() {
          _missaDiariaContent = 'Falha ao carregar o conteúdo.';
        });
      }
    } catch (e) {
      setState(() {
        _missaDiariaContent = 'Erro: $e';
      });
    }
  }

  Future<void> _saveContentToFile(String content) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final dirPath = '${directory.path}/assets';
      final dir = Directory(dirPath);
      if (!dir.existsSync()) {
        dir.createSync(recursive: true);
      }
      final file = File('$dirPath/liturgia_diaria.txt');
      await file.writeAsString(content);
    } catch (e) {
      print('Erro ao salvar o arquivo: $e');
    }
  }

  String? _extractTextBetweenSequences(
      dom.Element? body, String startSequence, String endSequence) {
    if (body == null) return null;
    final text = body.text;
    final startIndex = text.indexOf(startSequence);
    final endIndex = text.indexOf(endSequence, startIndex);
    if (startIndex != -1 && endIndex != -1) {
      return text.substring(startIndex + startSequence.length, endIndex);
    } else {
      return null;
    }
  }

  String _processContent(String content) {
    final List<String> separators = [
      'Primeira Leitura',
      'Segunda Leitura',
      'Evangelho do Dia'
    ];
    String processedContent = content;
    bool isFirst = true;
    separators.forEach((separator) {
      final index = processedContent.indexOf(separator);
      if (index != -1) {
        if (isFirst) {
          processedContent = processedContent.replaceAll(
              separator, '\u2022 \u200B${separator}\n');
          isFirst = false;
        } else {
          processedContent = processedContent.replaceAll(
              separator, '\n\n\u2022 \u200B${separator}\n');
        }
      }
    });

    processedContent = processedContent.split('.').join('.\n\n');

    final lines = processedContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].trim().isNotEmpty) {
        lines[i] = lines[i].trimLeft();
      }
    }
    processedContent = lines.join('\n');

    return processedContent;
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      if (_fontSize > 2.0) {
        _fontSize -= 2.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liturgia Diaria'),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () async {
              final selectedDate = await _selectDate(context);
              if (selectedDate != null) {
                setState(() {
                  _selectedDate = selectedDate;
                });
                await _fetchAndSaveMissaDiariaContent(_selectedDate);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _getCurrentDate(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    _missaDiariaContent,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: _fontSize,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _increaseFontSize,
            tooltip: 'Aumentar Fonte',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: _decreaseFontSize,
            tooltip: 'Diminuir Fonte',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  String _getCurrentDate() {
    return '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
  }

  String _formatTwoDigits(int value) {
    return value.toString().padLeft(2, '0');
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final currentDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(currentDate.year, 1, 1),
      lastDate:
          DateTime(currentDate.year, currentDate.month, currentDate.day + 5),
    );
    return picked;
  }
}
