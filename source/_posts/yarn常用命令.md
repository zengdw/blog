---
title: yarn常用命令
categories:
  - 软件工具
tags:
  - yarn
keywords:
  - yarn
abbrlink: 13025
date: 2021-06-24 17:32:01
top_img:
---
#### yarn配置信息查看

```
yarn config list
```

#### 查询安装依赖的全局路径

```
yarn global bin
// C:\Users\zengd\AppData\Local\Yarn\bin
```

#### 修改全局 bin 位置

```
yarn config set prefix "D:\software\Yarn\Data\"
```

#### 修改缓存位置

```
yarn config set cache-folder "D:\software\Yarn\cache-folder"
```

#### 修改全局安装位置

```
yarn config set global-folder "D:\software\Yarn\global-folder"
```

#### 添加依赖

```
yarn global add  xxx      安装全局依赖
yarn add xxx              安装到dependencies
yarn add xxx -D           安装到devDependencies
```

#### 更新项目依赖

```
yarn upgrade-interactive --latest

// 需要手动选择升级的依赖包，按空格键选择，a 键切换所有，i 键反选选择，上下键切换依赖项
```

#### 查看全局安装的依赖

```
yarn global list
```

#### 查看yarn全局安装位置

```bash
yarn global dir
```



