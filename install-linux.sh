#!/bin/bash

## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

## Atualizando o repositório ##
sudo apt-get update && sudo apt-get upgrade &&

## Deixado python3 como padrao ##
sudo ln -sf /usr/bin/python3.6 /usr/bin/python && 

#Instalando sublime text ##
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && 
sudo apt-get install apt-transport-https &&
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list &&
sudo apt-get update &&
sudo apt-get install sublime-text -y &&

## Instalando aplicativos apt ##
sudo apt-get install git -y &&
sudo apt-get install lxqt-sudo -y &&
sudo apt-get install mysql-workbench -y &&
sudo apt-get python-pip -y &&
sudo apt-get install gitg -y &&
sudo apt-get install plank -y &&
sudo apt-get install steam-installer -y && 
sudo apt-get install xz-utils -y &&
sudo apt-get install snapd &&

## Instalando aplicativos snap ##
sudo snap install spotify &&

## Configurando tema ##
mkdir .themes &&
mkdir .icons &&

## Baixando o tema ##
cd .themes &&
wget -c https://dllb2.pling.com/api/files/download/id/1572858060/s/a652c10bb6a6d59324acc411a85b065a08d5b353be83431b300ac9a75bb0ff7ca137e7b6998284a080b081ab13d058cb9a6103b29938ed2b90f9cbb719767c6a/t/1573828846/c/a652c10bb6a6d59324acc411a85b065a08d5b353be83431b300ac9a75bb0ff7ca137e7b6998284a080b081ab13d058cb9a6103b29938ed2b90f9cbb719767c6a/lt/download/Mojave-dark.tar.xz &&
tar -Jxf *.tar.xz &&

## Baixando icones ##
cd ../.icons &&
wget -c https://dllb2.pling.com/api/files/download/id/1563458272/s/9080ce27387bcfcc5735c496ed1ef48194f563524084d8c4cce1a0a3cc9d4d9333a8ab9bb6c8d5be1de8315c8063723b7a067b51977304ea1c6ad3f9378222d7/t/1573828869/c/a652c10bb6a6d59324acc411a85b065a08d5b353be83431b300ac9a75bb0ff7ca137e7b6998284a080b081ab13d058cb9a6103b29938ed2b90f9cbb719767c6a/lt/download/El_Capitan_CursorsMOD_1.1.0.zip &&
wget -c https://dllb2.pling.com/api/files/download/id/1572778459/s/304f21818facdcbea137533f914a0f613a6a29b66ee0c39a617db728f8edad5623b6a87fc0dab941a73c0bd4c091b064bb6da1261f0bb5d954edcb47575a8e81/t/1573828860/c/a652c10bb6a6d59324acc411a85b065a08d5b353be83431b300ac9a75bb0ff7ca137e7b6998284a080b081ab13d058cb9a6103b29938ed2b90f9cbb719767c6a/lt/download/korla_1-2-0.zip &&
unzip korla_1-2-0.zip &&
unzip El_Capitan_CursorsMOD_1.1.0.zip &&

## Configurando pastas para software externos ##
mkdir /home/$USER/Downloads/softwares &&
cd /home/$USER/Downloads/softwares && 

## Softwares que precisam de download externo ##
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && 
wget -c https://az764295.vo.msecnd.net/stable/8795a9889db74563ddd43eb0a897a2384129a619/code_1.40.1-1573664190_amd64.deb &&

sudo dpkg -i *.deb &&

## Instalando o arduino ##
wget -c https://downloads.arduino.cc/arduino-1.8.10-linux64.tar.xz &&
tar -Jxf arduino-1.8.10-linux64.tar.xz &&
mv arduino-1.8.10 /home/$USER/

## Instalando o xampp ##
wget -c https://downloadsapachefriends.global.ssl.fastly.net/7.3.11/xampp-linux-x64-7.3.11-0-installer.run?from_af=true &&
chomd +x *.run &&
sudo ./*.run &&

## Criando lancadores ##
echo -e '[Desktop Entry]\n Version=1.0\n Name=arduino\n Exec=lxqt-sudo /home/kastrowalker/arduino-1.8.10/arduino\n Icon=/home/kastrowalker/arduino-1.8.10/lib/arduino_icon.ico\n Type=Application\n Categories=Development;Documentation' | sudo tee /usr/share/applications/arduino.desktop &&
echo -e '[Desktop Entry]\n Version=1.0\n Name=xampp\n Exec=lxqt-sudo /opt/lampp/manager-linux-x64.run\n Icon=/opt/lampp/htdocs/favicon.ico\n Type=Application\n Categories=Development;Documentation' | sudo tee /usr/share/applications/xampp.desktop &&

## Configurando o git ##
ssh-keygen -o
git config --global user.name "KastroWalker" &&
git config --global user.email "victorcsa2002@gmail.com" &&

echo "Configurado com sucesso!"