#!/bin/sh

DBASTUSER='wordpressuser'
DBASTPASS='password'

DTBASES=$(echo "wordpress")

DTBASES=( $DTBASES )

MYSQLBIN=/usr/bin/mysqldump
FN=`/bin/date +%Y-%m-%d`

BK_DIR_SHORT='/backup/'
BK_DIR=${BK_DIR_SHORT}'/mysql'

PARAM="--quote-names --add-drop-table --single-transaction --quick --user=${DBASTUSER} --password=${DBASTPASS}"

backup_dump() {
  if ! [ -d "${BK_DIR_SHORT}" ]; then mkdir ${BK_DIR_SHORT}; fi
  if ! [ -d "${BK_DIR}" ]; then mkdir ${BK_DIR}; fi
  cd ${BK_DIR}
    for i in $(seq 0 $((${#DTBASES[@]} - 1 ))); do
         $MYSQLBIN $PARAM ${DTBASES[$i]} > ${DTBASES[$i]}.sql
    done
    tar zcf sql-bacula-${FN}.tar.gz *.sql --remove-files
}

LOGTAG=bareos
LOGFILE=/var/log/messages
backup_dump || logger -t $LOGTAG -f $LOGFILE -- "BACKUP FAIL ( $? )"

logger -t $LOGTAG -f $LOGFILE -- "BACKUP DONE successfully"

