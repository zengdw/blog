---
title: 修改vim颜色主题
categories:
  - 软件工具
tags:
  - vim
abbrlink: 10157
date: 2020-08-10 15:41:43
---
### 1、查看Vim实例中当前的颜色主题

打开一个Vim窗口，输入命令:color或:colorscheme后回车查看当前的颜色主题。

![1](../images/1.png)

可以看到当前的颜色主题默认为default

![2](../images/2.jpg)

### 2、Vim实例中设置颜色主题

输入命令"colorscheme 主题名字"，即可设置当前vim实例的颜色主题

![image-20200529164402398](../images/image-20200529164402398.png)

### 3、查看提供的vim颜色主题

vim的颜色主题文件放在Vim运行目录下的color目录下，所以我们首先需要知道vim的运行目录

在vim中输入命令:echo $VIMRUNTIME 来查看Vim的运行目录

![image-20200529164627411](../images/image-20200529164627411.png)

得到vim的运行目录,从图中可以看到，vim的运行路径为**/usr/share/vim/vim80 **

![image-20200529164701675](../images/image-20200529164701675.png)

进入vim的运行目录，查看colors目录下以“.vim”为结尾的文件,

![image-20200529164907460](../images/image-20200529164907460.png)

### 4、修改vim配置文件，更改默认颜色主题

打开/etc/vim/vimrc文件，在其中加入一行"colorscheme 颜色主题名字"，之后保存更改即可

![image-20200529165041227](../images/image-20200529165041227.png)