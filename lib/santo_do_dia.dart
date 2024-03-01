import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';

class SantoDoDiaPage extends StatefulWidget {
  @override
  _SantoDoDiaPageState createState() => _SantoDoDiaPageState();
}

class _SantoDoDiaPageState extends State<SantoDoDiaPage> {
  String _santoDoDiaText = 'Carregando...'; // Texto inicial
  Image? _santoDoDiaImage; // Imagem inicial

  @override
  void initState() {
    super.initState();
    _loadSantoDoDiaContent(DateTime.now());
  }

  Future<void> _loadSantoDoDiaContent(DateTime selectedDate) async {
    try {
      // Formate a data selecionada para obter o dia e o mês
      String formattedDate =
          "${selectedDate.day.toString().padLeft(2, '0')}_${selectedDate.month.toString().padLeft(2, '0')}";

      // Carregue o conteúdo do arquivo de texto correspondente à data selecionada
      String santoDoDiaText =
          await rootBundle.loadString('assets/$formattedDate.txt');

      // Verifique se o arquivo de imagem existe
      bool imageExists = await rootBundle
          .load('assets/$formattedDate.jpg')
          .then((value) => true)
          .catchError((error) => false);

      // Atualize o estado com o texto carregado
      setState(() {
        _santoDoDiaText = santoDoDiaText;
        if (imageExists) {
          // Se a imagem existir, carregue-a
          _santoDoDiaImage = Image.asset('assets/$formattedDate.jpg');
        } else {
          // Caso contrário, limpe a imagem
          _santoDoDiaImage = null;
        }
      });
    } catch (e) {
      // Em caso de erro ao carregar o arquivo, exiba uma mensagem de erro
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Santo do Dia'),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Envolve o conteúdo do Scaffold em um SingleChildScrollView
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Exibe a imagem dentro de uma área com moldura
                if (_santoDoDiaImage != null)
                  Container(
                    width: 180, // Largura da área da imagem
                    height: 180, // Altura da área da imagem
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(0, 0, 0, 0),
                          width: 2), // Moldura preta
                      borderRadius:
                          BorderRadius.circular(10), // Borda arredondada
                    ),
                    child: ClipRRect(
                      // ClipRRect para garantir que a imagem se encaixe na moldura
                      borderRadius: BorderRadius.circular(
                          8), // Borda arredondada para a imagem
                      child: _santoDoDiaImage,
                    ),
                  ),
                SizedBox(
                    height:
                        20), // Espaçamento entre a imagem e o botão de ajuste de tamanho

                // Texto do santo do dia
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      _santoDoDiaText,
                      textAlign: TextAlign.justify,
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
