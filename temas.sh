#!/bin/bash

# URLs de los archivos en el repositorio de GitHub
URL_FONT="https://github.com/tirso25/dotfiles/raw/main/FiraCode-VariableFont_wght.ttf"
URL_THEME="https://github.com/tirso25/dotfiles/raw/main/Nordic-darker.tar.xz"
URL_ICONS="https://github.com/tirso25/dotfiles/raw/main/Tela-black.tar.xz"
URL_DRACULA_ICONS="https://github.com/tirso25/dotfiles/raw/main/dracula-icons-main.zip"
URL_CURSORS="https://github.com/tirso25/dotfiles/raw/main/material_light_cursors.zip"

# Directorios destino
DOWNLOAD_DIR="$HOME/Descargas"
FONT_DIR="$HOME/.local/share/fonts"
DEST_DIR_THEME="/usr/share/themes"
DEST_DIR_ICONS="/usr/share/icons"

# Nombres de los archivos descargados
FONT_FILE="FiraCode-VariableFont_wght.ttf"
FILE_NAME_THEME="Nordic-darker.tar.xz"
FILE_NAME_ICONS="Tela-black.tar.xz"
FILE_NAME_DRACULA_ICONS="dracula-icons-main.zip"
FILE_NAME_CURSORS="material_light_cursors.zip"

# Función para descargar y mover fuentes
download_and_move_font() {
    local url=$1
    local download_dir=$2
    local font_dir=$3
    local font_file=$4

    # Crear directorio de descargas si no existe
    mkdir -p "$download_dir"

    # Descargar la fuente
    echo "Descargando la fuente desde $url..."
    wget -q --show-progress -O "$download_dir/$font_file" "$url"

    if [ $? -ne 0 ]; then
        echo "Error: No se pudo descargar la fuente desde $url."
        exit 1
    fi

    # Crear directorio de fuentes locales si no existe
    mkdir -p "$font_dir"

    # Mover la fuente al directorio de fuentes locales
    echo "Moviendo la fuente a $font_dir..."
    cp "$download_dir/$font_file" "$font_dir"

    # Actualizar la caché de fuentes
    echo "Actualizando la caché de fuentes..."
    fc-cache -f -v

    # Verificar la instalación
    if fc-list | grep "$font_file"; then
        echo "Fuente instalada correctamente."
    else
        echo "Error al instalar la fuente."
        exit 1
    fi
}

# Función para descargar y descomprimir archivos
download_and_extract() {
    local url=$1
    local dest_dir=$2
    local file_name=$3

    echo "Descargando el archivo desde $url..."
    wget -q --show-progress $url -O $file_name

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

# Función para descomprimir cursores
extract_cursors() {
    local repo_url="https://github.com/tirso25/dotfiles.git"
    local cursors_file="material_light_cursors.zip"

    # Clonar el repositorio para obtener el archivo
    git clone --depth 1 $repo_url /tmp/dotfiles >/dev/null 2>&1

    # Descomprimir el archivo de cursores
    echo "Descomprimiendo cursores en $DEST_DIR_ICONS..."
    sudo unzip -q "/tmp/dotfiles/$cursors_file" -d $DEST_DIR_ICONS

    if [ $? -ne 0 ]; then
        echo "Error: No se pudo descomprimir el archivo $cursors_file."
        exit 1
    fi

    rm -rf /tmp/dotfiles
}

# Descargar y mover la fuente
download_and_move_font $URL_FONT $DOWNLOAD_DIR $FONT_DIR $FONT_FILE

# Descargar y descomprimir el tema
download_and_extract $URL_THEME $DEST_DIR_THEME $FILE_NAME_THEME

# Descargar y descomprimir los iconos
download_and_extract $URL_ICONS $DEST_DIR_ICONS $FILE_NAME_ICONS

# Descargar y descomprimir los iconos Dracula
download_and_extract $URL_DRACULA_ICONS $DEST_DIR_ICONS $FILE_NAME_DRACULA_ICONS

# Descomprimir los cursores
extract_cursors

echo "Instalación completada."
