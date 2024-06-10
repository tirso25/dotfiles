#!/bin/bash

# URLs de los archivos en el repositorio de GitHub
URL_THEME="https://github.com/tirso25/dotfiles/raw/main/Nordic-darker.tar.xz"
URL_ICONS="https://github.com/tirso25/dotfiles/raw/main/Tela-black.tar.xz"

# Directorios destino
DEST_DIR_THEME="/usr/share/themes"
DEST_DIR_ICONS="/usr/share/icons"

# Nombres de los archivos descargados
FILE_NAME_THEME="Nordic-darker.tar.xz"
FILE_NAME_ICONS="Tela-black.tar.xz"

# Descargar el archivo del tema
echo "Descargando el archivo del tema desde GitHub..."
wget $URL_THEME -O $FILE_NAME_THEME

# Verificar si la descarga del tema fue exitosa
if [ $? -ne 0 ]; then
    echo "Error: No se pudo descargar el archivo del tema."
    exit 1
fi

# Descargar el archivo de los iconos
echo "Descargando el archivo de los iconos desde GitHub..."
wget $URL_ICONS -O $FILE_NAME_ICONS

# Verificar si la descarga de los iconos fue exitosa
if [ $? -ne 0 ]; then
    echo "Error: No se pudo descargar el archivo de los iconos."
    exit 1
fi

# Crear el directorio destino del tema si no existe
if [ ! -d "$DEST_DIR_THEME" ]; then
    echo "Creando el directorio $DEST_DIR_THEME..."
    sudo mkdir -p $DEST_DIR_THEME
fi

# Crear el directorio destino de los iconos si no existe
if [ ! -d "$DEST_DIR_ICONS" ]; then
    echo "Creando el directorio $DEST_DIR_ICONS..."
    sudo mkdir -p $DEST_DIR_ICONS
fi

# Descomprimir el archivo del tema en el directorio destino
echo "Descomprimiendo el archivo del tema en $DEST_DIR_THEME..."
sudo tar -xf $FILE_NAME_THEME -C $DEST_DIR_THEME

# Verificar si la descompresión del tema fue exitosa
if [ $? -ne 0 ]; then
    echo "Error: No se pudo descomprimir el archivo del tema."
    exit 1
fi

# Descomprimir el archivo de los iconos en el directorio destino
echo "Descomprimiendo el archivo de los iconos en $DEST_DIR_ICONS..."
sudo tar -xf $FILE_NAME_ICONS -C $DEST_DIR_ICONS

# Verificar si la descompresión de los iconos fue exitosa
if [ $? -ne 0 ]; then
    echo "Error: No se pudo descomprimir el archivo de los iconos."
    exit 1
fi

# Eliminar los archivos descargados
rm $FILE_NAME_THEME
rm $FILE_NAME_ICONS

echo "Tema instalado exitosamente en $DEST_DIR_THEME."
echo "Iconos instalados exitosamente en $DEST_DIR_ICONS."
