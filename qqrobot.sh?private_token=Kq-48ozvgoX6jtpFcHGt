#/bin/bash 

echo $robotId
echo $robotName
echo $robotArea
echo $flag
echo $controllerAddr

downloadurl=https://raw.githubusercontent.com/kefuxitong/somewhat/master/qqrobot.tar.gz
binPath=~/$robotId
binFile=~/$robotId/qqrobot

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
    curl $downloadurl -o $binFile.tar.gz
    echo "[安装]下载完成！"
    
    if [ -f $binFile.tar.gz ]; then
        cd $binPath
        tar -zxvf $binFile.tar.gz
        chmod +x $binFile
        nohup $binFile -i $robotId -r $robotName -a $robotArea -c=$controllerAddr > $binPath/logs.txt 2>&1 &
        echo "[新增]QQ终端: <$robotId> 启动成功！"
        echo "[新增]大吉大利，今晚吃鸡"
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
