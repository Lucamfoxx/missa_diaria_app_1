import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class SantoDoDiaPage extends StatefulWidget {
  const SantoDoDiaPage({Key? key}) : super(key: key);

  @override
  _SantoDoDiaPageState createState() => _SantoDoDiaPageState();
}

class _SantoDoDiaPageState extends State<SantoDoDiaPage> {
  String _santoDoDiaText = 'Carregando...';
  Image? _santoDoDiaImage;
  double _fontSize = 16.0;

  @override
  void initState() {
    super.initState();
    _loadSantoDoDiaContent(DateTime.now());
  }

  Future<void> _loadSantoDoDiaContent(DateTime selectedDate) async {
    try {
      String formattedDate =
          "${selectedDate.day.toString().padLeft(2, '0')}_${selectedDate.month.toString().padLeft(2, '0')}";

      String santoDoDiaText =
          await rootBundle.loadString('assets/$formattedDate.txt');

      bool imageExists = await rootBundle
          .load('assets/$formattedDate.jpg')
          .then((value) => true)
          .catchError((error) => false);

      setState(() {
        _santoDoDiaText = santoDoDiaText;
        if (imageExists) {
          _santoDoDiaImage = Image.asset('assets/$formattedDate.jpg');
        } else {
          _santoDoDiaImage = null;
        }
      });
    } catch (e) {
      setState(() {
        _santoDoDiaText = 'Erro ao carregar o conteúdo.';
        _santoDoDiaImage = null;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      _loadSantoDoDiaContent(picked);
    }
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 1.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      if (_fontSize > 1.0) {
        _fontSize -= 1.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Santo do Dia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.zoom_in),
            onPressed: _increaseFontSize,
          ),
          IconButton(
            icon: const Icon(Icons.zoom_out),
            onPressed: _decreaseFontSize,
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_santoDoDiaImage != null)
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(0, 0, 0, 0), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: _santoDoDiaImage,
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      _santoDoDiaText,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: _fontSize),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
