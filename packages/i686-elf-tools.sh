#!/bin/sh
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

check_dependency wget
check_dependency unzip
check_dependency zip

wget https://github.com/lordmilko/i686-elf-tools/releases/download/13.2.0/i686-elf-tools-linux.zip
