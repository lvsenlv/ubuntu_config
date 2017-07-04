#!/bin/bash

echo "Warning: make sure to run this script with super permit !"
echo "If not, use sudo to run this script !"

read -p "Continue, y or n ?" status
case $status in
    y | Y | yes | Yes | YES )
        if [ -f config/root_config.sh ];then
            bash config/root_config.sh
        else
            echo "*********************************************"
            echo "*** config/boot_config.sh doesn't exist ! ***"
            echo "*********************************************"
        fi
        
        if [ -f config/user_manage.sh ];then
            bash config/user_manage.sh
        else
            echo "*********************************************"
            echo "*** config/user_manage.sh doesn't exist ! ***"
            echo "*********************************************"
        fi

		if [ -f config/sshd_config.sh ];then
            cd config/
            bash sshd_config.sh
            cd ..
        else
            echo "*********************************************"
            echo "*** config/sshd_config.sh doesn't exist ! ***"
            echo "*********************************************"
        fi
        
        if [ -f config/clean.sh ];then
            bash config/clean.sh
        else
            echo "***************************************"
            echo "*** config/clean.sh doesn't exist ! ***"
            echo "***************************************"
        fi
        
        if [ -f config/install.sh ];then
            bash config/install.sh
        else
            echo "*****************************************"
            echo "*** config/install.sh doesn't exist ! ***"
            echo "*****************************************"
        fi

        if [ -f config/color_config.sh ];then
            cd config/
            bash color_config.sh
            cd ..
        else
            echo "**********************************************"
            echo "*** config/color_config.sh doesn't exist ! ***"
            echo "**********************************************"
        fi
        
        echo "**************************"
        echo "***                    ***"
        echo "*** FINISHI ALL CONFIG ***"
        echo "***                    ***"
        echo "**************************"
        
        read -p "Take effect after reboot. Reboot now, y or n ?" status2
        case $status2 in
            y | Y | yes | Yes | YES )
                reboot
                ;;
            * )
                echo "*****************************"
                echo "*** Reboot manually later ***"
                echo "*****************************"
                ;;
        esac

        ;;
	* )
        echo "***********************"
        echo "*** Stop all config ***"
        echo "***********************"
		;;
esac

