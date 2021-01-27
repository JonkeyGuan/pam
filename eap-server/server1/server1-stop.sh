#!/bin/bash

MY_DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"
source ${MY_DIR}/server1-common.sh

if [ `whoami` != "${JBOSS_USER}" ];then
    echo "Warn: The current user is [`whoami`].Please use the user [${JBOSS_USER}]"
    exit 1;
fi

count=`ps -ef |grep java |grep Djboss.node.name=${NODE_NAME} | grep -v grep | wc -l`
if [ ${count} -eq 0 ]; then
    echo " [${SERVER_NAME}] not running. Exiting... "
    exit 1;
fi

echo "[$SERVER_NAME] is shutting down ... "
${JBOSS_BIN_DIR}/jboss-cli.sh --connect --controller=127.0.0.1:$((9990+${PORT_OFFSET})) command=:shutdown

for ((i=0; i<20; i++)); do 
    count=`ps -ef | grep java |  grep Djboss.node.name=${NODE_NAME} |grep -v grep |wc -l`
    if [ ${count} -eq 0 ]; then
        echo -e "[${SERVER_NAME}] is stopped successfully."
        exit 0;
    else
        sleep 6;    
    fi
done

echo -e "failed to shutdown [${SERVER_NAME}]"
exit 1

