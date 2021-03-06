#/bin/bash     


echo $platformId
echo $flag

downloadurl=https://raw.githubusercontent.com/kefuxitong/somewhat/master/gameapi
binPath=/root/gameapi_$platformId/
binFile=/root/gameapi_$platformId/gameapi

echo $downloadurl
echo $binPath
echo $binFile

if [ $flag == "setup" ]; then 

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
        cd $binPath
        nohup $binFile -i=$platformId  > $binPath/logs.txt 2>&1 &
        echo "[安装]游戏api接口: <$platformId> 启动成功！"
        echo "[安装]大吉大利，今晚吃鸡"
        exit
    fi

    echo "[安装]安装失败..."
    exit

fi



if [ $flag == "delete" ]; then 

    ps -ef | grep $binFile | grep -v grep | awk '{print $2}' | xargs kill -9

    rm -rf $binPath

    echo "[删除]大吉大利，今晚吃鸡"

    exit

fi