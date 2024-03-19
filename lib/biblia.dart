import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BibliaPage extends StatelessWidget {
  final String pdfFilePath = 'assets/biblia.pdf';

  const BibliaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bíblia'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PdfViewerPage(pdfFilePath: pdfFilePath),
              ),
            );
          },
          child: const Text('Abrir Bíblia'),
        ),
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
        title: const Text('Visualizador de PDF'),
      ),
      body: SfPdfViewer.asset(
        pdfFilePath,
        canShowPaginationDialog: true,
      ),
    );
  }
}
