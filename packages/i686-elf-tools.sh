#!/bin/sh

# Função para verificar dependências
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

# Garantir que o diretório de cache exista
mkdir -p "$CACHE_DIR"

# Mudar para o diretório de cache
cd "$CACHE_DIR" || { echo -e "\e[1;31mErro ao acessar o diretório de cache.\e[0m"; exit 1; }

# Verificar dependências
check_dependency wget
check_dependency unzip
check_dependency zip

# Baixar o arquivo
echo -e "\e[1;32mBaixando i686-elf-tools...\e[0m"
wget https://github.com/lordmilko/i686-elf-tools/releases/download/13.2.0/i686-elf-tools-linux.zip || { echo -e "\e[1;31mErro ao baixar o arquivo.\e[0m"; exit 1; }

# Extrair o arquivo
echo -e "\e[1;32mExtraindo o arquivo...\e[0m"
unzip i686-elf-tools-linux.zip || { echo -e "\e[1;31mErro ao extrair o arquivo.\e[0m"; exit 1; }

# Limpar o arquivo zip
echo -e "\e[1;32mLimpando o arquivo zip...\e[0m"
rm -f i686-elf-tools-linux.zip

echo -e "\e[1;32mInstalação concluída com sucesso.\e[0m"
