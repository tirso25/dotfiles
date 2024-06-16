#!/bin/bash

# URLs de los archivos en el repositorio de GitHub
URL_THEME="https://github.com/tirso25/dotfiles/raw/main/Nordic-darker.tar.xz"
URL_ICONS="https://github.com/tirso25/dotfiles/raw/main/Tela-black.tar.xz"
URL_DRACULA_ICONS="https://github.com/tirso25/dotfiles/raw/main/dracula-icons-main.zip"

# Directorios destino
DEST_DIR_THEME="/usr/share/themes"
DEST_DIR_ICONS="/usr/share/icons"

# Nombres de los archivos descargados
FILE_NAME_THEME="Nordic-darker.tar.xz"
FILE_NAME_ICONS="Tela-black.tar.xz"
FILE_NAME_DRACULA_ICONS="dracula-icons-main.zip"

# Función para descargar y descomprimir archivos
download_and_extract() {
    local url=$1
    local dest_dir=$2
    local file_name=$3

    echo "Descargando el archivo desde $url..."
    wget $url -O $file_name

    if [ $? -ne 0 ]; then
        echo "Error: No se pudo descargar el archivo desde $url."
        exit 1
    fi

    echo "Descomprimiendo el archivo en $dest_dir..."
    if [[ $file_name == *.tar.xz ]]; then
        sudo tar -xf $file_name -C $dest_dir
    elif [[ $file_name == *.zip ]]; then
        sudo unzip -q $file_name -d $dest_dir
    else
        echo "Error: Formato de archivo no soportado para $file_name."
        exit 1
    fi

    if [ $? -ne 0 ]; then
        echo "Error: No se pudo descomprimir el archivo $file_name."
        exit 1
    fi

    rm $file_name
}

# Descargar y descomprimir el tema
download_and_extract $URL_THEME $DEST_DIR_THEME $FILE_NAME_THEME

# Descargar y descomprimir los iconos
download_and_extract $URL_ICONS $DEST_DIR_ICONS $FILE_NAME_ICONS

# Descargar y descomprimir los iconos Dracula
download_and_extract $URL_DRACULA_ICONS $DEST_DIR_ICONS $FILE_NAME_DRACULA_ICONS

echo "Instalación completada."
