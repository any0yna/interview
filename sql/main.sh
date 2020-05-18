#!/bin/bash
PATH_BASE=${PWD}
source ${PATH_BASE}shell/write_log.sh
MYSQL_CSV=${PATH_BASE}/sql/mysql.csv

MYSQL_USER=`cat ${MYSQL_CSV} | grep ^user | awk -F, '{print $2;}'`
MYSQL_PASS=`cat ${MYSQL_CSV} | grep ^passwd | awk -F, '{print $2;}'`
MYSQL_PORT=3306
MYSQL_HOST=localhost
MYSQL_ADMIN="mysqladmin -u${MYSQL_USER} -p${MYSQL_PASS} -p${MYSQL_PORT} -h${MYSQL_HOST}"
MYSQL_COMM="mysql -u${MYSQL_USER} -p${MYSQL_PASS} -P${MYSQL_PORT} -h${MYSQL_HOST} -e"
MYSQL_SQL1W=mysql_1w.sql
MYSQL_SQL100W=mysql_100w.sql
MYSQL_SQL1000W=mysql_1000w.sql
MYSQL_SQL=mysql_base.sql
MYSQL_TB100=mysql_tb_100.sql
MYSQL_DROP=mysql_drop.sql
MYSQL_LOG=${PATH_BASE}sql/mysql.log

#SUCCESS="echo -en \\033[1;32m"
#FAILURE="echo -en \\033[1;31m"
#WARNING="echo -en \\033[1;33m"
#NORMAL="echo -en \\033[0;39m"

check_mysqlStatus(){
    ${MYSQL_ADMIN} ping &> /dev/null
    if [ $? -ne 0 ];then
        echo "MYSQL Status : Can't connection MYSQL"
        write_error "[MYSQL ERROR]Can't connect MYSQL" ${MYSQL_LOG}
        exit
    else
        echo -n "MYSQL Status:[OK]" 
        write_info "MYSQL Status : Running" ${MYSQL_LOG}
    fi
}

check_mysqlProcesslist(){
    write_info "MYSQL Processlist : " ${MYSQL_LOG}
    ${MYSQL_ADMIN} processlist >> ${MYSQL_LOG}
}

check_mysqlUptime(){
    RUN_TIME=$($MYSQL_COMM "SHOW STATUS LIKE 'uptime'" | awk '/Uptime/{print $2}')
    write_info "MYSQL RUN_TIME(s) :${RUN_TIME}" ${MYSQL_LOG}
}

check_mysqlDB(){
    DB_LIST=$($MYSQL_COMM "SHOW DATABASES")
    DB_COUNT=$($MYSQL_COMM "SHOW DATABASES" | \
    awk 'NR>=2&&/^[^+]/{db_count++} END{print db_count}')
    write_info "DATABASES_NUMBER= ${DB_COUNT}, ${DB_LIST}" ${MYSQL_LOG}
}

check_mysqlMaxCon(){
    MAX_CON=$($MYSQL_COMM "SHOW VARIABLES LIKE 'max_connections'" \
    | awk '/max/{print $2}')
    write_info "MYSQL MAX_CONNECTION_NUMBER=${MAX_CON}" ${MYSQL_LOG}
}

check_mysqlDate(){
    TB_TIME=$($MYSQL_COMM "SELECT * FROM db_base.tb_time;")
    write_info "db_base.tb_time : \n ${TB_TIME}" ${MYSQL_LOG}
}

check_mysqlSelect(){
    NUM_SELECT=$($MYSQL_COMM "SHOW GLOBAL STATUS LIKE 'com_select'"\
    | awk '/Com_select/{print $2}')
    write_info "MYSQL SELECT_NUMBER= ${NUM_SELECT}" ${MYSQL_LOG}
}

check_mysqlUpdate(){
    NUM_UPDATE=$($MYSQL_COMM "SHOW GLOBAL STATUS LIKE 'com_update'"\
    | awk '/Com_update/{print $2}')
    write_info "MYSQL UPDATE_NUMBER= ${NUM_UPDATE}" ${MYSQL_LOG}
}

check_mysqldDelete(){
    NUM_DELETE=$($MYSQL_COMM "SHOW GLOBAL STATUS LIKE 'com_delete'"\
    | awk '/Com_delete/{print $2}')
    write_info "MYSQL DELETE_NUMBER= ${NUM_DELETE}" ${MYSQL_LOG}
}

check_mysqldInsert(){
    NUM_DELETE=$($MYSQL_COMM "SHOW GLOBAL STATUS LIKE 'com_insert'"\
    | awk '/Com_insert/{print $2}')
    write_info "MYSQL INSERT_NUMBER= ${NUM_INSERT}" ${MYSQL_LOG}
}

check_mysqldQuestions(){
    NUM_QUESTION=$($MYSQL_COMM "SHOW GLOBAL STATUS LIKE 'Questions'"\
    | awk '/Questions/{print $2}')
    write_info "MYSQL QUESTIONS_NUMBER= ${NUM_QUESTIONS}" ${MYSQL_LOG}
}

check_mysql(){
    check_mysqlProcesslist
    check_mysqlStatus
    check_mysqlUptime
    check_mysqlDB
    check_mysqlMaxCon
    check_mysqlDate
    check_mysqlSelect
    check_mysqlUpdate
    check_mysqldDelete
    check_mysqldInsert
    check_mysqldQuestions
}

main(){
    check_mysql
    for i in {1...100}
    do
        ${MYSQL_COMM} "source ${PWD}/${MYSQL_SQL}"
        ${MYSQL_COMM} "source ${PWD}/${MYSQL_SQL1W}"
        ${MYSQL_COMM} "source ${PWD}/${MYSQL_SQL100W}"
        ${MYSQL_COMM} "source ${PWD}/${MYSQL_SQL1000W}"
        ${MYSQL_COMM} "source ${PWD}/${MYSQL_TB100}"
        ${MYSQL_COMM} "source ${PWD}/${MYSQL_DROP}"
        sleep 60
    done
    sleep 60
    check_mysql
}
#main
