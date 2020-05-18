#!/bin/bash
#***************************************
#Author     :any000yna@163.com
#Date       :2020-05-18
#Description:
#Check 
#***************************************

check_free_el(){
    freelog=$1
    memfree=`free -m | awk '/Mem/{print $2}'`
    swapfree=`free -m | awk '/Mem/{print $2}'`
    freeinfo="memfree=${memfree} swapfree=${swapfree}" 
    if [ ${memfree} -le 100 -o ${swapfree} -le 100 ]; then
        send_mail ${freeinfo} ${freelog}
    else
        echo ${freeinfo} >> ${freelog}
    fi
    }

check_load_el(){
    loadlog=$1
    load1=$(uptime | sed 's/,//g' | awk '{print $(NF-2)}')
    load5=$(uptime | sed 's/,//g' | awk '{print $(NF-1)}')
    load15=$(uptime | sed 's/,//g' | awk '{print $NF}')
    loadinfo="uptime `uptime`"
    if [ `echo "${load1}>3.00"|bc` -eq 1 -o `echo "${load5}>3.00"|bc` -eq 1 -o `echo "${load15}>3.00"|bc` -eq 1 ] ; then
        send_mail ${loadinfo} ${loadlog}
    else
        echo ${loadinfo} >> ${loadlog}
    fi
    }

sys_variable(){
    syslog=$1
    check_free_el ${syslog}
    check_load_el ${syslog}
    echo -e "Disk Info:" >>${syslog}
    fdisk -l | grep ^Disk | awk 'BEGIN { FS="Disk /"} $1=="" {print "/"$2}' &>>${syslog}
    echo -e "" >> ${syslog}
    echo -e `LANG=C sar -d -p 1 6 | awk '/Average/' | tail -n +2 | awk '{print "[" $2 "] Average number io disks :" $3 }'` &>>${syslog}
    echo -e "" >>${syslog}
    echo -e "`LANG=C sar -d -p 1 6 | awk '/Average/' | tail -n +2 | awk '{print "[" $2 "] Average read/write sector per second :" $4,$5 }'`" &>> ${syslog}
    echo -e "Interrupt Number:`vmstat 1 2 | tail -n +4 | awk '{print $11}'`" &>>${syslog}
    echo -e "Context switch Number :`vmstat 1 2 | tail -n +4 | awk '{print $12}'`" &>>${syslog}
    echo -e "Ten processes with the largest memory:" >>${syslog}
    echo -e "`ps --no-headers -eo comm,rss | sort -k2 -n | tail -10`" &>>${syslog}
    echo -e "Ten processes with the largest CPU:" >>${syslog}
    echo -e "`ps --no-headers -eo comm,pcpu | sort -k2 -n | tail -10`" &>>${syslog}
    echo -e "Network card traffic" >>${syslog}
    echo -e "`cat /proc/net/dev | tail -n +3 | awk 'BEGIN{print "NETNAME IN(bytes) OUT(bytes)"} {print $1,$2,$10}' | column -t`" &>>${syslog}
}

test(){
    check_free_el free.log
    check_load_el free.log
    sys_variable free.log
}
#test
