#!/bin/bash
#sid 查询的sqlmapid,sqlval待查询片段,app应用名
APP_PATH=/opt/apps/
APP_DEFAULT=ica
if [ $# -eq 0 ];then
	echo "findsql -sid sidval -sql sqlval -app appval [-l]"
	exit -1
else
	#1、获取参数
	for para in $@
		case $para in
			sid)
				paramMap[sid]=$para
			;; 
			sql)
				paramMap[sql]=$para
			;;
			app)
				paramMap[app]=$para
			;; 
			*)
			echo "findsql -sid sidval -sql sqlval -app appval [-l]"
			;;
		esac
		
	#2、获取应用路径
	#3、查询所有匹配的文件
	#4、获取整个sql定义
	appPath=`find $APP_PATH -type d -name "$app*.war"`
	rlt=`find $appPath -name '*.xml' -type f -exec grep -l $sqlval {} \;`
	for item in rlt
	do
		echo $item
	done
	exit 0
fi