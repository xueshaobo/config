#!/bin/bash
#install smb
#by xueshaobo 2018

yum install -y  samba samba-client samba-common

mv /etc/samba/smb.conf /etc/samba/smb.conf.bak

touch /etc/samba/smb.conf

echo "[global]
workgroup = WORKGROUP
server string = Samba Server %v
netbios name = centos
security = user
map to guest = bad user
dns proxy = no
#============================ Share Definitions ==============================
[Anonymous]
path = /samba/anonymous
browsable =yes
writable = yes
guest ok = yes
read only = no " >/etc/samba/smb.conf

mkdir -p /samba/anonymous

systemctl restart smb.service

sed -i 's/enforcing/disabled/g' /etc/selinux/config && setenforce 0

firewall-cmd --permanent --zone=public --add-service=samba

firewall-cmd --reload

