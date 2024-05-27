#!/bin/bash
#####################################################################################
#############################
# Author    : Avshalom Zarviv
# Website   : https://www.avshalom-folio.com
#####################################################################################
#############################

echo
tput setaf 3
echo "################################################################"
echo "######### Serials of Commands To Add ssh into Github ###########"
echo "################################################################"
tput sgr0
echo

# 1. Generet a ssh keys
ssh-keygen -t ed25519 -C "avshalomz.ts@gmail.com"

# 2. Add your SSH private key to the ssh-agent
eval "$(ssh-agent -s)"

# 3. Copy the SSH public key to your clipboard.
cat ~/.ssh/id_ed25519.pub

echo
tput setaf 3
echo "################################################################"
echo "################### Copy the printed code to Github settings New SSH key"
echo "################################################################"
tput sgr0
echo
