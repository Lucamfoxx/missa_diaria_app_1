import os

# Diretório onde os arquivos TXT estão localizados
diretorio = "."

# Lista para armazenar os nomes dos arquivos TXT
nomes_arquivos = []

# Percorre todos os arquivos no diretório atual
for arquivo in os.listdir(diretorio):
    if arquivo.endswith(".txt"):
        # Adiciona o nome do arquivo à lista
        nomes_arquivos.append(arquivo)

# Abre o arquivo de destino para escrita
with open("nomes.txt", "w", encoding="utf-8") as arquivo_destino:
    # Percorre cada arquivo TXT encontrado
    for nome_arquivo in nomes_arquivos:
        # Abre o arquivo TXT
        with open(os.path.join(diretorio, nome_arquivo), "r", encoding="utf-8") as arquivo_origem:
            # Lê a primeira linha do arquivo
            primeira_linha = arquivo_origem.readline().strip()
            # Escreve no arquivo de destino no formato desejado
            arquivo_destino.write(f"'{primeira_linha}': 'assets/{nome_arquivo}',\n")

print("Arquivo 'nomes.txt' foi criado com sucesso!")
