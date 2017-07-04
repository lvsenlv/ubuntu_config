#!/bin/bash

SSH_PATH=`pwd`

read -p "configure ssh server, y or n ?" status
case $status in
    y | Y | yes | Yes | YES )
        apt-get update		
        apt-get install -y openssh-server
        service sshd start
        ufw disable
        apt-get remove -y iptables

        echo "****************************************"
        echo "*** Finish installing openssh-server ***"
        echo "*** Finish removing iptables         ***"
        echo "****************************************"

        read -p "Enable remote login, y or n ?" status2
        case $status2 in
            y | Y | yes | Yes | YES )
                if [ -f /etc/ssh/sshd_config ];then
                    cd /etc/ssh/
                    sed -i '/Port/c Port 22' sshd_config 
                    echo "*****************"
                    echo "*** Port 22 ! ***"
                    echo "*****************"

                    sed -i '/Protocol/c Protocol 2' sshd_config
                    echo "********************"
                    echo "*** Protocol 2 ! ***"
                    echo "********************"

                    sed -i '/^PermitRootLogin/c PermitRootLogin yes' sshd_config
                    cat $SSH_PATH/.algorithm >> sshd_config
                    echo "************************************"
                    echo "*** You can login remotely now ! ***"
                    echo "************************************"
                else
                    echo "*********************************************"
                    echo "*** /etc/ssh/sshd_config  doesn't exist ! ***"
                    echo "*********************************************"
                fi

                echo "*****************************************"
                echo "*** Finish configuring openssh-server ***"
                echo "*****************************************"
                ;;
            * )
                echo "****************************"
                echo "*** Disable remote login ***"
                echo "****************************"
                ;;
        esac

        service sshd restart
        ;;
    * )
        echo "***************************************"
        echo "*** Stop configuring openssh-server ***"
        echo "***************************************"
        ;;
esac

