#/bin/bash     

echo $flag
echo $rabbitmq
echo $redisaddr
echo $redispwd
echo $bintype

binPath=~/$bintype/
binFile=~/$bintype/$bintype

echo $binPath
echo $binFile

if [ ! -f "/home/$bintype" ]; then
    echo "[安装]失败，找不到安装文件。可能未上传文件至服务器"
    exit
fi

if [ "$flag" == "setup" ]; then 
    
    echo "[安装]正在关闭进程和删除旧版bin文件..."

    ps -ef | grep $binFile | grep -v grep | awk '{print $2}' | xargs kill -9

    rm -rf $binPath

    mkdir $binPath
    
    cp /home/$bintype $binPath

    if [ -f $binFile ]; then
        cd $binPath
        nohup $binFile -rabbitmq=$rabbitmq -redisaddr=$redisaddr -redispwd=$redispwd > $binPath/logs.txt 2>&1 &
         echo "[安装]启动成功！"
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

