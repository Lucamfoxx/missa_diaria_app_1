import os
import re

def adicionar_ponto(arquivo):
    with open(arquivo, 'r', encoding='utf-8') as f:
        texto = f.read()

    # Usar expressão regular para encontrar números e adicionar um ponto ao lado deles
    texto_formatado = re.sub(r'(\d+)', r'\1.', texto)

    # Salvar o arquivo com o texto formatado
    with open(arquivo, 'w', encoding='utf-8') as f:
        f.write(texto_formatado)

def main():
    # Diretório onde o script está localizado
    diretorio = os.path.dirname(os.path.realpath(__file__))

    # Percorrer todos os arquivos no diretório
    for arquivo in os.listdir(diretorio):
        if arquivo.endswith('.txt'):
            caminho_arquivo = os.path.join(diretorio, arquivo)
            adicionar_ponto(caminho_arquivo)
            print(f'Arquivo {arquivo} processado com sucesso.')

if __name__ == "__main__":
    main()
