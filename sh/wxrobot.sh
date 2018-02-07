#!/bin/bash

echo $robotId
echo $robotName
echo $robotArea
echo $flag
echo $controllerAddr

downloadurl=https://github.com/kefuxitong/somewhat/raw/master/wxrobot2
binPath=/root/$robotId
binFile=/root/$robotId/wxrobot2

echo $downloadurl
echo $binPath
echo $binFile

if [ "$robotId" == "" ];then
    echo "[安装]错误，robotId为空"
    exit
fi

if [ "$flag" == "setup" ] || [ "$flag" == "update" ] ; then 

    echo "[安装]正在关闭进程和删除旧版bin文件..."

    ps -ef | grep $binFile | grep -v grep | awk '{print $2}' | xargs kill -9

    rm -rf $binPath

    mkdir $binPath

    echo "[安装]正在下载bin文件..."
    curl $downloadurl -o $binFile
    chmod +x $binFile
    echo "[安装]下载完成！"
    ls $binPath

    if [ -f $binFile ]; then
        nohup $binFile -i=$robotId -r=$robotName -a=$robotArea -c=$controllerAddr > $binPath/logs.txt 2>&1 &
        echo "[安装]WX终端: <$robotId> 启动成功！"
        echo "[安装]大吉大利，今晚吃鸡"
        exit
    fi

    echo "[安装]安装失败..."
    exit

fi



if [ "$flag" == "delete" ]; then 

    ps -ef | grep $binFile | grep -v grep | awk '{print $2}' | xargs kill -9

    rm -rf $binPath

    echo "[删除]大吉大利，今晚吃鸡"

    exit

fi
