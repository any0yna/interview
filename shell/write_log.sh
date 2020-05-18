#!/bin/bash
#***************************************
#Author     :any000yna@163.com
#Date       :2020-05-18
#Description:Custom log format
#***************************************

write_Info(){
    echo -e "$(date +'%Y-%m-%dT--%H:%M:%S%z') ***[ $1 ]***">> $2
}

write_Error(){
    echo -e "[SYSERROR]:$(date +'%Y-%m-%dT--%H:%M:%S%z') $1 ">>$2
}

write_CASEstart(){
   echo -e "----------[start_$1 : $2 ----------]">>$3
}

write_CASEend(){
   echo -e "----------[end_$1 : $2 ----------]">>$3
}

test(){
    write_Info test1 test.log
    sleep 2
    write_Error test2 test.log
    write_CASEstart 0 test3 test.log
    write_CASEend 1 test4 test.log
}

#test
