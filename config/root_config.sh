#!/bin/bash

read -p "Use the root user to login, y or n ?" status

case $status in
	y | Y | yes | Yes | YES )
		if [ -f /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf ];then
			cd /usr/share/lightdm/lightdm.conf.d/
			sed -i '2, $d' 50-ubuntu.conf
			sed -i '1a user-session=ubuntu\ngreeter-show-manual-login=true' 50-ubuntu.conf
			echo "***Success***"

			read -p "Login root user automatically, y or n ?" status2
			case $status2 in
				y | Y | yes | Yes | YES )
					sed -i '$a autologin-user=root\nautologin-user-timeout=0' 50-ubuntu.conf
					echo "***Success***"
					;;
				* )
					echo "***Ban logining automatically***"
					;;
			esac

			read -p "Ban logining guest user, y or n ?" status3
			case $status3 in
				y | Y | yes | Yes | YES )
					sed -i '$a allow-guest=false' 50-ubuntu.conf
					echo "***Success***"
					;;
				* )
					echo "***Don't ban***"
					;;
			esac

			if [ -f /root/.profile ];then
				cd /root/
				sed -i '/mesg/c tty -s && mesg n || true' .profile
			else
				echo "***/root/.profile  doesn't exist!***"
			fi

			passwd root

			echo "***Finish configuring root***"
			echo "***Take effect after reboot***"
		else
			echo "***/usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf  doesn't exist !***"
		fi
		;;
	* )
		echo "***Stop configuring root***"
		;;
esac

