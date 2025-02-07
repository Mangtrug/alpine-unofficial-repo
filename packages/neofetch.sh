# Função para verificar se o pacote está instalado
check_dependency() {
    local package="$1"
    
    # Verifica se o pacote está instalado
    if apk info "$package" &> /dev/null; then
        echo "> O pacote $package está instalado."
    else
        echo -e "\e[1;31m> O pacote $package não está instalado.\e[0m"
        echo "tentando instalar $package..."
        apk add "$package"
        # Aqui você pode decidir se quer instalar a dependência ou não
        # Exemplo: apk add "$package" para instalar
    fi
}

check_dependency unzip
check_dependency zip

# wget https://github.com/dylanaraps/neofetch/archive/refs/tags/7.1.0.zip

