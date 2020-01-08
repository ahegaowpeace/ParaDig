# 手順
```
$ cat /dev/null > pid.txt
$ sh start.sh 【IP】 【ResourceType】
$ sh finish.sh
```

- pid.txtを消去
- 毎秒dig.shを呼ぶスクリプトを実行
- 結果をソートするスクリプトを実行

# 各機能概要

- start.sh
	- 前回結果削除
		- result/
		- tmp/
	- 毎秒子シェルでdig.shを呼び出す
- dig.sh
	- タイムスタンプ取得
	- digを叩く
	- dig結果をリダイレクト
		- tmp/201901090249.txt
	- タイムスタンプをリダイレクト
		- pid.txt
- finish.sh
	- タイムスタンプファイルのソート
		- result/【任意】
	- dig結果ログの整形
		- result/【任意】
