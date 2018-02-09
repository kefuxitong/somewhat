#!/bin/bash

echo $robotId
echo $robotArea
echo $flag

binPath=~/$robotId
binFile=~/$robotId/wxrobot2

echo $binPath
echo $binFile

if [ "$robotId" == "" ];then
    echo "[安装]错误，robotId为空"
    exit
fi

if [ "$flag" == "setup" ]; then 

    echo "[安装]正在关闭进程和删除旧版bin文件..."

    ps -ef | grep $binFile | grep -v grep | awk '{print $2}' | xargs kill -9

    rm -rf $binPath

    mkdir $binPath
    
    cp /home/wxrobot2 $binPath

    if [ -f $binFile ]; then
        cd $binPath
        nohup $binFile -i=$robotId -a=$robotArea > $binPath/logs.txt 2>&1 &
        echo "[安装]WX终端: <$robotId> 启动成功！"
        echo "[安装]大吉大利，今晚吃鸡"
        echo $robotId >> /home/ids.txt
        exit
    fi

    echo "[安装]安装失败..."
    exit

fi


if [ "$flag" == "update" ] ; then 

    echo "[更新]正在关闭进程和删除旧版bin文件..."

    ps -ef | grep $binFile | grep -v grep | awk '{print $2}' | xargs kill -9

    rm -rf $binPath

    mkdir $binPath
    
    cp /home/wxrobot2 $binPath

    if [ -f $binFile ]; then
        cd $binPath
        nohup $binFile -i=$robotId -a=$robotArea > $binPath/logs.txt 2>&1 &
        echo "[更新]WX终端: <$robotId> 启动成功！"
        echo "[更新]大吉大利，今晚吃鸡"
        exit
    fi

    echo "[更新]更新失败..."
    exit

fi


if [ "$flag" == "delete" ]; then 

    ps -ef | grep $binFile | grep -v grep | awk '{print $2}' | xargs kill -9

    rm -rf $binPath

    echo "[删除]大吉大利，今晚吃鸡"

    exit

fi
