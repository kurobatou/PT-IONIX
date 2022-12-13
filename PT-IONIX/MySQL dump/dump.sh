#!/bin/bash

[ -z "$DB_HOST" ] && echo "DB_HOST no esta definido" || CHECK=1
[ -z "$DB_PORT" ] && echo "DB_PORT no esta definido usando 3306" || $DB_PORT=3306
[ -z "$DB_USER" ] && echo "DB_USER no esta definido" || CHECK+=1
[ -z "$DB_PASS" ] && echo "DB_PASS no esta definido" || CHECK+=1
[ -z "$DB_NAME" ] && echo "DB_NAME no esta definido" || CHECK+=1 

if [ $CHECK == 4 ] ; then

  mysqldump -h $DB_HOST -P $DB_PORT -u $DB_USER -p $DB_PASS $DB_NAME | bzcat dump.bz2
  echo "Dump completo"

else
  echo "Se detectaron problemas, favor de verificar"
fi
