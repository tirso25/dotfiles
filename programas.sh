#!/bin/bash

#SQL + TMUX 
sudo apt-get install tmux tty-clock sqlite3 sqlitebrowser 

#VSCODE 
sudo apt install software-properties-common apt-transport-https wget -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

#JAVA
JDK="jdk-21_linux-x64_bin.deb"
wget https://download.oracle.com/java/21/latest/$JDK
sudo apt-get update
sudo apt-get install -f
sudo dpkg -i $JDK
echo "export PATH=$PATH:/usr/lib/jvm/jdk-21-oracle-x64/bin" >> ~/.bashrc
javac --versionS
