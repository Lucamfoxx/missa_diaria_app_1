from PIL import Image
import os

def resize_images_in_directory(target_size_kb):
    # Diretório atual
    current_directory = os.getcwd()

    # Loop através de todos os arquivos na pasta atual
    for filename in os.listdir(current_directory):
        if filename.endswith(".jpg"):
            # Constrói o caminho completo para a imagem
            input_image_path = os.path.join(current_directory, filename)

            # Redimensiona apenas se o tamanho for maior que o alvo
            if os.path.getsize(input_image_path) > target_size_kb * 1024:
                output_image_path = os.path.join(current_directory, "resized_" + filename)
                resize_image(input_image_path, output_image_path, target_size_kb)

def resize_image(input_image_path, output_image_path, target_size_kb):
    # Carrega a imagem
    original_image = Image.open(input_image_path)

    # Calcula a qualidade de compressão inicial
    quality = 90

    # Loop até obter o tamanho desejado
    while os.path.getsize(output_image_path) > target_size_kb * 1024 and quality > 10:
        # Redimensiona a imagem com a qualidade atual
        original_image.save(output_image_path, quality=quality, optimize=True)

        # Atualiza a qualidade para próxima iteração
        quality -= 5

    # Salva a imagem final
    original_image.save(output_image_path)

# Exemplo de uso
target_size_kb = 900  # Tamanho máximo desejado em kilobytes

resize_images_in_directory(target_size_kb)
