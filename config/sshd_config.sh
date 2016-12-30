#!/bin/bash

PTAH=`pwd`

read -p "Configure openssh-server, y or n ?" status
case $status in
	y | Y | yes | Yes | YES )
		apt-get update		
		apt-get install openssh-server
		service sshd start
		ufw disable
		apt-get remove iptables
		echo "***Finish installing openssh-server***"
        echo "***Finish remove iptables***"

		read -p "Login remotely, y or n ?" status2
		case $status2 in
			y | Y | yes | Yes | YES )
				if [ -f /etc/ssh/sshd_config ];then
					cd /etc/ssh/
					sed -i '/Port/c Port 22' sshd_config
					echo "Port 22 !"
					sed -i '/Protocol/c Protocol 2' sshd_config
					echo "Protocol 2 !"
					sed -i '/^PermitRootLogin/c PermitRootLogin yes' sshd_config
					cat $PATH/.algorithm >> sshd_config
                    echo "***Allow to login remotely***"
				else
					echo "***/etc/ssh/sshd_config  doesn't exist !***"
				fi
		
				echo "***Finish configuring openssh-server***"
				;;
			* )
				echo "***Ban logining remotely***"
				;;
		esac

		service sshd restart
		;;
	* )
		echo "***Stop configuring openssh-server***"
		;;
esac

