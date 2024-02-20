import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class BibliaPage extends StatelessWidget {
  final String pdfFilePath =
      'assets/biblia.pdf'; // Caminho para o arquivo PDF da Bíblia

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bíblia'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _openPdfViewer(context, pdfFilePath);
          },
          child: Text('Abrir Bíblia'),
        ),
      ),
    );
  }

  void _openPdfViewer(BuildContext context, String pdfFilePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(pdfFilePath: pdfFilePath),
      ),
    );
  }
}

class PdfViewerPage extends StatelessWidget {
  final String pdfFilePath;

  const PdfViewerPage({Key? key, required this.pdfFilePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualizador de PDF'),
      ),
      body: PDFView(
        filePath: pdfFilePath,
      ),
    );
  }
}
