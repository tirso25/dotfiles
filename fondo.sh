#!/bin/bash

# URL de la imagen en el repositorio de GitHub
IMAGE_URL="https://github.com/tirso25/dotfiles/raw/main/FONDO.png"

# Directorio de descargas
DOWNLOAD_DIR="$HOME/Descargas"

# Nombre del archivo a guardar
FILE_NAME="FONDO.png"

# Descargar la imagen
wget -O "$DOWNLOAD_DIR/$FILE_NAME" "$IMAGE_URL"

# Verificar si la descarga fue exitosa
if [ $? -eq 0 ]; then
    echo "La imagen se ha descargado correctamente en $DOWNLOAD_DIR/$FILE_NAME"
else
    echo "Hubo un problema al descargar la imagen"
fi
