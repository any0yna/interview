#!/bin/bash
#***************************************
#Author     :any000yna@163.com
#Date       :2020-05-18
#Description:
#GET:Kernel,Release Name,Hostname,IP,Memory,CPU Load,Disk Info,Login User,Process Num
#    AllUserNum,CPUNum,CPU Info,Network
#***************************************
BASE_PATH=${PWD}
source ${PWD}/sysregular.sh
source ${PWD}/sysvariable.sh

OSVER=`uname -a | awk -F" " {'print $3 '}`
MAINLOG=systeminfo.log

main(){
    if [[ ${OSVER} =~ el7 ]];then
        case "$1" in
            tool)
              yum install -y sysstat &>/dev/null
              ;;
            sysregular)
              get_SYSregular_el ${MAINLOG}
              ;;
            sysvariable)
              sys_variable ${MAINLOG}
              ;;
             *)
              echo "[AUTOERROR]:please check $1 " >> ${MAINLOG}
              ;;
              esac
    elif [[ ${OSVER} =~ el6 ]];then
        case "$1" in
            tool)
              yum install -y sysstat &>/dev/null
              ;;
            sysregular)
              get_SYSregular_el ${MAINLOG}
              ;;
            sysvariable)
              sys_variable ${MAINLOG}
              ;;
             *)
              echo "[AUTOERROR]:please check $1 " >>${MAINLOG}
             esac
    elif [[ ${OSVER} =~ el5 ]];then
        case "$1" in
            tool)
              yum install -y sysstat &>/dev/null
              ;;
            sysregular)
              get_SYSregular_el ${MAINLOG}
              ;;
            sysvariable)
              sys_variable ${MAINLOG}
              ;;
             *)
              echo "[AUTOERROR]:please check $1 " >>${MAINLOG}
             esac
    elif [[ ${OSVER} =~ default ]];then
        case "$1" in
            tool)
              zypper install -y sysstat &>/dev/null
              ;;
            sysregular)
              get_SYSregular_suse ${MAINLOG}
              ;;
            sysvariable)
              sys_variable ${MAINLOG}
              ;;
             *)
              echo "[AUTOERROR]:please check $1 " >>${MAINLOG}
             esac
    elif [[ ${OSVER} =~ generic ]];then
        case "$1" in
            tool)
              apt-get install -y sysstat &>/dev/null
              ;;
            sysregular)
              get_SYSregular_suse ${MAINLOG}
              ;;
            sysvariable)
              sys_variable ${MAINLOG}
              ;;
             *)
              echo "[AUTOERROR]:please check $1 " >>${MAINLOG}
             esac
    else
        echo "[AUTOERROR]:please check ${OSVER}">>${MAINLOG}
    fi
}
test(){
    main tool
    main sysregular
    main sysvariable
}

test
