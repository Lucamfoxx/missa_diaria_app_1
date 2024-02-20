import 'package:flutter/material.dart';

class ParoquiasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paróquias'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ParoquiaSetorTile(
                setor: 'Setor Casa Verde',
                paroquias: [
                  'Paróquia Nossa Senhora das Dores',
                  'Paróquia Nossa Senhora das Graças',
                  'Paróquia Rainha Santa Isabel',
                  'Paróquia Santíssima Trindade',
                  'Paróquia Santo Antônio',
                  'Paróquia São João Evangelista',
                  'Paróquia São Luiz Gonzaga',
                  'Paróquia São Miguel Arcanjo',
                ],
              ),
              Divider(),
              ParoquiaSetorTile(
                setor: 'Setor Imirim',
                paroquias: [
                  'Paróquia Nossa Senhora da Consolata',
                  'Paróquia Nossa Senhora de Fátima',
                  'Paróquia Santo Antônio do Lausanne',
                  'Paróquia São Francisco de Paula e São Benedito',
                  'Paróquia São José Operário',
                  'Paróquia São Roque',
                ],
              ),
              Divider(),
              ParoquiaSetorTile(
                setor: 'Setor Jaçanã',
                paroquias: [
                  'Paróquia Natividade do Senhor',
                  'Paróquia Nossa Senhora da Piedade',
                  'Paróquia Nossa Senhora do Carmo',
                  'Paróquia Santa Dulce dos Pobres',
                  'Paróquia Santo Antônio',
                  'Paróquia São Benedito',
                  'Paróquia São Gabriel da Virgem Dolorosa',
                  'Paróquia São José Operário',
                  'Paróquia São Luiz Gonzaga',
                ],
              ),
              Divider(),
              ParoquiaSetorTile(
                setor: 'Setor Mandaqui',
                paroquias: [
                  'Paróquia Nossa Senhora Aparecida e São Matias',
                  'Paróquia Nossa Senhora da Penha',
                  'Paróquia Nossa Senhora de Fátima (Setor Mandaqui)',
                  'Paróquia Sagrada Família',
                  'Paróquia Santa Cruz',
                  'Paróquia Santa Inês',
                  'Paróquia Santo Antônio',
                  'Paróquia São José',
                  'Paróquia São Marcos Evangelista',
                ],
              ),
              Divider(),
              ParoquiaSetorTile(
                setor: 'Setor Medeiros',
                paroquias: [
                  'Paróquia Nossa Senhora Aparecida',
                  'Paróquia Nossa Senhora da Livração',
                  'Paróquia Nossa Senhora de Fátima ( SETOR MEDEIROS )',
                  'Paróquia Nossa Senhora de Loreto',
                  'Paróquia Santa Zita e Nossa Senhora do Caminho',
                  'Paróquia Santo Antônio de Lisboa',
                  'Paróquia São Francisco Xavier',
                  'Paróquia São José Esposo da Virgem Maria',
                ],
              ),
              Divider(),
              ParoquiaSetorTile(
                setor: 'Setor Santana',
                paroquias: [
                  'Basílica Menor de Sant’Ana',
                  'Paróquia Nossa Senhora Aparecida',
                  'Paróquia Nossa Senhora da Salette',
                  'Paróquia Santa Luzia',
                  'Paróquia Santa Teresinha',
                ],
              ),
              Divider(),
              ParoquiaSetorTile(
                setor: 'Setor Tremembé',
                paroquias: [
                  'Paróquia Nossa Senhora Aparecida',
                  'Paróquia Nossa Senhora de Fátima (Setor Tremembé)',
                  'Paróquia Santa Joana D\'arc',
                  'Paróquia Santa Rosa de Lima',
                  'Paróquia São Domingos Sávio',
                  'Paróquia São Pedro Apóstolo',
                ],
              ),
              Divider(),
              ParoquiaSetorTile(
                setor: 'Setor Tucuruvi',
                paroquias: [
                  'Paróquia Menino Jesus',
                  'Paróquia Nossa Senhora da Luz',
                  'Paróquia Nossa Senhora das Neves',
                  'Paróquia Nossa Senhora dos Prazeres',
                  'Paróquia Sagrado Coração de Jesus',
                  'Paróquia Santa Terezinha do Menino Jesus (Jaçanã)',
                  'Paróquia Santo Antônio',
                  'Paróquia São Camilo de Lellis',
                  'Paróquia São Paulo Apóstolo',
                ],
              ),
              Divider(),
              ParoquiaSetorTile(
                setor: 'Setor Vila Maria',
                paroquias: [
                  'Paróquia Jesus no Horto das Oliveiras',
                  'Paróquia Nossa Senhora Aparecida da Boa Viagem',
                  'Paróquia Nossa Senhora da Anunciação',
                  'Paróquia Nossa Senhora da Candelária',
                  'Paróquia Santa Rita de Cássia',
                  'Paróquia São Sebastião',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ParoquiaSetorTile extends StatelessWidget {
  final String setor;
  final List<String> paroquias;

  ParoquiaSetorTile({
    required this.setor,
    required this.paroquias,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            setor,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 8),
        Column(
          children: paroquias
              .map(
                (paroquia) => Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(paroquia),
                    onTap: () {
                      // Navegar para a página da paróquia específica se desejado
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
