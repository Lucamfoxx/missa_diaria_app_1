import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

Map<String, List<String>> temasOpcoesMap = {
  'Orações Comuns': [
    'Ave Maria',
    'Anjo da Guarda',
    'Abri Senhor',
    'À vossa proteção',
    'Credo',
    'Cordeiro de Deus',
    'Glória a Deus nas alturas',
    'Glória ao Pai',
    'Pai Nosso',
    'Salve Rainha',
    'Sinal da Cruz',
    'Divino Pai Eterno',
    'Os Sete Pai Nossos em honra ao Sangue de Jesus',
    'Pai Eterno'
  ],
  'Ocasiões Especiais': [
    'Para antes dos estudos',
    'Para a família',
    'Para obter saúde',
    'Para uma viagem'
  ],
  'Orações para a Família': [
    'Pelos falecidos',
    'Pelos filhos',
    'Pelos mais necessitados',
    'Pelos pais',
    'Pelos parentes ausentes'
  ],
  'Orações dos Santos': [
    'São Benedito',
    'São Brás (Protetor das doenças da garganta)',
    'São Cristóvão',
    'São Gabriel Arcanjo',
    'São João Batista',
    'São Jorge',
    'São Pio X',
    'São Rafael Arcanjo',
    'São Sebastião',
    'São Vicente de Paulo',
    'Santa Clara',
    'Santa Joana dArc',
    'Santa Josefina Bakhita',
    'Santa Luzia (Protetora dos olhos e da visão)',
    'Santa Mônica',
    'Santa Teresinha (Prece à Santa das Rosas)',
    'Santa Teresinha do Menino Jesus',
    'Santo Agostinho',
    'Santo Anjo',
    'Santo Antônio',
    'Santo Inácio de Loyola',
    'Santo Lenho de Nosso Senhor Jesus Cristo'
  ],
  'Orações': [
    'Oração aos três Anjos da Guarda',
    'Oração ao Beato Carlos de Foucauld',
    'Oração atribuída ao Papa Clemente XI',
    'Oração a Nossa Senhora',
    'Oração a Nossa Senhora da Paz',
    'Oração a Nosso Senhor Jesus Cristo Crucificado',
    'Oração a Santa Ana',
    'Oração a Santa Bárbara',
    'Oração a Santo Afonso Maria de Ligório',
    'Oração a São João Bosco - Dom Bosco',
    'Oração a São Lázaro',
    'Oração a São Vicente de Paulo',
    'Oração da Manhã',
    'Oração da Noite',
    'Oração da serenidade',
    'Oração de Santa Edwiges',
    'Oração de Santa Rita de Cássia',
    'Oração de Santo Ambrósio',
    'Oração de Santo Expedito',
    'Oração de Santo Tomás de Aquino',
    'Oração de São Bento',
    'Oração de São Francisco de Assis',
    'Oração de São João Crisóstomo',
    'Oração de São Judas Tadeu',
    'Oração Diária para os Sacerdotes do Beato Carlos de Foucauld',
    'Oração dos Casais',
    'Oração do Músico Cristão',
    'Oração para a família'
  ],
  'Ladainhas': [
    'Ladainha da Divina Misericórdia - Santa Faustina',
    'Ladainha da Humildade',
    'Ladainha de Nossa Senhora',
    'Ladainha de São José',
    'Ladainha de Todos os Santos',
    'Ladainha Do Preciosíssimo Sangue de Jesus',
    'Ladainha do Sagrado Coração de Jesus',
    'Ladainha pelas Almas'
  ],
  'Mistérios': [
    'Mistérios Dolorosos',
    'Mistérios Gloriosos',
    'Mistérios Gozosos',
    'Mistérios Luminosos'
  ],
  'Novenas': [
    'Novena a Imaculada Conceição',
    'Novena a Nossa Senhora das Mercês',
    'Novena a Nossa Senhora de Guadalupe',
    'Novena a Santa Edith Stein',
    'Novena a Santa Rita de Cássia',
    'Novena a São Miguel Arcanjo pela Purificação da Fé',
    'Novena ao Espírito Santo - clamando o Pentecostes',
    'Novena as Mãos Ensanguentadas de Jesus',
    'Novena contra a Depressão',
    'Novena da Medalha Milagrosa',
    'Novena de Frei Galvão',
    'Novena de Jesus Ressuscitado e Misericordioso',
    'Novena de Nossa Senhora Aparecida',
    'Novena de Nossa Senhora das Graças',
    'Novena de Nossa Senhora de Fátima',
    'Novena de Nossa Senhora do Carmo',
    'Novena de Nossa Senhora do Perpétuo Socorro',
    'Novena de Santa Teresinha do Menino Jesus',
    'Novena de Santo Expedito',
    'Novena de São José',
    'Novena de São Rafael',
    'Novena do Sagrado Coração de Jesus',
    'Novena pelas Almas',
    'Novena Santa Marta',
    'Novena à Santa Mônica'
  ],
  'Terços': [
    'Terço a Nossa Senhora Mãe de Jesus',
    'Terço das Lágrimas de Sangue de Maria Rosa Mística',
    'Terço das Santas Chagas de Cristo',
    'Terço da Batalha',
    'Terço da Divina Misericórdia',
    'Terço da Imaculada Conceição',
    'Terço da Libertação',
    'Terço da Nossa Senhora da Assunção',
    'Terço da Nossa Senhora do Santíssimo Sacramento',
    'Terço da Providência',
    'Terço de Nossa Senhora das Graças',
    'Terço de São Miguel Arcanjo',
    'Terço do Desagravo',
    'Terço do Imaculado Coração de Maria'
  ],
  'Maria': [
    'Amado Jesus, José e Maria',
    'Introdução ao Ofício da Imaculada Conceição da Virgem Maria',
    'Lembrai-vos (Virgem Maria)',
    'Maria Passa na Frente',
    'Ó Maria concebida sem pecado',
    'Socorrei Maria'
  ],
  'Nossa Senhora': [
    'Nossa Senhora (Medalha Milagrosa)',
    'Nossa Senhora Auxiliadora',
    'Nossa Senhora das Dores',
    'Nossa Senhora das Graças',
    'Nossa Senhora da Cabeça',
    'Nossa Senhora da Conceição',
    'Nossa Senhora da Defesa',
    'Nossa Senhora da Saúde',
    'Nossa Senhora Desatadora de Nós',
    'Nossa Senhora Desatadora dos Nós',
    'Nossa Senhora de Casaluce',
    'Nossa Senhora de Fátima',
    'Nossa Senhora de Guadalupe',
    'Nossa Senhora de Lourdes',
    'Nossa Senhora de Nazaré',
    'Nossa Senhora de Schoenstatt',
    'Nossa Senhora dos Navegantes',
    'Nossa Senhora do bom parto',
    'Nossa Senhora do Bom Remédio',
    'Nossa Senhora do Carmo',
    'Nossa Senhora do Desterro',
    'Nossa Senhora do Perpétuo Socorro'
  ],
  'Consagrações': [
    'Consagração ao Divino Pai Eterno',
    'Consagração ao Imaculado Coração de Maria',
    'Consagração a Nossa Senhora Aparecida',
    'Consagração a Santíssima Virgem Maria',
    'Consagração da Família a Nossa Senhora das Mercês',
    'Desagravo e Consagração ao Coração de Jesus'
  ]
};

