#!/bin/bash

read -p "Remove softwares that installed in advance, y or n ?" status
case $status in
	y | Y | yes | Yes | YES )
		apt-get remove libreoffice-common
		apt-get remove unity-webapps-common
		apt-get remove onboard deja-dup
		apt-get remove thunderbird totem simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca webbrowser-app gnome-sudoku
		apt-get remove rhythmbox empathy brasero landscape-client-ui-install
		apt-get clean
		apt-get autoremove
		echo "***Finish removing***"
		;;
	* )
		echo "***Stop removing***"
		;;
esac

