#!/bin/bash
#insatll vsftpd
#by xueshaobo 2018

yum install -y vsftpd

sed -i 's/root//g' /etc/vsftpd/ftpusers

sed -i 's/root//g' /etc/vsftpd/user_list

sed -i 's/anonymous_enable=YES/anonymous_enable=NO/g' /etc/vsftpd/vsftpd.conf

systemctl start vsftpd.service
firewall-cmd --permanent --zone=public --add-service=ftp
firewall-cmd --reload
 
