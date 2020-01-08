#!/bin/bash

# 前回結果削除
WORKDIR=`pwd`
PREFILE=`ls -l ${WORKDIR}/result | wc -l`
if [ $PREFILE -ge 2 ]; then
	echo -n "前回の結果が残っていますが消しますか？(y/n)："
	read ANS
		if [ $ANS = 'y' ];then
			rm ${WORKDIR}/result/*
			rm ${WORKDIR}/tmp/*
		else
			echo "前回の結果が残ったままだとfinish.shを動かす際に2回分の結果となってしまいますので消去してください。"
			exit 1
		fi
fi

# 引数チェックブロック
# ($1, $2) = (IP, ResourseType)
if [ $# -lt 2 ]; then
	echo "引数が足りない！"
	echo "start.sh IP ResourseType"
	exit 1
fi

# ループブロック
# NGの場合のBGジョブで復帰が早すぎるとき(1Sec未満)の時にNG出力がない可能性あり
while [ true ]
do
	sleep 1;
	/bin/bash dig.sh $1 $2 2> error.log &
done
