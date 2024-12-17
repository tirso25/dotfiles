#!/bin/bash

# Actualizar el sistema e instalar wget
sudo apt update
sudo apt install wget -y

# Script de instalación de VirtualBox y XAMPP en Ubuntu 22.04.5

# Función para manejar errores
handle_error() {
    echo "Error: $1"
    exit 1
}

# Verificar que se ejecuta con sudo
if [ "$EUID" -ne 0 ]; then
    echo "Por favor, ejecuta el script con sudo"
    exit 1
fi

# Actualizar repositorios
echo "Actualizando repositorios..."
apt update || handle_error "No se pudieron actualizar los repositorios"

# Instalar dependencias
echo "Instalando dependencias..."
apt install -y wget gpg || handle_error "No se pudieron instalar las dependencias"

# Importar clave GPG de VirtualBox
echo "Configurando repositorio de VirtualBox..."
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | gpg --dearmor -o /usr/share/keyrings/virtualbox.gpg || handle_error "No se pudo importar la clave GPG de VirtualBox"

# Añadir repositorio de VirtualBox
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/virtualbox.gpg] https://download.virtualbox.org/virtualbox/debian jammy contrib" | tee /etc/apt/sources.list.d/virtualbox.list || handle_error "No se pudo añadir el repositorio de VirtualBox"

# Actualizar repositorios de nuevo
apt update || handle_error "No se pudieron actualizar los repositorios después de añadir VirtualBox"

# Instalar VirtualBox
echo "Instalando VirtualBox..."
apt install -y virtualbox-6.1 || handle_error "No se pudo instalar VirtualBox"

# Descargar XAMPP
echo "Descargando XAMPP..."
wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run -O xampp-installer.run || handle_error "No se pudo descargar XAMPP"

# Hacer ejecutable el instalador de XAMPP
chmod +x xampp-installer.run || handle_error "No se pudo hacer ejecutable el instalador de XAMPP"

# Lanzar instalador de XAMPP (requiere interacción manual)
echo "Lanzando instalador de XAMPP. Sigue las instrucciones en pantalla."
./xampp-installer.run

# Limpiar archivos de instalación
rm xampp-installer.run

echo "Instalación completada. VirtualBox y XAMPP han sido instalados."
echo "Para iniciar XAMPP: sudo /opt/lampp/lampp start"
echo "Para detener XAMPP: sudo /opt/lampp/lampp stop"

# Instalar SQL, Tmux, y herramientas relacionadas
sudo apt-get install -y tmux tty-clock sqlite3 sqlitebrowser
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq

# Instalar Visual Studio Code
sudo apt install -y software-properties-common apt-transport-https
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code

# Instalar Java JDK
JDK="jdk-21_linux-x64_bin.deb"
wget https://download.oracle.com/java/21/latest/$JDK
sudo apt-get update
sudo apt-get install -f
sudo dpkg -i $JDK
echo "export PATH=\$PATH:/usr/lib/jvm/jdk-21-oracle-x64/bin" >> ~/.bashrc
source ~/.bashrc

#Instalar  TeamViwer
cd Descargas
wget https://download.teamviewer.com/download/linux/teamviewer-host_amd64.deb
sudo apt-get install ./teamviewer-host_amd64.deb

# Verificar la instalación de Java
javac --version

echo "Instalación completada. Puedes iniciar NetBeans escribiendo 'netbeans' y Eclipse escribiendo 'eclipse' en la terminal."


