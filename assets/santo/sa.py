import os

pasta = os.getcwd()  # Pasta atual onde o script está
extensao = '.txt'  # Extensão dos arquivos que serão renomeados

# Lista todos os arquivos na pasta com a extensão .txt
arquivos_txt = [arquivo for arquivo in os.listdir(pasta) if arquivo.endswith(extensao)]

# Renomeia os arquivos
for arquivo in arquivos_txt:
    novo_nome = arquivo[:5] + extensao  # Mantém apenas os primeiros 5 caracteres do nome
    os.rename(os.path.join(pasta, arquivo), os.path.join(pasta, novo_nome))

print("Renomeação concluída!")
