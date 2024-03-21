import 'package:flutter/material.dart';

class HistoriaParoquiaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('História da Paróquia'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0), // Cantos arredondados
          boxShadow: [ // Adicionando uma sombra
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // Altere o deslocamento vertical conforme necessário
            ),
          ],
        ),
        margin: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleWithImage(
                    'HISTÓRIA DO CONVENTO SÃO FRANCISCO',
                    '''
Em 1640 chegava a São Paulo uma caravana de sete religiosos franciscanos, que se instalaram numa casa em frente à Ermida de Santo Antônio, na atual Praça do Patriarca. Dois anos depois, no dia 24 de dezembro 1642, os frades ganhavam um terreno, doado pela Câmara, de “oitenta braças de chão”, e davam início à construção do convento. A igreja dos franciscanos, juntamente com as igrejas da Ordem dos Beneditinos e da Ordem dos Carmelitas, formava um dos vértices do triângulo que consistia a colina sobre a qual se assentava a cidade de São Paulo que ainda era uma Vila. No dia 17 de setembro de 1647, festa das Chagas de São Francisco, foi inaugurado o Convento de São Francisco e de São Domingos, seu primeiro nome de batismo. São, portanto, quase 400 anos de presença franciscana em São Paulo e de fundação do Convento.

Na época que foi inaugurado, era o maior já construído em São Paulo, com dois andares em taipa, o único na cidade. Ocupava todo o espaço que atualmente é da Faculdade de Direito. As fundações chegavam a 3 metros de profundidade e sua construção era em taipas, atingindo até 2 metros de espessura em certos pontos. Destacava-se o imponente claustro, com seus cinco arcos sobre pilastras.

Até meados do século XVII, o frontispício das igrejas da Província era construído em estilo jesuítico, com torre baixa. Desde então, adotou-se o barroco como estilo decorativo. Em 1884, após um incêndio em 1880, a fachada da Igreja foi modificada e aberta a entrada central como hoje é utilizada. No seu interior, adotou-se o estilo rococó. Pinturas na nave e azulejos no altar que representam passagens da vida de São Francisco, foram feitos na década de 1950. Em sua torre encontramos um sino do século XVIII.

O incêndio de 1880 destruiu a antiga capela-mor. Foram salvas as paredes, a imagem de São Francisco, considerada a mais bela das que se encontram nos conventos antigos, e a imagem da Imaculada Conceição, além de mobiliários como as estalas do coro dos frades. O Santuário é tombado como Patrimônio Histórico''',
                    'assets/imagens/imageconv1.jpg', // Caminho da imagem 1
                  ),
                  SizedBox(height: 20),
                  _buildTitleWithImage(
                    'IMAGEM SALVA NO INCÊNDIO\n"FREI GALVÃO, O SANTO DO CONVENTO"',
                    '''
Frei Antônio de Sant’Ana Galvão, canonizado pelo Papa Bento XVI, foi sem dúvida o morador mais ilustre do Convento São Francisco. Aqui ele estudou, viveu e trabalhou por 60 anos. Como pregador irradiou sua vocação e carisma franciscanos aqui consolidados.

Paulista, de Guaratinguetá, Frei Galvão ingressou na Ordem Franciscana no dia 15 de abril de 1760, tomando o hábito no Convento de Santo Antônio de Macuco, no Rio de Janeiro. Em julho de 1762, seus superiores o enviaram a São Paulo para cursar Filosofia, onde também completou o curso de Teologia. Suas qualidades como pregador e porteiro do Convento são lembradas em todos os livros de história. É neste mesmo Convento, que em 09 de novembro de 1766, 4 anos após sua chegada, que ele fará sua consagração como filho e escravo perpétuo da Virgem Imaculada, em frente da imagem que está até hoje em nosso altar lateral. Ele morreu aos 83 anos e foi sepultado no Mosteiro da Luz, a obra que ajudou a erguer e foi inaugurada em 2 de fevereiro de 1774.

 ''',
                    'assets/imagens/imageconv2.jpg', // Caminho da imagem 2
                  ),
                  SizedBox(height: 20),
                  _buildTitleWithImage(
                    'A FACULDADE DE DIREITO',
                    '''
Depois de declarar sua independência, o Brasil criou dois cursos jurídicos e, pela Lei de 11 de Agosto, foram escolhidas as cidades de São Paulo e Olinda como sedes. Entre todos os locais disponíveis na capital paulista, o Convento São Francisco era o que mais reunia condições estruturais para este curso e “os franciscanos cederam de bom grado” parte do seu espaço.

Na época, devido ao contexto político na cidade, eram poucos os frades que ali habitavam. A Academia de Direito que fazia com que São Paulo viesse a se tornar um centro de estudantes e ganhar uma nova vida intelectual e social, acabou por ocupar todas as dependências da edificação, inclusive o claustro, sacristia e biblioteca. Os livros que pertenciam ao Convento, muitos deles obras raras, estão na biblioteca da faculdade até hoje. O Convento original abrigou a Academia de direito até a década de 1930, quando após muitas disputas judiciais, foi então demolido para a construção do prédio atual que conhecemos. Os frades que ali moravam foram enviados para outros conventos.

A Igreja, então, ficou aos cuidados da Ordem Terceira de São Francisco, e mais especificamente da Irmandade de São Benedito, desde a década de 1850 até o retorno dos frades franciscanos no início do século XX.

Nem só de disputas judiciais viveram o Convento e a Faculdade. Em 1860 foi fundada a Irmandade Acadêmica de São Francisco, composta por professores, doutores e alunos da Faculdade, residentes na Capital, que ajudaram a manter o patrimônio cultural e religioso do Convento. Foi nesta época que eles doaram o novo altar-mor da Igreja, adquirido em Munique, na Alemanha.

O CONVENTO ATUAL''',
                    'assets/imagens/imageconv3.jpg', // Caminho da imagem 3
                  ),
                  SizedBox(height: 20),
                  _buildTitleWithImage(
                    'O CONVENTO ATUAL',
                    '''
No início do século XX, quando as ordens religiosas puderam voltar ao Brasil, houve uma tentativa de retomada do edifício do antigo Convento, mas a Academia de Direito obteve o ganho da causa. Era preciso construir um novo espaço para abrigar uma nova história. Um novo convento foi erguido a partir da década de 1940, mantendo as características franciscanas, com arcadas e espaços de convivência.

A estrutura atual do Convento São Francisco, na parte dos fundos da secular igreja, foi construída em 1941 pelo então guardião Frei Damaso Venker.

Até 2004 foi a sede da Província Franciscana da Imaculada Conceição do Brasil, que abrange os estados de Espírito Santo, Rio de Janeiro, São Paulo, Paraná e Santa Catarina. Ela foi fundada em 15 de julho de 1675.

No dia 6 de junho de 1997, o Cardeal Dom Paulo Evaristo Arns, ilustre frade franciscano que também morou no Convento São Francisco, declarou que o Convento passaria a ser também Santuário São Francisco, já que recebe fiéis de toda a Grande São Paulo que aqui chegam para fazer suas orações, pedidos e agradecimentos ao nosso Patrono. Por ser um Santuário, a Igreja fica aberta todos os dias.

''',
                    'assets/imagens/imageconv4.jpg', // Caminho da imagem 4
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildImageSlider(), // Adiciona o slider de imagens abaixo das informações
          ],
        ),
      ),
    );
  }

  Widget _buildTitleWithImage(String title, String text, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Ajuste o tamanho e a negrito do título
        ),
        SizedBox(height: 10),
        Image.asset(
          imagePath,
          width: double.infinity, // Expandir a imagem até as laterais da tela
          fit: BoxFit.cover, // Ajustar a imagem para cobrir todo o espaço disponível
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  Widget _buildImageSlider() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildImageItem('assets/imagens/image_1.jpg'),
          _buildImageItem('assets/imagens/image_2.jpg'),
          _buildImageItem('assets/imagens/image_3.jpg'),
          _buildImageItem('assets/imagens/image_4.jpg'),
          _buildImageItem('assets/imagens/image_5.jpg'),
          _buildImageItem('assets/imagens/image_6.jpg'),
          _buildImageItem('assets/imagens/image_7.jpg'),
          _buildImageItem('assets/imagens/image_8.jpg'),
          _buildImageItem('assets/imagens/image_9.jpg'),
          _buildImageItem('assets/imagens/image_10.jpg'),
          _buildImageItem('assets/imagens/image_11.jpg'),
          _buildImageItem('assets/imagens/image_12.jpg'),
          _buildImageItem('assets/imagens/image_13.jpg'),
          _buildImageItem('assets/imagens/image_14.jpg'),
          _buildImageItem('assets/imagens/image_15.jpg'),
          _buildImageItem('assets/imagens/image_16.jpg'),
          _buildImageItem('assets/imagens/image_17.jpg'),
          _buildImageItem('assets/imagens/image_18.jpg'),
          _buildImageItem('assets/imagens/image_19.jpg'),
          _buildImageItem('assets/imagens/image_20.jpg'),
          _buildImageItem('assets/imagens/image_21.jpg'),
          _buildImageItem('assets/imagens/image_22.jpg'),
          _buildImageItem('assets/imagens/image_23.jpg'),
          _buildImageItem('assets/imagens/image_24.jpg'),
          _buildImageItem('assets/imagens/image_25.jpg'),
        ],
      ),
    );
  }

  Widget _buildImageItem(String imagePath) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0), // Cantos arredondados
        child: Image.asset(
          imagePath,
          width: 300,
          height: 200,
          fit: BoxFit.cover, // Ajustar a imagem para cobrir todo o espaço disponível
        ),
      ),
    );
  }
}

