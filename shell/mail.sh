#!/bin/bash
#***************************************
#Author     :any000yna@163.com
#Date       :2020-05-18
#Description:
#    send mail
#***************************************

send_mail(){
    usermail=any000yna@163.com
    echo $1 | mail -s "AutoError" -a $2 ${usermail}
}

test(){
    send_mail test test.log
}

#test
