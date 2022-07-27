# Linuxone-Frp
#### 在linuxone上部署Frp服务
在LinuxONE上封号有以下几个因素（本人均已踩坑）</br>
1.搭建代理</br>
2.长时间服务器资源占用，包括但不限于挖矿、Minecraft</br>
3.长时间占用宽带</br>
已测试只使用内穿且临时开个服或远程办公一下是没有问题的</br>
本人的三个L1号均已开Frp服务使用并已稳一个月</br>
### 一键脚本
```shell
wget --no-check-certificate https://is.gd/l1frp -O linuxone-frp.sh && bash linuxone-frp.sh
```
