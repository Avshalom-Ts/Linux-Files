#!/bin/bash
while true; do

read -p "Do you want to proceed? (y/n) " yn

case $yn in
	[yY] ) echo ok, we will proceed;
		break;;
	[nN] ) echo exiting...;
		exit;;
	* ) echo invalid response ${yn};;
esac

done

echo doing stuff...
