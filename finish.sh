#!/bin/bash
echo -n "タイムスタンプのファイル名："
read TIMESTAMP_FILENAME
echo -n "digログのファイル名："
read DIG_FILENAME

WORKDIR=`pwd`

# タイムスタンプのブロック
sort -k 2 pid.txt > ${WORKDIR}/result/${TIMESTAMP_FILENAME}

# digログのブロック
cd ${WORKDIR}/tmp
ls -l | sed 's/ \+/ /g' | cut -d" " -f 10 | sort | grep -v "^\s*$" | xargs cat > ${WORKDIR}/result/${DIG_FILENAME}
