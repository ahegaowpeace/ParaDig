#!/bin/bash
TIMESTAMP=`date +"%Y-%m-%d %H:%M:%S"`
FILENAME_TMP=`echo ${TIMESTAMP} | sed -e "s/-//g" -e "s/ //g" -e "s/://g"`
FILENAME=tmp/${FILENAME_TMP}.txt

dig @"$1" example.co.jp $2 > $FILENAME
        if [ $? -eq 0 ]; then
                echo "$TIMESTAMP $$ OK" >> pid.txt
        else
                echo "$TIMESTAMP $$ NG" >> pid.txt
        fi
