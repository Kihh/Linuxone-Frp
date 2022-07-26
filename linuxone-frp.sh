wget https://github.com/Kihh/Linuxone-Frp/raw/main/frps_linux_s390x && mv frps_linux_s390x frps
wget https://raw.githubusercontent.com/Kihh/Linuxone-Frp/main/frps.ini
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F
iptables-save
sudo chmod -R 777 frps
sudo chmod -R 777 frps.ini
apt-get update && apt install screen -y && screen -S frp
screen -dmS linuxonefrp ./frps -c ./frps.ini
echo "内网穿透开启完成，服务监听端口7000"