#!/bin/bash
#set -e
##################################################################################################################
# Author    : Avshalom Zarviv
# Website   : https://www.avshalom-folio.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################


echo
tput setaf 3
echo "################################################################"
echo "################### Start"
echo "################################################################"
tput sgr0
echo


git config --global pull.rebase false
git config --global push.default simple
git config --global user.name "Avshalom-Ts"
git config --global user.email "avshalomz.ts@gmail.com"
sudo git config --system core.editor nano
#git config --global credential.helper cache
#git config --global credential.helper 'cache --timeout=32000'


git_user=$(git config user.name)
git_email=$(git config user.email)
echo "-----------------------------------------------------------------------------"
echo "Git New Credentials:"
echo "Git User Name: $git_user"
echo "Git User Email: $git_email"
echo "-----------------------------------------------------------------------------"

echo
tput setaf 3
echo "################################################################"
echo "################### End"
echo "################################################################"
tput sgr0
echo
