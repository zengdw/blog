---
title: oauth2获取token的4种模式
categories:
  - java
tags:
  - spring
  - oauth2
abbrlink: 33303
date: 2020-11-05 14:01:54
---
## 1、授权码模式（authorization_code）

### 1.1 获取code

`/oauth/authorize?client_id=client1&redirect_uri=https://www.baidu.com/&response_type=code`

### 1.2 获取token

```
/oauth/token
参数:
{
	client_id:
	client_secret:
	grant_type: "authorization_code"
	redirect_uri:
	username:
	password:
	code:
}
```

## 2、密码模式（password）

### 2.1 获取token

```
/oauth/token
参数:
{
	client_id:
	client_secret:
	grant_type: "password"
	redirect_uri:
	username:
	password:
}
```

## 3、客户端模式（client_credentials）

### 3.1 获取token

```
/oauth/token
参数:
{
	client_id:
	client_secret:
	grant_type: "client_credentials"
	redirect_uri:
}
```

## 4、简单模式（implicit）

### 4.1 获取token

`/oauth/authorize?client_id=client1&redirect_uri=https://www.baidu.com/&response_type=token`

