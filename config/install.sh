#!/bin/bash

read -p "Following softwares would be installed
    vim
    git
continue, y or n ?" status
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

        echo "*************************"
        echo "*** Finish installing ***"
        echo "*************************"

        ;;
    * )
        echo "***********************"
        echo "*** Stop installing ***"
        echo "***********************"
        ;;
esac
