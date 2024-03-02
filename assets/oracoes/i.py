import os

def renomear_arquivos(diretorio):
    # Lista todos os arquivos no diretório
    arquivos = os.listdir(diretorio)
    
    # Itera sobre cada arquivo
    for arquivo in arquivos:
        # Verifica se o arquivo contém '_imagem' no nome
        if '_imagem' in arquivo:
            # Novo nome do arquivo sem '_imagem'
            novo_nome = arquivo.replace('_imagem', '')
            
            # Caminho completo do arquivo antigo e novo
            caminho_antigo = os.path.join(diretorio, arquivo)
            caminho_novo = os.path.join(diretorio, novo_nome)
            
            # Renomeia o arquivo
            os.rename(caminho_antigo, caminho_novo)
            
            print(f"Arquivo {arquivo} renomeado para {novo_nome}")

# Diretório onde está o script
diretorio = os.path.dirname(os.path.abspath(__file__))

# Chama a função para renomear os arquivos no diretório atual
renomear_arquivos(diretorio)
