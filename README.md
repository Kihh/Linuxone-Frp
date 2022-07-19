# Linuxone-Frp
在linuxone上部署Frp服务
```
wget https://github.com/Kihh/Linuxone-Frp/raw/main/frps_linux_s390x && mv frps_linux_s390x frps
```
```
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F
iptables-save
apt-get update && apt install screen -y
screen -S frp
```
```
sudo chmod -R 777 frps
./frps -c ./frps.ini
```
