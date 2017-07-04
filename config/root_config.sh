#!/bin/bash

read -p "Enable root user login, y or n ?" status

case $status in
    y | Y | yes | Yes | YES )
        if [ -f /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf ];then
            cd /usr/share/lightdm/lightdm.conf.d/
            sed -i '2, $d' 50-ubuntu.conf
            sed -i '1a user-session=ubuntu\ngreeter-show-manual-login=true' 50-ubuntu.conf
            echo "***************"
            echo "*** Success ***"
            echo "***************"
            
            read -p "Enable automatic login of root user, y or n ?" status2
            case $status2 in
                y | Y | yes | Yes | YES )
                    sed -i '$a autologin-user=root\nautologin-user-timeout=0' 50-ubuntu.conf
                    echo "***************"
                    echo "*** Success ***"
                    echo "***************"
                    ;;
                * )
                    echo "*******************************"
                    echo "*** Disable automatic login ***"
                    echo "*******************************"
                    ;;
            esac
			
            read -p "Disable guest user login, y or n ?" status3
            case $status3 in
                y | Y | yes | Yes | YES )
                    sed -i '$a allow-guest=false' 50-ubuntu.conf
                    echo "***************"
                    echo "*** Success ***"
                    echo "***************"
                    ;;
                * )
                    echo "********************"
                    echo "*** Not disabled ***"
                    echo "********************"
                    ;;
            esac

            if [ -f /root/.profile ];then
                cd /root/
                sed -i '/mesg/c tty -s && mesg n || true' .profile
            else
                echo "*************************************"
                echo "*** /root/.profile doesn't exist! ***"
                echo "*************************************"
            fi

            passwd root

            echo "********************************"
            echo "*** Finish configuring root  ***"
            echo "*** Take effect after reboot ***"
            echo "********************************"
        else
            echo "************************************************************************"
            echo "*** /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf doesn't exist ! ***"
            echo "************************************************************************"
        fi
        ;;
    * )
        echo "*****************************"
        echo "*** Stop configuring root ***"
        echo "*****************************"
        ;;
esac

