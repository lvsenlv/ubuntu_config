#!/bin/bash

echo "Warning: Make sure that you have the super permit to run this shell !"
echo "If no, use command of sudo to run this shell !"

read -p "Continue to configure, y or n ?" status
case $status in
	y | Y | yes | Yes | YES )
		if [ -f config/root_config.sh ];then
			bash config/root_config.sh
	    else
			echo "***config/boot_config.sh  doesn't exist***"
		fi
		
		if [ -f config/user_manage.sh ];then
			bash config/user_manage.sh
		else
			echo "***config/user_manage.sh  doesn't exist***"
		fi

		if [ -f config/sshd_config.sh ];then
			cd config/
            bash sshd_config.sh
            cd ..
		else
			echo "***config/sshd_config.sh  doesn't exist***"
		fi

		if [ -f config/clean.sh ];then
			bash config/clean.sh
		else
			echo "***config/clean.sh  doesn't exist***"
		fi

		if [ -f config/install.sh ];then
			bash config/install.sh
		else
			echo "***config/install.sh  doesn't exist!***"
		fi

        if [ -f config/color_config.sh ];then
            cd config/
            bash color_config.sh
            cd ..
        else
            echo "***config/color_config.sh  doesn't exist!***"
        fi
        
        echo "******FINISHI ALL CONFIG******"
        
        read -p "Take effect after reboot, reboot now, y or n ?" status2
        case $status2 in
            y | Y | yes | Yes | YES )
                reboot
                ;;
            * )
                echo "***Reboot manually later***"
                ;;
        esac

        ;;
	* )
		echo "***Stop all config***"
		;;
esac

