#!/bin/bash

read -p "Configure color, y or n ?" status
case $status in
    y | Y | yes | Yes | YES )
        COLOR_CONFIG_FILE_PATH=`pwd`
        read -p "Configure the current user, y or n ?" status2
        case $status in
            y | Y | yes | Yes | YES )
                cd ~/ 
                ;;
            * )
                read -p "Please input the user you want do configure" UserName
                if [ "$UserName" = "root" ];then
                    cd /root
                else
                    if [ -d /home/$UserName ];then
                        cd /home/$UserName/
                    else
                        echo "***$UserName  doesn't exist***"
                        echo "***Stop configuring color***"
                        exit 0
                    fi
                fi
                ;;
        esac

        if [ -f .bashrc ];then
            cat $COLOR_CONFIG_FILE_PATH/.bashrc1 >> .bashrc
        else
            cat $COLOR_CONFIG_FILE_PATH/.bashrc2 > .bashrc
        fi 

        echo "Configure dircolors......"
        echo "1. 256dark"
        echo "2. light"
        echo "3. dark"
        echo "4. universal"
        read -p "Which one do you want to install ?" choice2
        case $choice2 in
            1 )
                cat $COLOR_CONFIG_FILE_PATH/dircolors/dircolors.256dark > .dircolors
                echo "***Success***"
                ;;
            2 )
                cat $COLOR_CONFIG_FILE_PATH/dircolors/dircolors.ansi-light > .dircolors
                echo "***Success***"
                ;;
            3 )
                cat $COLOR_CONFIG_FILE_PATH/dircolors/dircolors.ansi-dark > .dircolors
                echo "***Success***"
                ;;
            4 )
                cat $COLOR_CONFIG_FILE_PATH/dircolors/dircolors.ansi-universal > .dircolors
                echo "***Success***"
                ;;
            * )
                echo "***Stop configuring dircolors***"
                ;;
        esac

        echo "***Finish configuring color***"
        ;;
    * )
        echo "***Stop configuring color***"
esac

