#!/bin/bash
#***************************************
#Author     :any000yna@163.com
#Date       :2020-05-18
#Description:
#GET:Kernel,Release Name,Hostname,IP,Memory,CPU Load,Disk Info,Login User
#***************************************

get_SYSregular_el(){
    regpath=$1
    echo -e "Machine IP :\n`ip a s | awk '/inet /{print $2}'`" &>> ${regpath}
    echo -e "Machine Name : ${HOSTNAME}" &>> ${regpath}
    echo -e "Machine Kernel : `uname -r`" &>> ${regpath}
    echo -e "Machine Operating System Version : `cat /etc/redhat-release`" &>>${regpath}
    echo -e "Machine CPU number: `awk '/processor/{core++} END{print core}' /proc/cpuinfo`" &>>${regpath}
    echo -e "Machine CPU:`LANG=C lscpu | awk -F: '/Model name/ {print $2}'`" &>>${regpath}
    echo -e "Machine Disk Info: \n`fdisk -l | grep ^Disk | awk 'BEGIN { FS="Disk /"} $1=="" {print "/"$2}'`" &>>${regpath}
    echo -e "Machine All UsersNumber : `sed -n '$=' /etc/passwd`" &>>${regpath}
}

get_SYSregular_suse(){
    regpath=$1
    echo -e "Machine IP :\n`ip a s | awk '/inet /{print $2}'`" &>> ${regpath}
    echo -e "Machine Name : ${HOSTNAME}" &>> ${regpath}
    echo -e "Machine Kernel : `uname -r`" &>> ${regpath}
    echo -e "Machine Operating System Version : `cat /etc/issue`" &>>${regpath}
    echo -e "Machine CPU number: `awk '/processor/{core++} END{print core}' /proc/cpuinfo`" &>>${regpath}
    echo -e "Machine CPU:`LANG=C lscpu | awk -F: '/Model name/ {print $2}'`" &>>${regpath}
    echo -e "Machine Disk Info: \n`fdisk -l | grep ^Disk | awk 'BEGIN { FS="Disk /"} $1=="" {print "/"$2}'`" &>>${regpath}
    echo -e "Machine All UsersNumber : `sed -n '$=' /etc/passwd`" &>>${regpath}
}

test(){
    log=test.log
    get_SYSregular_el ${log}
}

#test
