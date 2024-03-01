import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart'; // Importe esta biblioteca

class OracoesPage extends StatelessWidget {
  final Map<String, String> oracoes = {
    'Abri Senhor': 'abri_senhor.txt',
    'Almas': 'almas.txt',
    'Alma de Cristo': 'Alma_de_Cristo.txt',
    'Amado Jesus José e Maria': 'Amado_Jesus_Jose_e_Maria.txt',
    'Antes das refeições': 'Antes_das_refeicoes.txt',
    'Após as refeições': 'Apos_as_refeicoes.txt',
    'As 15 Orações a Jesus (Santa Brígida)':
        'As_15_Oracoes_a_Jesus_(Santa_Brigida).txt',
    'Ato de Contrição': 'Ato_de_Contricao.txt',
    'Ato de Louvor (Benditos)': 'Ato_de_Louvor_(Benditos).txt',
    'Ave Maria': 'Ave_Maria.txt',
    'Bênção do Santíssimo Sacramento': 'Bencao_do_Santissimo_Sacramento.txt',
    'Benedictus (Canto de Zacarias)': 'Benedictus_(Canto_de_Zacarias).txt',
    'Cantico de Simeao': 'Cantico_de_Simeao.txt',
    'Cantico dos 3 jovens na fornalha': 'Cantico_dos_3_jovens_na_fornalha.txt',
    'Completas (9 horas da noite)': 'Completas_(9_horas_da_noite).txt',
    'Confissão': 'Confissao.txt',
    'Consagração a Nossa Senhora Aparecida':
        'Consagracao_a_Nossa_Senhora_Aparecida.txt',
    'Consagração a Santíssima Virgem Maria':
        'Consagracao_a_Santissima_Virgem_Maria.txt',
    'Consagração ao Divino Pai Eterno': 'Consagracao_ao_Divino_Pai_Eterno.txt',
    'Consagração ao Imaculado Coração de Maria':
        'Consagracao_ao_Imaculado_Coracao_de_Maria.txt',
    'Consagração da Família a Nossa Senhora das Mercês':
        'Consagracao_da_Familia_a_Nossa_Senhora_das_Merces.txt',
    'Cordeiro de Deus': 'Cordeiro_de_Deus.txt',
    'Coroinha ao Sagrado Coração de Jesus':
        'Coroinha_ao_Sagrado_Coracao_de_Jesus.txt',
    'Coroinha de Nossa Senhora': 'Coroinha_de_Nossa_Senhora.txt',
    'Credo Niceno-Constantinopolitano': 'Credo_Niceno-Constantinopolitano.txt',
    'Credo': 'Credo.txt',
    'Cântico de Simeão': 'Cantico_de_Simeao.txt',
    'Cântico dos 3 jovens na fornalha': 'Cantico_dos_3_jovens_na_fornalha.txt',
    'Desagravo e Consagração ao Coração de Jesus':
        'Desagravo_e_Consagracao_ao_Coracao_de_Jesus.txt',
    'Diante do Crucifixo': 'Diante_do_Crucifixo.txt',
    'Divino Pai Eterno': 'Divino_Pai_Eterno.txt',
    'Doce Coração de Jesus': 'Doce_Coracao_de_Jesus.txt',
    'Dons do Espirito Santo': 'Dons_do_Espirito_Santo.txt',
    'Dos Esposos': 'Dos_Esposos.txt',
    'Espírito Santo': 'Espirito_Santo.txt',
    'Eu vos adoro devotamente': 'Eu_vos_adoro_devotamente.txt',
    'Fórmula de intenção para a missa': 'Formula_de_intencao_para_a_missa.txt',
    'Glória a Deus nas alturas': 'Gloria_a_Deus_nas_alturas.txt',
    'Glória ao Pai': 'Gloria_ao_Pai.txt',
    'Graças e louvores': 'Gracas_e_louvores.txt',
    'Introdução ao Ofício da Imaculada Conceição da Virgem Maria':
        'Introducao_ao_Oficio_da_Imaculada_Conceicao_da_Virgem_Maria.txt',
    'Introdução': 'Introducao.txt',
    'Jesus manso e humilde': 'Jesus_manso_e_humilde.txt',
    'JMJ 2013 Oração Oficial': 'JMJ_2013_Oracao_Oficial.txt',
    'Ladainha da Divina Misericórdia - Santa Faustina':
        'Ladainha_da_Divina_Misericordia_-_Santa_Faustina.txt',
    'Ladainha da Humildade': 'Ladainha_da_Humildade.txt',
    'Ladainha de Nossa Senhora': 'Ladainha_de_Nossa_Senhora.txt',
    'Ladainha de São José': 'Ladainha_de_Sao_Jose.txt',
    'Ladainha de Todos os Santos': 'Ladainha_de_Todos_os_Santos.txt',
    'Ladainha Do Preciosíssimo Sangue de Jesus':
        'Ladainha_Do_Preciosissimo_Sangue_de_Jesus.txt',
    'Ladainha do Sagrado Coração de Jesus':
        'Ladainha_do_Sagrado_Coracao_de_Jesus.txt',
    'Ladainha pelas Almas': 'Ladainha_pelas_Almas.txt',
    'Lembrai-vos (Virgem Maria)': 'Lembrai-vos_(Virgem_Maria).txt',
    'Levanta-se Deus': 'Levanta-se_Deus.txt',
    'Magnificat': 'Magnificat.txt',
    'Maria Passa na Frente': 'Maria_Passa_na_Frente.txt',
    'Matinas e Laudes (Manhã e madrugada)':
        'Matinas_e_Laudes_(Manha_e_madrugada).txt',
    'Menino Jesus de Praga': 'Menino_Jesus_de_Praga.txt',
    'Meu Deus! Eu creio, adoro, espero e amo-Vos':
        'Meu_Deus!_Eu_creio,_adoro,_espero_e_amo-Vos.txt',
    'Mistérios Dolorosos': 'Misterios_Dolorosos.txt',
    'Mistérios Gloriosos': 'Misterios_Gloriosos.txt',
    'Mistérios Gozosos': 'Misterios_Gozosos.txt',
    'Mistérios Luminosos': 'Misterios_Luminosos.txt',
    'Mãe de misericórdia': 'Mae_de_misericordia.txt',
    'Mãos ensanguentadas': 'Maos_ensanguentadas.txt',
    'Nona (3 horas da tarde)': 'Nona_(3_horas_da_tarde).txt',
    'Nossa Senhora (Medalha Milagrosa)':
        'Nossa_Senhora_(Medalha_Milagrosa).txt',
    'Nossa Senhora Auxiliadora': 'Nossa_Senhora_Auxiliadora.txt',
    'Nossa Senhora da Cabeça': 'Nossa_Senhora_da_Cabeca.txt',
    'Nossa Senhora da Conceição': 'Nossa_Senhora_da_Conceicao.txt',
    'Nossa Senhora da Defesa': 'Nossa_Senhora_da_Defesa.txt',
    'Nossa Senhora da Saúde': 'Nossa_Senhora_da_Saude.txt',
    'Nossa Senhora das Dores': 'Nossa_Senhora_das_Dores.txt',
    'Nossa Senhora das Graças': 'Nossa_Senhora_das_Gracas.txt',
    'Nossa Senhora de Casaluce': 'Nossa_Senhora_de_Casaluce.txt',
    'Nossa Senhora de Fátima': 'Nossa_Senhora_de_Fatima.txt',
    'Nossa Senhora de Guadalupe': 'Nossa_Senhora_de_Guadalupe.txt',
    'Nossa Senhora de Lourdes': 'Nossa_Senhora_de_Lourdes.txt',
    'Nossa Senhora de Nazaré': 'Nossa_Senhora_de_Nazare.txt',
    'Nossa Senhora de Schoenstatt': 'Nossa_Senhora_de_Schoenstatt.txt',
    'Nossa Senhora Desatadora de Nós': 'Nossa_Senhora_Desatadora_de_Nos.txt',
    'Nossa Senhora Desatadora dos Nós': 'Nossa_Senhora_Desatadora_dos_Nos.txt',
    'Nossa Senhora do bom parto': 'Nossa_Senhora_do_bom_parto.txt',
    'Nossa Senhora do Bom Remédio': 'Nossa_Senhora_do_Bom_Remedio.txt',
    'Nossa Senhora do Carmo': 'Nossa_Senhora_do_Carmo.txt',
    'Nossa Senhora do Desterro': 'Nossa_Senhora_do_Desterro.txt',
    'Nossa Senhora do Perpétuo Socorro':
        'Nossa_Senhora_do_Perpétuo_Socorro.txt',
    'Nossa Senhora dos Navegantes': 'Nossa_Senhora_dos_Navegantes.txt',
    'Novena a Imaculada Conceição': 'Novena_a_Imaculada_Conceicao.txt',
    'Novena a Nossa Senhora das Mercês':
        'Novena_a_Nossa_Senhora_das_Merces.txt',
    'Novena a Nossa Senhora de Guadalupe':
        'Novena_a_Nossa_Senhora_de_Guadalupe.txt',
    'Novena a Santa Edith Stein': 'Novena_a_Santa_Edith_Stein.txt',
    'Novena a Santa Rita de Cássia': 'Novena_a_Santa_Rita_de_Cassia.txt',
    'Novena a São Miguel Arcanjo pela Purificação da Fé':
        'Novena_a_Sao_Miguel_Arcanjo_pela_Purificacao_da_Fe.txt',
    'Novena ao Espírito Santo - clamando o Pentecostes':
        'Novena_ao_Espirito_Santo_-_clamando_o_Pentecostes.txt',
    'Novena as Mãos Ensanguentadas de Jesus':
        'Novena_as_Maos_Ensanguentadas_de_Jesus.txt',
    'Novena contra a Depressão': 'Novena_contra_a_Depressao.txt',
    'Novena da Medalha Milagrosa': 'Novena_da_Medalha_Milagrosa.txt',
    'Novena de Frei Galvão': 'Novena_de_Frei_Galvao.txt',
    'Novena de Jesus Ressuscitado e Misericordioso':
        'Novena_de_Jesus_Ressuscitado_e_Misericordioso.txt',
    'Novena de Nossa Senhora Aparecida':
        'Novena_de_Nossa_Senhora_Aparecida.txt',
    'Novena de Nossa Senhora das Graças':
        'Novena_de_Nossa_Senhora_das_Gracas.txt',
    'Novena de Nossa Senhora de Fátima':
        'Novena_de_Nossa_Senhora_de_Fatima.txt',
    'Novena de Nossa Senhora do Carmo': 'Novena_de_Nossa_Senhora_do_Carmo.txt',
    'Novena de Nossa Senhora do Perpétuo Socorro':
        'Novena_de_Nossa_Senhora_do_Perpétuo_Socorro.txt',
    'Novena de Santa Teresinha do Menino Jesus':
        'Novena_de_Santa_Teresinha_do_Menino_Jesus.txt',
    'Novena de Santo Expedito': 'Novena_de_Santo_Expedito.txt',
    'Novena de São José': 'Novena_de_Sao_Jose.txt',
    'Novena de São Rafael': 'Novena_de_Sao_Rafael.txt',
    'Novena do Sagrado Coração de Jesus':
        'Novena_do_Sagrado_Coracao_de_Jesus.txt',
    'Novena pelas Almas': 'Novena_pelas_Almas.txt',
    'Novena Santa Marta': 'Novena_Santa_Marta.txt',
    'Novena à Santa Mônica': 'Novena_a_Santa_Monica.txt',
    'O Anjo do Senhor': 'O_Anjo_do_Senhor.txt',
    'Oferecimento de si mesmo': 'Oferecimento_de_si_mesmo.txt',
    'Ofício de Nossa Senhora para ser rezado em um único momento':
        'Oficio_de_Nossa_Senhora_para_ser_rezado_em_um_unico_momento.txt',
    'Oh sangue e água': 'Oh_sangue_e_agua.txt',
    'Oração a Nossa Senhora da Paz': 'Oracao_a_Nossa_Senhora_da_Paz.txt',
    'Oração a Nossa Senhora': 'Oracao_a_Nossa_Senhora.txt',
    'Oração a Nosso Senhor Jesus Cristo Crucificado':
        'Oracao_a_Nosso_Senhor_Jesus_Cristo_Crucificado.txt',
    'Oração a Santa Ana': 'Oracao_a_Santa_Ana.txt',
    'Oração a Santa Bárbara': 'Oracao_a_Santa_Barbara.txt',
    'Oração a Santo Afonso Maria de Ligório':
        'Oracao_a_Santo_Afonso_Maria_de_Ligorio.txt',
    'Oração a São João Bosco - Dom Bosco':
        'Oracao_a_Sao_Joao_Bosco_-_Dom_Bosco.txt',
    'Oração a São Lázaro': 'Oracao_a_Sao_Lazaro.txt',
    'Oração a São Vicente de Paulo': 'Oracao_a_Sao_Vicente_de_Paulo.txt',
    'Oração ao Beato Carlos de Foucauld':
        'Oracao_ao_Beato_Carlos_de_Foucauld.txt',
    'Oração aos três Anjos da Guarda': 'Oracao_aos_tres_Anjos_da_Guarda.txt',
    'Oração atribuída ao Papa Clemente XI':
        'Oracao_atribuida_ao_Papa_Clemente_XI.txt',
    'Oração da Manhã': 'Oracao_da_Manha.txt',
    'Oração da Noite': 'Oracao_da_Noite.txt',
    'Oração da serenidade': 'Oracao_da_serenidade.txt',
    'Oração de Santa Edwiges': 'Oracao_de_Santa_Edwiges.txt',
    'Oração de Santa Rita de Cássia': 'Oracao_de_Santa_Rita_de_Cassia.txt',
    'Oração de Santo Ambrósio': 'Oracao_de_Santo_Ambrosio.txt',
    'Oração de Santo Expedito': 'Oracao_de_Santo_Expedito.txt',
    'Oração de Santo Tomás de Aquino': 'Oracao_de_Santo_Tomas_de_Aquino.txt',
    'Oração de São Bento': 'Oracao_de_Sao_Bento.txt',
    'Oração de São Francisco de Assis': 'Oracao_de_Sao_Francisco_de_Assis.txt',
    'Oração de São José': 'Oracao_de_Sao_Jose.txt',
    'Oração de São João Crisóstomo': 'Oracao_de_Sao_Joao_Crisostomo.txt',
    'Oração de São Judas Tadeu': 'Oracao_de_Sao_Judas_Tadeu.txt',
    'Oração Diária para os Sacerdotes do Beato Carlos de Foucauld':
        'Oracao_Diaria_para_os_Sacerdotes_do_Beato_Carlos_de_Foucauld.txt',
    'Oração do Músico Cristão': 'Oracao_do_Musico_Cristao.txt',
    'Oração dos Casais': 'Oracao_dos_Casais.txt',
    'Oração para a família': 'Oracao_para_a_familia.txt',
    'Os Sete Pai Nossos em honra ao Sangue de Jesus':
        'Os_Sete_Pai_Nossos_em_honra_ao_Sangue_de_Jesus.txt',
    'Pai Eterno': 'Pai_Eterno.txt',
    'Pai Nosso': 'Pai_Nosso.txt',
    'Para a família': 'Para_a_familia.txt',
    'Para antes dos estudos (S. Tomás de Aquino)':
        'Para_antes_dos_estudos_(S._Tomas_de_Aquino).txt',
    'Para obter saúde': 'Para_obter_saude.txt',
    'Para uma viagem': 'Para_uma_viagem.txt',
    'Pastorzinhos de Fátima': 'Pastorzinhos_de_Fatima.txt',
    'Pelos falecidos': 'Pelos_falecidos.txt',
    'Pelos filhos': 'Pelos_filhos.txt',
    'Pelos mais necessitados': 'Pelos_mais_necessitados.txt',
    'Pelos pais': 'Pelos_pais.txt',
    'Pelos parentes ausentes': 'Pelos_parentes_ausentes.txt',
    'Prima (6 horas da manhã)': 'Prima_(6_horas_da_manha).txt',
    'Proteção de São Patrício': 'Protecao_de_Sao_Patricio.txt',
    'Quaresma de São Miguel Arcanjo': 'Quaresma_de_Sao_Miguel_Arcanjo.txt',
    'Rainha do Céu': 'Rainha_do_Ceu.txt',
    'Reparação ao Santíssimo Sacramento':
        'Reparacao_ao_Santissimo_Sacramento.txt',
    'Responsório de Santo Antônio': 'Responsorio_de_Santo_Antonio.txt',
    'Rosário do Espírito Santo': 'Rosario_do_Espirito_Santo.txt',
    'Sagrado Coração de Jesus': 'Sagrado_Coracao_de_Jesus.txt',
    'Salmo 4': 'Salmo_4.txt',
    'Salmo 5': 'Salmo_5.txt',
    'Salve Cruz vitoriosa': 'Salve_Cruz_vitoriosa.txt',
    'Salve Rainha': 'Salve_Rainha.txt',
    'Santa Clara': 'Santa_Clara.txt',
    'Santa Joana d\'Arc': 'Santa_Joana_dArc.txt',
    'Santa Josefina Bakhita': 'Santa_Josefina_Bakhita.txt',
    'Santa Luzia (Protetora dos olhos e da visão)':
        'Santa_Luzia_(Protetora_dos_olhos_e_da_visao).txt',
    'Santa Mônica': 'Santa_Monica.txt',
    'Santa Teresinha (Prece à Santa das Rosas)':
        'Santa_Teresinha_(Prece_a_Santa_das_Rosas).txt',
    'Santa Teresinha do Menino Jesus': 'Santa_Teresinha_do_Menino_Jesus.txt',
    'Santo Agostinho': 'Santo_Agostinho.txt',
    'Santo Anjo': 'Santo_Anjo.txt',
    'Santo Antônio': 'Santo_Antonio.txt',
    'Santo Inácio de Loyola': 'Santo_Inacio_de_Loyola.txt',
    'Santo Lenho de Nosso Senhor Jesus Cristo':
        'Santo_Lenho_de_Nosso_Senhor_Jesus_Cristo.txt',
    'Senhor do Bonfim': 'Senhor_do_Bonfim.txt',
    'Sexta (meio-dia)': 'Sexta_(meio-dia).txt',
    'Sinal da Cruz': 'Sinal_da_Cruz.txt',
    'Socorrei Maria': 'Socorrei_Maria.txt',
    'São Benedito': 'Sao_Benedito.txt',
    'São Brás (Protetor das doenças da garganta)':
        'Sao_Bras_(Protetor_das_doencas_da_garganta).txt',
    'São Cristóvão': 'Sao_Cristovao.txt',
    'São Gabriel Arcanjo': 'Sao_Gabriel_Arcanjo.txt',
    'São João Batista': 'Sao_Joao_Batista.txt',
    'São João Bosco': 'Sao_Joao_Bosco.txt',
    'São João Evangelista': 'Sao_Joao_Evangelista.txt',
    'São Jorge': 'Sao_Jorge.txt',
    'São José': 'Sao_Jose.txt',
    'São Judas Tadeu': 'Sao_Judas_Tadeu.txt',
    'São Luís Gonzaga': 'Sao_Luis_Gonzaga.txt',
    'São Miguel Arcanjo': 'Sao_Miguel_Arcanjo.txt',
    'São Patrício': 'Sao_Patricio.txt',
    'São Paulo Apóstolo': 'Sao_Paulo_Apostolo.txt',
    'São Pedro Apóstolo': 'Sao_Pedro_Apostolo.txt',
    'São Pio X': 'Sao_Pio_X.txt',
    'São Rafael Arcanjo': 'Sao_Rafael_Arcanjo.txt',
    'São Sebastião': 'Sao_Sebastiao.txt',
    'São Vicente de Paulo': 'Sao_Vicente_de_Paulo.txt',
    'Súplica ao Coração de Jesus': 'Suplica_ao_Coracao_de_Jesus.txt',
    'Súplica pela Paz': 'Suplica_pela_Paz.txt',
    'Te Deum (Louvor a Deus)': 'Te_Deum_(Louvor_a_Deus).txt',
    'Tríduo a São José': 'Triduo_a_Sao_Jose.txt',
    'Uma chuva de rosas': 'Uma_chuva_de_rosas.txt',
    'Veni Creator Spiritus (Vinde Espírito Criador)':
        'Veni_Creator_Spiritus_(Vinde_Espirito_Criador).txt',
    'Via Sacra': 'Via_Sacra.txt',
    'Vinho e Pão': 'Vinho_e_Pao.txt'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orações'),
      ),
      body: ListView.builder(
        itemCount: oracoes.length,
        itemBuilder: (context, index) {
          String title = oracoes.keys.elementAt(index);
          return OracaoItem(title: title, oracaoFilePath: oracoes[title]!);
        },
      ),
    );
  }
}

