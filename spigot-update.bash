#!/bin/bash

#Variables
dir="/home/buildtools"
buildtoolslink="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
buildtoolsfile="BuildTools.jar"
mcfolder="/home/minecraft"
mcjar="server.jar"
mcversion="latest"
mcrestartcmd="/etc/init.d/minecraft restart"

#Update
mkdir $dir
cd $dir 
wget "$buildtoolslink" -O $buildtoolsfile
git config --global --unset core.autocrlf
java -jar $buildtoolsfile --rev $mcversion
cp spigot*.jar $mcfolder/$mcjar

#Redémarrage du serveur (option)
#$mcrestartcmd
