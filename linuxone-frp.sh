#!/bin/bash
echo "-------------------------------"
echo "LinuxONE Frp V1.0 Made by Kihh"
echo "Github:Kihh/Linuxone-Frp"
echo "-------------------------------"
clear
root_check(){
    [[ $EUID != 0 ]] && echo -e "当前非ROOT账号(或没有ROOT权限)，无法继续操作，请输入sudo -i登录ROOT账号后重试！" && exit 1
}
start() {
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
}
get_arch=`arch`
if [[ $get_arch =~ "s390x" ]];then
    root_check
    start
else
    echo "服务器不是s390x架构！"
    exit
fi
