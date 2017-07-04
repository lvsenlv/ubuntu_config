#!/bin/bash

read -p "Remove pre-installed softwares, y or n ?" status
case $status in
    y | Y | yes | Yes | YES )
        read -p "Following softwares would be removed,
        libreoffice-common           unity-webapps-common
        onboard                      deja-dup
        thunderbird                  totem 
        simple-scan                  gnome-mahjongg 
        aisleriot                    gnome-mines 
        cheese                       transmission-common 
        gnome-orca                   webbrowser-app 
        gnome-sudoku                 rhythmbox 
        empathy                      brasero 
        landscape-client-ui-install
continue, y or n ?" status2
        case $status2 in
            y | Y | yes | Yes | YES )
                apt-get remove -y libreoffice-common
                apt-get remove -y unity-webapps-common
                apt-get remove -y onboard deja-dup
                apt-get remove -y thunderbird totem simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca webbrowser-app gnome-sudoku
                apt-get remove -y rhythmbox empathy brasero landscape-client-ui-install
                apt-get clean
                apt-get autoremove
                echo "***********************"
                echo "*** Finish removing ***"
                echo "***********************"
                ;;
            * )
                echo "*********************"
                echo "*** Stop removing ***"
                echo "*********************"
                ;;
        esac
        ;;
    * )
        echo "*********************"
        echo "*** Stop removing ***"
        echo "*********************"
        ;;
esac

