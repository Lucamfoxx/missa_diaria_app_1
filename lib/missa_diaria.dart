import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:path_provider/path_provider.dart';

class MissaDiariaPage extends StatefulWidget {
  const MissaDiariaPage({Key? key}) : super(key: key);

  @override
  _MissaDiariaPageState createState() => _MissaDiariaPageState();
}

class _MissaDiariaPageState extends State<MissaDiariaPage> {
  late String _missaDiariaContent;
  double _fontSize = 16.0;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _missaDiariaContent = 'Carregando...';
    _fetchAndSaveMissaDiariaContent(_selectedDate);
  }

  Future<void> _fetchAndSaveMissaDiariaContent(DateTime date) async {
    final url = _buildUrl(date);
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final document = parser.parse(response.body);
        final content = _extractTextBetweenSequences(
            document.body, 'Leitura do Dia', 'Palavras do Santo Padre');
        if (content != null) {
          setState(() {
            _missaDiariaContent = _processContent(content);
          });
          await _saveContentToFile(_missaDiariaContent);
        } else {
          _showError('Conteúdo não encontrado.');
        }
      } else {
        _showError('Falha ao carregar o conteúdo.');
      }
    } catch (e) {
      _showError('Erro: $e');
    }
  }

  void _showError(String message) {
    setState(() {
      _missaDiariaContent = message;
    });
  }

  String _buildUrl(DateTime date) {
    return 'https://www.vaticannews.va/pt/palavra-do-dia/${date.year}/${_formatTwoDigits(date.month)}/${_formatTwoDigits(date.day)}.html';
  }

  Future<void> _saveContentToFile(String content) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final dirPath = '${directory.path}/assets';
      final dir = Directory(dirPath);
      if (!dir.existsSync()) {
        dir.createSync(recursive: true);
        print('Diretório criado em: $dirPath');
      }
      final file = File('$dirPath/liturgia_diaria.txt');
      await file.writeAsString(content);
      print('Arquivo salvo em: ${file.path}');
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
    final separators = const ['Primeira Leitura', 'Segunda Leitura', 'Evangelho do Dia'];
    String processedContent = content.replaceAllMapped(
        RegExp(separators.join('|')), (match) => '\u2022 \u200B${match.group(0)}\n\n');
    processedContent = processedContent.split('.').join('.\n\n');
    return processedContent.trim();
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
        title: const Text('Liturgia Diaria'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
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
          IconButton(
            icon: const Icon(Icons.zoom_in),
            onPressed: _increaseFontSize,
          ),
          IconButton(
            icon: const Icon(Icons.zoom_out),
            onPressed: _decreaseFontSize,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
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
                    _selectedDate.toString(),
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
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
    );
  }

  String _formatTwoDigits(int value) {
    return value.toString().padLeft(2, '0');
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final currentDate = DateTime.now();
    return await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(currentDate.year, 1, 1),
      lastDate: DateTime(currentDate.year, currentDate.month, currentDate.day + 5),
    );
  }
}
