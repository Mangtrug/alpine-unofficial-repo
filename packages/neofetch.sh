# Função para verificar se o pacote está instalado
check_dependency() {
    local package="$1"
    
    # Verifica se o pacote está instalado
    if apk info "$package" &> /dev/null; then
        echo -e "\e[1;34m>> O pacote $package está instalado.\e[0m"
    else
        echo -e "\e[1;31m> O pacote $package não está instalado.\e[0m"
        echo "tentando instalar $package..."
        apk add "$package"
    fi
}

echo -e "\e[1;32m>> verificando dependencias...\e[0m"
check_dependency unzip
check_dependency zip

echo -e "\e[1;32m>> baixando...\e[0m"
wget https://github.com/dylanaraps/neofetch/archive/refs/tags/7.1.0.zip

echo -r "\e[1;32m>> descompactando 7.1.0.zip...\e[0m"
unzip 7.1.0.zip
rm -rf 7.1.0.zip
