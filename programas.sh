#!/bin/bash

# Actualizar el sistema e instalar wget
sudo apt update
sudo apt install wget -y

# Descargar y configurar Apache NetBeans
NETBEANS_VERSION="17"
wget https://downloads.apache.org/netbeans/netbeans/$NETBEANS_VERSION/Apache-NetBeans-$NETBEANS_VERSION-bin-linux-x64.sh
chmod +x Apache-NetBeans-$NETBEANS_VERSION-bin-linux-x64.sh
./Apache-NetBeans-$NETBEANS_VERSION-bin-linux-x64.sh

# Descargar y configurar Eclipse
ECLIPSE_VERSION="2023-06"
ECLIPSE_FILE="eclipse-jee-$ECLIPSE_VERSION-R-linux-gtk-x86_64.tar.gz"
wget https://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/$ECLIPSE_VERSION/R/$ECLIPSE_FILE
tar -xvzf $ECLIPSE_FILE
sudo mv eclipse /opt/

# Crear enlace simbólico para Eclipse
sudo ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse

# Crear acceso directo para Eclipse
sudo bash -c 'cat > /usr/share/applications/eclipse.desktop <<EOL
[Desktop Entry]
Name=Eclipse IDE
Type=Application
Exec=/opt/eclipse/eclipse
Terminal=false
Icon=/opt/eclipse/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=Eclipse
EOL'

# Limpieza de archivos descargados
rm Apache-NetBeans-$NETBEANS_VERSION-bin-linux-x64.sh
rm $ECLIPSE_FILE

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

# Verificar la instalación de Java
javac --version

echo "Instalación completada. Puedes iniciar NetBeans escribiendo 'netbeans' y Eclipse escribiendo 'eclipse' en la terminal."


