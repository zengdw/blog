---
title: root用户无法远程ssh登陆
categories:
  - 软件工具
tags:
  - ssh
  - linux
abbrlink: 15063
date: 2020-08-10 15:40:50
---
编辑 /etc/ssh/sshd_config文件

找到PermitRootLogin，注释掉这一行

添加PermitRootLogin yes，保存，退出。

重启sshd：systemctl restart sshd