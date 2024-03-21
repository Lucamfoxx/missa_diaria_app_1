import 'package:flutter/material.dart';

class HorariosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horários'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHorario(
                titulo: 'HORÁRIOS DA IGREJA',
                texto: 'Segunda a sexta: 7h e 18h\nSábado: 8h e 17h\nDomingo: 9h, 11h e 18h',
              ),
              SizedBox(height: 20),
              _buildHorario(
                titulo: 'Secretaria',
                texto: 'De terça a quinta:  9h às 12h e das 13h às 17h00\nSexta e sábado:  8h às 12h e das 13h às 17h',
              ),
              SizedBox(height: 20),
              _buildHorario(
                titulo: 'MISSAS',
                texto: 'Segunda: 7h30 e 15h\nTerça a sexta: 7h30, 10h, 12h e 15h\nSábado: 7h30, 10h e 15h\nDomingo: 7h30, 9h (Igreja das Chagas), 10h e 12h',
              ),
              SizedBox(height: 20),
              _buildHorario(
                titulo: 'CONFISSÕES',
                texto: 'Segunda a sexta-feira: 9h às 11h e das 14h às 16h\nSábado: das 9h às 11h30\nDomingo: 9h às 11h',
              ),
              SizedBox(height: 20),
              _buildHorario(
                titulo: '',
                texto: 'Todo primeiro sábado do mês: Celebração Penitencial, às 9h\nToda terça-feira: missas em louvor a Santo Antônio com benção dos pães.\nToda quarta-feira: missas com benção da saúde.\nTodo dia 25: missa de Santo Frei Galvão com bênção da saúde e distribuição das pílulas às 10h.',
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildHorario({required String titulo, required String texto}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black87),
                children: _richTextChildren(texto),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TextSpan> _richTextChildren(String texto) {
    final List<TextSpan> children = [];
    final List<String> lines = texto.split('\n');
    
    for (String line in lines) {
      final List<String> splitLine = line.split(':');
      final String firstPart = splitLine[0];
      final String secondPart = splitLine.length > 1 ? splitLine.sublist(1).join(':') : '';

      // Adiciona as partes do texto
      children.add(TextSpan(text: firstPart, style: TextStyle(fontWeight: FontWeight.bold)));
      if (secondPart.isNotEmpty) {
        children.add(TextSpan(text: ':$secondPart'));
      }
      
      // Adiciona quebra de linha entre as linhas
      children.add(TextSpan(text: '\n'));
    }

    return children;
  }
}
