#!/bin/bash
yum install -y wget redhat-lsb
function supportos(){
	echo "支持系统如下"
	echo "CentOS 5 (32位，64位)"
	echo "CentOS 6 (32位, 64位)"
	echo "CentOS 7 (64位)"
}
version=`lsb_release -rs|awk -F'.' '{print $1}'`
if [[ $version = '7' ]] && [ `getconf LONG_BIT` == '64' ]; then
	wget -c http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
	rpm -ivh rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
elif [[ $version = '6' ]] && [ `getconf LONG_BIT` == '64' ]; then
	wget -c http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
	rpm -ivh rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
elif [[ $version = '6' ]] && [ `getconf LONG_BIT` == '32' ]; then
	wget -c http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.i686.rpm
	rpm -ivh rpmforge-release-0.5.3-1.el6.rf.i686.rpm
elif [[ $version = '5' ]] && [ `getconf LONG_BIT` == '64' ]; then
	wget -c http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el5.rf.x86_64.rpm
	rpm -ivh rpmforge-release-0.5.3-1.el5.rf.x86_64.rpm
elif [[ $version = '5' ]] && [ `getconf LONG_BIT` == '32' ]; then
	wget -c http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el5.rf.i386.rpm
	rpm -ivh rpmforge-release-0.5.3-1.el5.rf.i386.rpm
else
	echo '不支持该版本安装aria2'
	supportos
	exit
fi


echo "+-------------------------------------------------------------+"
echo "|举例如下：                                                   |"
echo "|aria2c -c -s 5 http://www.example.com/file.tar.gz            |"
echo "| -c 代表断点续传  -s 代表线程数                              |"
echo "|下载BT种子如下：                                             |"
echo "|aria2c /tmp/CentOS-6.3-i386-bin-DVD1to2.torrent              |"
echo "|祝你使用愉快                                                 |"
echo "+-------------------------------------------------------------+"