class OracaoItem extends StatefulWidget {
  final String title;
  final String oracaoFilePath;

  const OracaoItem({
    required this.title,
    required this.oracaoFilePath,
  });

  @override
  _OracaoItemState createState() => _OracaoItemState();
}

class _OracaoItemState extends State<OracaoItem> {
  late String _oracaoText = ''; // Inicialize com uma string vazia

  double _fontSize = 16.0;

  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _loadOracao();
  }

  Future<void> _loadOracao() async {
    String oracaoText =
        await rootBundle.loadString('assets/${widget.oracaoFilePath}');
    setState(() {
      _oracaoText = oracaoText;
    });
  }

  void _toggleExpansion() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  void _changeFontSize(bool increase) {
    setState(() {
      _fontSize = increase ? _fontSize + 2.0 : _fontSize - 2.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: ListTile(
            title: Text(widget.title, style: TextStyle(color: Colors.black)),
            onTap: _toggleExpansion,
            tileColor: Colors.white,
          ),
        ),
        if (_expanded &&
            _oracaoText.isNotEmpty) // Verifique se _oracaoText não está vazio
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () => _changeFontSize(false),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => _changeFontSize(true),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  _oracaoText,
                  style: TextStyle(fontSize: _fontSize),
                ),
              ],
            ),
          ),
        Divider(),
      ],
    );
  }
}
