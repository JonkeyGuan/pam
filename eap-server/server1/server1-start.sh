#!/bin/bash

MY_DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"
source ${MY_DIR}/server1-common.sh

export JAVA_OPTS="-Xms1G -Xmx1G" #TODO: place more jvm options here if needed

if [ `whoami` != "${JBOSS_USER}" ];then
    echo "Warn: The current user is [`whoami`].Please use the user [${JBOSS_USER}]"
    exit 1;
fi
if [ $(ps axu | grep java | grep Djboss.node.name=${NODE_NAME} |wc -l) -gt 0 ]; then
  echo "Warn: [${SERVER_NAME}] is running..." 
  echo "If you want to restart [${SERVER_NAME}], stop it first please." 
  exit 1;
fi

nohup ${JBOSS_BIN_DIR}/standalone.sh \
         --server-config=standalone-full.xml \
         -Djboss.server.base.dir=${JBOSS_BASE_DIR} \
         -Djboss.bind.address.management=${MANAGEMENT_ADDR} \
         -Djboss.bind.address=${BIND_ADDR} \
         -Djboss.socket.binding.port-offset=${PORT_OFFSET} \
         -Djboss.node.name=${NODE_NAME}  \
          >> ${LOG_DIR}/${SERVER_NAME}-$(date "+%Y%m%d").out 2>&1 &

