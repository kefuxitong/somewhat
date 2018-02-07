#/bin/bash     

echo $flag
echo $rabbitmq
echo $masterurl
echo $redisaddr
echo $redispwd


downloadurl=https://raw.githubusercontent.com/kefuxitong/somewhat/master/controller
binPath=~/controller/
binFile=~/controller/controller

downloadurl2=https://raw.githubusercontent.com/kefuxitong/somewhat/master/interface
binPath2=~/interface/
binFile2=~/interface/interface

echo $downloadurl
echo $binPath
echo $binFile
echo $downloadurl2
echo $binPath2
echo $binFile2

if [ "$flag" == "setup" ]; then 

    echo "[安装]正在关闭进程和删除旧版bin文件..."

    ps -ef | grep $binFile | grep -v grep | awk '{print $2}' | xargs kill -9

    rm -rf $binPath

    mkdir $binPath

    ps -ef | grep $binFile2 | grep -v grep | awk '{print $2}' | xargs kill -9

    rm -rf $binPath2

    mkdir $binPath2

    echo "[安装]正在下载bin文件..."
    curl $downloadurl -o $binFile
    chmod +x $binFile
    curl $downloadurl2 -o $binFile2
    chmod +x $binFile2
    echo "[安装]下载完成！"
    ls $binPath
    ls $binPath2

    if [ -f $binFile ] && [ -f $binFile2 ]; then
        cd $binPath
        nohup $binFile -rabbitmq=$rabbitmq -masterurl=$masterurl -redisaddr=$redisaddr -redispwd=$redispwd > $binPath/logs.txt 2>&1 &
        cd $binPath2
        nohup $binFile2 -rabbitmq=$rabbitmq -masterurl=$masterurl -redisaddr=$redisaddr -redispwd=$redispwd > $binPath2/logs.txt 2>&1 &
        echo "[安装]启动成功！"
        echo "[安装]大吉大利，今晚吃鸡"
        exit
    fi

    echo "[安装]安装失败..."
    exit

fi



if [ "$flag" == "delete" ]; then 

    ps -ef | grep $binFile | grep -v grep | awk '{print $2}' | xargs kill -9

    ps -ef | grep $binFile2 | grep -v grep | awk '{print $2}' | xargs kill -9

    rm -rf $binPath

    rm -rf $binPath2

    echo "[删除]大吉大利，今晚吃鸡"

    exit

fi

