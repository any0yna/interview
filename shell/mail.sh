#!/bin/bash
#***************************************
#Author     :any000yna@163.com
#Date       :2020-05-14
#Description:
#    send mail
#***************************************

send_mail(){
    usermail=renh@info2soft.com
    echo $1 | mail -s "AutoError" -a $2 ${usermail}
}

test(){
    send_mail test test.log
}

#test
