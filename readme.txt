*****************************************************************************

***Copyright lvsenlv***2016.10.29***

***dircolors quotes from seebi***
https://github.com/seebi/dircolors-solarized

***vimrc quotes from amix***
https://github.com/amix/vimrc


*****************************************************************************
***Struction***

all_config.sh is used to configure the linux environment.

config is a directoy which contains all necessary scripts and packages.

config_checksum is used to check the md5 value.

connection.md expounds the trouble of connection when using ssh to connect the ubuntu which installed in the virtual machine, such as VMware and Virtual box. 

*****************************************************************************
***How to use***

1. Check md5 value, run that code in the directory of config_files:

    md5sum -c config_checksum

Only all result displayd is ok could continue to next step.

2. Run all_config (make sure that you have a super permit)

If you don't have a super permit ,run this code:

    sudo ./all_config

If you have a super permit ,run this code:
    ./all_config

#According the information when runing all_config to make a choice.

    #bash algotiation.sh

3. If you use the virtual machine to run the ubuntu system, you should make sure that do not use the way of NAT to configure the virtual machine. You are surpposed to configure the virtual machine as specific network device. More informations could be referenced in the file named connection.

