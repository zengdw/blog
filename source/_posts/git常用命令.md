---
title: git常用命令
categories:
  - 软件工具
tags:
  - git
keywords:
  - git
abbrlink: 953
date: 2021-06-25 11:22:52
top_img:
---
#### git推送本地分支到远程
```
git push -u origin <分支名称>
```

#### git 删除远程分支

```
git push origin --delete <分支名称>
```

#### Git报错-refusing to merge unrelated histories

本地仓库第一次推送到远程仓库时报错，错误如下：

`fatal: refusing to merge unrelated histories`(拒绝合并不相关的历史)

出现这问题的主要原因是当前本地仓库和远程仓库还是独立的两个仓库。如果之前是直接clone远程仓库建立的本地仓库则不会出现这个问题。而且如果远程仓库没有提交历史，是一个全新的仓库也不会有这问题。

解决办法：

```
git pull origin master --allow-unrelated-histories
```

`--allow-unrelated-histories`命令可以合并两个独立仓库的提交历史。之后再`git push`就不会有问题了。

#### 创建新分支并切换到分支

```
git checkout -b <分支名称>
```

#### 新建分支并关联远程分支

```
git checkout -b <本地分支> origin/<远程分支>
```



