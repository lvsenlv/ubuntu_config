#!/bin/bash

read -p "Delete certain user, y or n ? " status
case $status in
	y | Y | yes | Yes | YES )
		read -p "Please input the user name you want to delete: " UserName
		read -p "Retain the data of $UserName, y or n ?" status2
		case $status2 in
			y | Y | yes | Yes | YES )
				userdel $UserName
				echo "***Finish deleting***"
				;;
			* )
				read -p "Delete all data of $UserName, y or n ?" status3
				case $status3 in
					y | Y | yes | Yes | YES )
						userdel -r $UserName
						echo "***Finish deleting***"
						;;
					* )
						echo "***Stop deleting***"
						;;
				esac
				;;
		esac
		;;
	* )
		echo "***Stop deleting***"
		;;
esac
		
