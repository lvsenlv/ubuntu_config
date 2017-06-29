#!/bin/bash

read -p "Install common softwares, y or n ?" status
case $status in
	y | Y | yes | Yes | YES )
		
        read -p "Update before install, y or n ?" status2
        case $status2 in
            y | Y | yes | Yes | YES )
                apt-get update
                ;;
            * )
                ;;
        esac

		apt-get install -y vim
        apt-get install -y git
		
        echo "***Finish installing***"
		
        ;;
	* )
		echo "***Stop installing***"
		;;
esac
