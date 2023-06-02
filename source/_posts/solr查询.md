---
title: solr查询
categories:
  - 中间键
tags:
  - solr
  - tomcat
  - 搜索引擎
keywords:
  - solr
  - tomcat
  - 搜索引擎
  - search
  - 查询
abbrlink: 1939
date: 2021-10-26 10:59:22
top_img:
---

## solr查询

>http://127.0.0.1:8983/solr/films/select     films:索引名称

### 搜索单个术语

这可以跨多个字段进行查询，通过复制字段（`Copy Field`）实现

>/select?q=查询参数

###  限制返回文档的字段

>/select?fl=id,name

###  字段搜索

>/select?q=查询字段:查询参数

### 短语查询

短语查询需要使用双引号括起来

>/select?q="查询短语"

### 组合查询

默认情况下，在查询多个短语或术语时，solr只要求其中一个和文档匹配就会返回，匹配的术语或短语越多就在结果列中排在前面。可以使用`+`前缀来要求术语或短语存在，使用`-`前缀来禁止术语或短语存在。例如要同时存在`electronics`和`music`,只需要在查询参数`q`上输入`+electronics +music`。`Get`查询url参数`+``-`特效符合需要转义：
>/select?q=%2Belectronics%20%2Bmusic

如果要只存在`electronics`而不包含`music`，则在查询参数`q`上输入`+electronics -music`。转义之后：

>/select?q=%2Belectronics+-music