Map<String, String> caminhosMap = {
  'Ave Maria': 'assets/ave_maria.txt',
  'Anjo da Guarda': 'assets/anjo_da_guarda.txt',
  'Credo': 'assets/credo.txt',
  'Cordeiro de Deus': 'assets/Cordeiro_de_Deus.txt',
  'Glória a Deus nas alturas': 'assets/Gloria_a_Deus_nas_alturas.txt',
  'Glória ao Pai': 'assets/gloria_ao_pai.txt',
  'Pai Nosso': 'assets/pai_nosso.txt',
  'Salve Rainha': 'assets/Salve_Rainha.txt',
  'Sinal da Cruz': 'assets/sinal_da_cruz.txt',
  'São Benedito': 'assets/Sao_Benedito.txt',
  'São Brás (Protetor das doenças da garganta)':
      'assets/Sao_Bras_(Protetor_das_doencas_da_garganta).txt',
  'Novena a Imaculada Conceição': 'assets/Novena_a_Imaculada_Conceicao.txt',
  'Novena a Nossa Senhora das Mercês':
      'assets/Novena_a_Nossa_Senhora_das_Merces.txt',
  'Novena a Nossa Senhora de Guadalupe':
      'assets/Novena_a_Nossa_Senhora_de_Guadalupe.txt',
  'Novena a Santa Edith Stein': 'assets/Novena_a_Santa_Edith_Stein.txt',
  'Novena a Santa Rita de Cássia': 'assets/Novena_a_Santa_Rita_de_Cassia.txt',
  'Novena a São Miguel Arcanjo pela Purificação da Fé':
      'assets/Novena_a_Sao_Miguel_Arcanjo_pela_Purificacao_da_Fe.txt',
  'Novena ao Espírito Santo - clamando o Pentecostes':
      'assets/Novena_ao_Espirito_Santo_-_clamando_o_Pentecostes.txt',
  'Novena as Mãos Ensanguentadas de Jesus':
      'assets/Novena_as_Maos_Ensanguentadas_de_Jesus.txt',
  'Novena contra a Depressão': 'assets/Novena_contra_a_Depressao.txt',
  'Novena da Medalha Milagrosa': 'assets/Novena_da_Medalha_Milagrosa.txt',
  'Novena de Frei Galvão': 'assets/Novena_de_Frei_Galvao.txt',
  'Novena de Jesus Ressuscitado e Misericordioso':
      'assets/Novena_de_Jesus_Ressuscitado_e_Misericordioso.txt',
  'Novena de Nossa Senhora Aparecida':
      'assets/Novena_de_Nossa_Senhora_Aparecida.txt',
  'Novena de Nossa Senhora das Graças':
      'assets/Novena_de_Nossa_Senhora_das_Gracas.txt',
  'Novena de Nossa Senhora de Fátima':
      'assets/Novena_de_Nossa_Senhora_de_Fatima.txt',
  'Novena de Nossa Senhora do Carmo':
      'assets/Novena_de_Nossa_Senhora_do_Carmo.txt',
  'Novena de Nossa Senhora do Perpétuo Socorro':
      'assets/Novena_de_Nossa_Senhora_do_Perpétuo_Socorro.txt',
  'Novena de Santa Teresinha do Menino Jesus':
      'assets/Novena_de_Santa_Teresinha_do_Menino_Jesus.txt',
  'Novena de Santo Expedito': 'assets/Novena_de_Santo_Expedito.txt',
  'Novena de São José': 'assets/Novena_de_Sao_Jose.txt',
  'Novena de São Rafael': 'assets/Novena_de_Sao_Rafael.txt',
  'Novena do Sagrado Coração de Jesus':
      'assets/Novena_do_Sagrado_Coracao_de_Jesus.txt',
  'Novena pelas Almas': 'assets/Novena_pelas_Almas.txt',
  'Novena Santa Marta': 'assets/Novena_Santa_Marta.txt',
  'Novena à Santa Mônica': 'assets/Novena_a_Santa_Monica.txt',
  'Santa Clara': 'assets/Santa_Clara.txt',
  'Santa Joana dArc': 'assets/Santa_Joana_dArc.txt',
  'Santa Josefina Bakhita': 'assets/Santa_Josefina_Bakhita.txt',
  'Santa Luzia (Protetora dos olhos e da visão)':
      'assets/Santa_Luzia_(Protetora_dos_olhos_e_da_visao).txt',
  'Santa Mônica': 'assets/Santa_Monica.txt',
  'Santa Teresinha (Prece à Santa das Rosas)':
      'assets/Santa_Teresinha_(Prece_a_Santa_das_Rosas).txt',
  'Santa Teresinha do Menino Jesus':
      'assets/Santa_Teresinha_do_Menino_Jesus.txt',
  'Santo Agostinho': 'assets/Santo_Agostinho.txt',
  'Santo Anjo': 'assets/Santo_Anjo.txt',
  'Santo Antônio': 'assets/Santo_Antonio.txt',
  'Santo Inácio de Loyola': 'assets/Santo_Inacio_de_Loyola.txt',
  'Santo Lenho de Nosso Senhor Jesus Cristo':
      'assets/Santo_Lenho_de_Nosso_Senhor_Jesus_Cristo.txt',
  'São Cristóvão': 'assets/Sao_Cristovao.txt',
  'São Gabriel Arcanjo': 'assets/Sao_Gabriel_Arcanjo.txt',
  'São João Batista': 'assets/Sao_Joao_Batista.txt',
  'São Jorge': 'assets/Sao_Jorge.txt',
  'São Pio X': 'assets/Sao_Pio_X.txt',
  'São Rafael Arcanjo': 'assets/Sao_Rafael_Arcanjo.txt',
  'São Sebastião': 'assets/Sao_Sebastiao.txt',
  'São Vicente de Paulo': 'assets/Oracao_a_Sao_Vicente_de_Paulo.txt',
  'Terço a Nossa Senhora Mãe de Jesus':
      'assets/Terco_a_Nossa_Senhora_Mae_de_Jesus.txt',
  'Terço das Lágrimas de Sangue de Maria Rosa Mística':
      'assets/Terco_das_Lagrimas_de_Sangue_de_Maria_Rosa_Mistica.txt',
  'Terço das Santas Chagas de Cristo':
      'assets/Terco_das_Santas_Chagas_de_Cristo.txt',
  'Terço da Batalha': 'assets/Terco_da_Batalha.txt',
  'Terço da Divina Misericórdia': 'assets/Terco_da_Divina_Misericordia.txt',
  'Terço da Imaculada Conceição': 'assets/Terco_da_Imaculada_Conceicao.txt',
  'Terço da Libertação': 'assets/Terco_da_Libertacao.txt',
  'Terço da Nossa Senhora da Assunção':
      'assets/Terco_da_Nossa_Senhora_da_Assuncao.txt',
  'Terço da Nossa Senhora do Santíssimo Sacramento':
      'assets/Terco_da_Nossa_Senhora_do_Santissimo_Sacramento.txt',
  'Terço da Providência': 'assets/Terco_da_Providencia.txt',
  'Terço de Nossa Senhora das Graças':
      'assets/Terco_de_Nossa_Senhora_das_Gracas.txt',
  'Terço de São Miguel Arcanjo': 'assets/Terco_de_Sao_Miguel_Arcanjo.txt',
  'Terço do Desagravo': 'assets/Terco_do_Desagravo.txt',
  'Terço do Imaculado Coração de Maria':
      'assets/Terco_do_Imaculado_Coracao_de_Maria.txt',
  'Nossa Senhora (Medalha Milagrosa)':
      'assets/Nossa_Senhora_(Medalha_Milagrosa).txt',
  'Nossa Senhora Auxiliadora': 'assets/Nossa_Senhora_Auxiliadora.txt',
  'Nossa Senhora das Dores': 'assets/Nossa_Senhora_das_Dores.txt',
  'Nossa Senhora das Graças': 'assets/Nossa_Senhora_das_Gracas.txt',
  'Nossa Senhora da Cabeça': 'assets/Nossa_Senhora_da_Cabeca.txt',
  'Nossa Senhora da Conceição': 'assets/Nossa_Senhora_da_Conceicao.txt',
  'Nossa Senhora da Defesa': 'assets/Nossa_Senhora_da_Defesa.txt',
  'Nossa Senhora da Saúde': 'assets/Nossa_Senhora_da_Saude.txt',
  'Nossa Senhora Desatadora de Nós':
      'assets/Nossa_Senhora_Desatadora_de_Nos.txt',
  'Nossa Senhora Desatadora dos Nós':
      'assets/Nossa_Senhora_Desatadora_dos_Nos.txt',
  'Nossa Senhora de Casaluce': 'assets/Nossa_Senhora_de_Casaluce.txt',
  'Nossa Senhora de Fátima': 'assets/Nossa_Senhora_de_Fatima.txt',
  'Nossa Senhora de Guadalupe': 'assets/Nossa_Senhora_de_Guadalupe.txt',
  'Nossa Senhora de Lourdes': 'assets/Nossa_Senhora_de_Lourdes.txt',
  'Nossa Senhora de Nazaré': 'assets/Nossa_Senhora_de_Nazare.txt',
  'Nossa Senhora de Schoenstatt': 'assets/Nossa_Senhora_de_Schoenstatt.txt',
  'Nossa Senhora dos Navegantes': 'assets/Nossa_Senhora_dos_Navegantes.txt',
  'Nossa Senhora do bom parto': 'assets/Nossa_Senhora_do_bom_parto.txt',
  'Nossa Senhora do Bom Remédio': 'assets/Nossa_Senhora_do_Bom_Remedio.txt',
  'Nossa Senhora do Carmo': 'assets/Nossa_Senhora_do_Carmo.txt',
  'Nossa Senhora do Desterro': 'assets/Nossa_Senhora_do_Desterro.txt',
  'Nossa Senhora do Perpétuo Socorro':
      'assets/Nossa_Senhora_do_Perpetuo_Socorro.txt',
  'Oração aos três Anjos da Guarda':
      'assets/Oracao_aos_tres_Anjos_da_Guarda.txt',
  'Oração ao Beato Carlos de Foucauld':
      'assets/Oracao_ao_Beato_Carlos_de_Foucauld.txt',
  'Oração atribuída ao Papa Clemente XI':
      'assets/Oracao_atribuida_ao_Papa_Clemente_XI.txt',
  'Oração a Nossa Senhora': 'assets/Oracao_a_Nossa_Senhora.txt',
  'Oração a Nossa Senhora da Paz': 'assets/Oracao_a_Nossa_Senhora_da_Paz.txt',
  'Oração a Nosso Senhor Jesus Cristo Crucificado':
      'assets/Oracao_a_Nosso_Senhor_Jesus_Cristo_Crucificado.txt',
  'Oração a Santa Ana': 'assets/Oracao_a_Santa_Ana.txt',
  'Oração a Santa Bárbara': 'assets/Oracao_a_Santa_Barbara.txt',
  'Oração a Santo Afonso Maria de Ligório':
      'assets/Oracao_a_Santo_Afonso_Maria_de_Ligorio.txt',
  'Oração a São João Bosco - Dom Bosco':
      'assets/Oracao_a_Sao_Joao_Bosco_-_Dom_Bosco.txt',
  'Oração a São Lázaro': 'assets/Oracao_a_Sao_Lazaro.txt',
  'Oração a São Vicente de Paulo': 'assets/Oracao_a_Sao_Vicente_de_Paulo.txt',
  'Oração da Manhã': 'assets/Oracao_da_Manha.txt',
  'Oração da Noite': 'assets/Oracao_da_Noite.txt',
  'Oração da serenidade': 'assets/Oracao_da_serenidade.txt',
  'Oração de Santa Edwiges': 'assets/Oracao_de_Santa_Edwiges.txt',
  'Oração de Santa Rita de Cássia': 'assets/Oracao_de_Santa_Rita_de_Cassia.txt',
  'Oração de Santo Ambrósio': 'assets/Oracao_de_Santo_Ambrosio.txt',
  'Oração de Santo Expedito': 'assets/Oracao_de_Santo_Expedito.txt',
  'Oração de Santo Tomás de Aquino':
      'assets/Oracao_de_Santo_Tomas_de_Aquino.txt',
  'Oração de São Bento': 'assets/Oracao_de_Sao_Bento.txt',
  'Oração de São Francisco de Assis':
      'assets/Oracao_de_Sao_Francisco_de_Assis.txt',
  'Oração de São João Crisóstomo': 'assets/Oracao_de_Sao_Joao_Crisostomo.txt',
  'Oração de São Judas Tadeu': 'assets/Oracao_de_Sao_Judas_Tadeu.txt',
  'Oração Diária para os Sacerdotes do Beato Carlos de Foucauld':
      'assets/Oracao_Diaria_para_os_Sacerdotes_do_Beato_Carlos_de_Foucauld.txt',
  'Oração dos Casais': 'assets/Oracao_dos_Casais.txt',
  'Oração do Músico Cristão': 'assets/Oracao_do_Musico_Cristao.txt',
  'Oração para a família': 'assets/Oracao_para_a_familia.txt',
  'Consagração ao Divino Pai Eterno':
      'assets/Consagracao_ao_Divino_Pai_Eterno.txt',
  'Consagração ao Imaculado Coração de Maria':
      'assets/Consagracao_ao_Imaculado_Coracao_de_Maria.txt',
  'Consagração a Nossa Senhora Aparecida':
      'assets/Consagracao_a_Nossa_Senhora_Aparecida.txt',
  'Consagração a Santíssima Virgem Maria':
      'assets/Consagracao_a_Santissima_Virgem_Maria.txt',
  'Consagração da Família a Nossa Senhora das Mercês':
      'assets/Consagracao_da_Familia_a_Nossa_Senhora_das_Merces.txt',
  'Desagravo e Consagração ao Coração de Jesus':
      'assets/Desagravo_e_Consagracao_ao_Coracao_de_Jesus.txt',
  'Mistérios Dolorosos': 'assets/Misterios_Dolorosos.txt',
  'Mistérios Gloriosos': 'assets/Misterios_Gloriosos.txt',
  'Mistérios Gozosos': 'assets/Misterios_Gozosos.txt',
  'Mistérios Luminosos': 'assets/Misterios_Luminosos.txt',
  'Ladainha da Divina Misericórdia - Santa Faustina':
      'assets/Ladainha_da_Divina_Misericordia_-_Santa_Faustina.txt',
  'Ladainha da Humildade': 'assets/Ladainha_da_Humildade.txt',
  'Ladainha de Nossa Senhora': 'assets/Ladainha_de_Nossa_Senhora.txt',
  'Ladainha de São José': 'assets/Ladainha_de_Sao_Jose.txt',
  'Ladainha de Todos os Santos': 'assets/Ladainha_de_Todos_os_Santos.txt',
  'Ladainha Do Preciosíssimo Sangue de Jesus':
      'assets/Ladainha_Do_Preciosissimo_Sangue_de_Jesus.txt',
  'Ladainha do Sagrado Coração de Jesus':
      'assets/Ladainha_do_Sagrado_Coracao_de_Jesus.txt',
  'Ladainha pelas Almas': 'assets/Ladainha_pelas_Almas.txt',
  'Amado Jesus, José e Maria': 'assets/Amado_Jesus_Jose_e_Maria.txt',
  'Introdução ao Ofício da Imaculada Conceição da Virgem Maria':
      'assets/Introducao_ao_Oficio_da_Imaculada_Conceicao_da_Virgem_Maria.txt',
  'Lembrai-vos (Virgem Maria)': 'assets/Lembrai-vos_(Virgem_Maria).txt',
  'Maria Passa na Frente': 'assets/Maria_Passa_na_Frente.txt',
  'Ó Maria concebida sem pecado': 'assets/O_Maria_concebida_sem_pecado.txt',
  'Socorrei Maria': 'assets/Socorrei_Maria.txt',
  'Divino Pai Eterno': 'assets/Divino_Pai_Eterno.txt',
  'Os Sete Pai Nossos em honra ao Sangue de Jesus':
      'assets/Os_Sete_Pai_Nossos_em_honra_ao_Sangue_de_Jesus.txt',
  'Pai Eterno': 'assets/Pai_Eterno.txt',
  'Pelos falecidos': 'assets/Pelos_falecidos.txt',
  'Pelos filhos': 'assets/Pelos_filhos.txt',
  'Pelos mais necessitados': 'assets/Pelos_mais_necessitados.txt',
  'Pelos pais': 'assets/Pelos_pais.txt',
  'Pelos parentes ausentes': 'assets/Pelos_parentes_ausentes.txt',
  'Abri Senhor': 'assets/abri_senhor.txt',
  'À vossa proteção': 'assets/A_vossa_protecao.txt',
  'Para antes dos estudos': 'assets/Para_antes_dos_estudos.txt',
  'Para a família': 'assets/Para_a_familia.txt',
  'Para obter saúde': 'assets/Para_obter_saude.txt',
  'Para uma viagem': 'assets/Para_uma_viagem.txt'
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orações',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OracoesPage(),
    );
  }
}

class OracoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orações'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: temasOpcoesMap.keys.map((tema) {
            return TemaOracaoCard(
              tema: tema,
              opcoes: temasOpcoesMap[tema]!,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class TemaOracaoCard extends StatelessWidget {
  final String tema;
  final List<String> opcoes;

  TemaOracaoCard({required this.tema, required this.opcoes});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ExpansionTile(
        title: Text(
          tema,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: opcoes.map((opcao) {
          return OpcaoOracaoTile(
            opcao: opcao,
            arquivo: caminhosMap[opcao]!,
          );
        }).toList(),
      ),
    );
  }
}

class OpcaoOracaoTile extends StatelessWidget {
  final String opcao;
  final String arquivo;

  OpcaoOracaoTile({required this.opcao, required this.arquivo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(opcao),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OracaoPage(arquivo: arquivo)),
        );
      },
    );
  }
}

class OracaoPage extends StatelessWidget {
  final String arquivo;

  OracaoPage({required this.arquivo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oração'),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString(arquivo),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            final texto = snapshot.data!;
            final linhas = texto.split('\n');
            final primeiraLinha = linhas.isNotEmpty ? linhas[0] : '';
            final restante = linhas.skip(1).join('\n');

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          primeiraLinha,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8), // Espaçamento entre as linhas
                        if (restante.isNotEmpty) ...[
                          SizedBox(
                              height:
                                  8), // Espaçamento antes do restante do texto
                          Text(
                            restante,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
