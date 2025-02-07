#!/bin/bash

# Função para verificar se o pacote está instalado
check_dependency() {
    local package="$1"
    
    # Verifica se o pacote está instalado
    if apk info "$package" &> /dev/null; then
        echo -e "\e[1;34m>> O pacote $package está instalado.\e[0m"
    else
        echo -e "\e[1;31m> O pacote $package não está instalado.\e[0m"
        echo "Tentando instalar $package..."
        apk add "$package" || { echo -e "\e[1;31mErro ao instalar $package. Abortando.\e[0m"; exit 1; }
    fi
}

echo -e "\e[1;32m>> Verificando dependências...\e[0m"
check_dependency unzip
check_dependency zip

echo -e "\e[1;32m>> Baixando Neofetch...\e[0m"
wget -q https://github.com/dylanaraps/neofetch/archive/refs/tags/7.1.0.zip || { echo -e "\e[1;31mErro ao baixar o arquivo.\e[0m"; exit 1; }

echo -e "\e[1;32m>> Descompactando 7.1.0.zip...\e[0m"
unzip 7.1.0.zip || { echo -e "\e[1;31mErro ao descompactar o arquivo.\e[0m"; exit 1; }
rm -f 7.1.0.zip  # Remove o arquivo zip após extrair

echo -e "\e[1;32m>> Copiando binário para /usr/local/bin...\e[0m"
sudo cp neofetch-7.1.0/neofetch /usr/local/bin || { echo -e "\e[1;31mErro ao copiar o binário.\e[0m"; exit 1; }

echo -e "\e[1;32m>> Limpando arquivos temporários...\e[0m"
rm -rf neofetch-7.1.0

echo -e "\e[1;32m>> Script concluído com sucesso!\e[0m"
