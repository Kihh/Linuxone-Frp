#!/bin/bash
get_arch=`arch`
if [[ $get_arch =~ "s390x" ]];then
else
    echo "服务器不是s390x架构！"
    exit
fi
echo "确认部署Frp服务吗?"
echo && echo -n -e "${yellow}* 按回车键继续，或按Ctrl+C退出 *${none}" && read temp
wget https://github.com/Kihh/Linuxone-Frp/raw/main/frps_linux_s390x && mv frps_linux_s390x frps
wget https://raw.githubusercontent.com/Kihh/Linuxone-Frp/main/frps.ini
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F
iptables-save
sudo chmod -R 777 frps
sudo chmod -R 777 frps.ini
apt-get update && apt install screen -y
screen -dmS linuxonefrp ./frps -c ./frps.ini
echo "内网穿透开启完成，服务监听端口7000"
