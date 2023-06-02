---
title: JavaScript常用函数封装方法
categories:
  - 前端
tags:
  - js
  - 常用方法
keywords:
  - JavaScript
  - 常用方法
abbrlink: 19543
date: 2021-09-16 11:24:59
top_img:
---

# JavaScript常用函数封装方法

## 1、加载js || css || style

```js
const loadRes = function(name, type, fn) { // 加载js || css || style
  let ref
  if (type === 'js') { // 外部js
    ref = document.createElement('script')
    ref.setAttribute('type', 'text/JavaScript')
    ref.setAttribute('src', name)
  } else if (type === 'css') { // 外部css
    ref = document.createElement('link')
    ref.setAttribute('rel', 'stylesheet')
    ref.setAttribute('type', 'text/css')
    ref.setAttribute('href', name)
  } else if (type === 'style') { // style
    ref = document.createElement('style')
    ref.innerhtml = name
  }
  if (typeof ref !== 'undefined') {
    document.getElementsByTagName('head')[0].appendChild(ref)
    ref.onload = function() { // 加载完成执行
      typeof fn === 'function' && fn()
    }
  }
}
```

## 2、取url参数

1. 正则方式获取

   ```js
   const getUrlParam = function(name) { 
     let reg = new RegExp('(^|&?)' + name + '=([^&]*)(&|$)', 'i')
     let r = window.location.href.substr(1).match(reg)
     if (r != null) {
       return decodeURI(r[2])
     }
     return undefined
   }
   ```

2. URLSearchParams()函数

   ```js
   function getUrlParam(name) {
     let params = new URLSearchParams(window.location.search)
     return params.get(name)
   }
   ```

3. split拆分

   ```js
   function getUrlParam(name) {
     let params = window.location.search
     let vars = params.substr(1).split("&")
     for (var i = 0; i < vars.length; i++) {
       let pair = vars[i].split("=")
       if (pair[0] == name) { return pair[1] }
     }
     return ''
   }
   ```

   

## 3、cookie操作【set，get，del】

   ```js
   const cookie = { 
     set: function(name, value, day) {
       let oDate = new Date()
       oDate.setDate(oDate.getDate() + (day || 30))
       document.cookie = name + '=' + value + ';expires=' + oDate + "; path=/;"
     },
     get: function(name) {
       let str = document.cookie
       let arr = str.split('; ')
       for (let i = 0; i < arr.length; i++) {
         let newArr = arr[i].split('=')
         if (newArr[0] === name) {
           return newArr[1]
         }
       }
     },
     del: function(name) {
       this.set(name, '', -1)
     }
   }
   ```

## 4、时间格式化

```js
const formatDate = function(fmt, date) { 
  if (typeof date !== 'object') {
    date = !date ? new Date() : new Date(date)
  }
  var o = {
    'M+': date.getMonth() + 1, // 月份
    'd+': date.getDate(), // 日
    'h+': date.getHours(), // 小时
    'm+': date.getMinutes(), // 分
    's+': date.getSeconds(), // 秒
    'q+': Math.floor((date.getMonth() + 3) / 3), // 季度
    'S': date.getMilliseconds() // 毫秒
  }
  if (/(y+)/.test(fmt)) {
    fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length))
  }
  for (var k in o) {
    if (new RegExp('(' + k + ')').test(fmt)) {
      fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)))
    }
  }
  return fmt
}
```

## 5、base64图片下载功能

```js

const downloadFile = function(base64, fileName) { //base64图片下载功能
  let base64ToBlob = function(code) {
    let parts = code.split(';base64,');
    let contentType = parts[0].split(':')[1];
    let raw = window.atob(parts[1]);
    let rawLength = raw.length;
    let uInt8Array = new Uint8Array(rawLength);
    for (let i = 0; i < rawLength; ++i) {
      uInt8Array[i] = raw.charCodeAt(i);
    }
    return new Blob([uInt8Array], {
      type: contentType
    });
  };
  let aLink = document.createElement('a');
  let blob = base64ToBlob(base64); //new Blob([content]);
  let evt = document.createEvent("HTMLEvents");
  evt.initEvent("click", true, true); //initEvent不加后两个参数在FF下会报错  事件类型，是否冒泡，是否阻止浏览器的默认行为
  aLink.download = fileName;
  aLink.href = URL.createObjectURL(blob);
  aLink.click();
}
```

## 6、图片地址转base64

```js
//传入图片路径，返回base64，使用getBase64(url).then(function(base64){},function(err){});
const getBase64 = function(img) {  
  let getBase64Image = function(img, width, height) { //width、height调用时传入具体像素值，控制大小,不传则默认图像大小
    let canvas = document.createElement("canvas");
    canvas.width = width ? width : img.width;
    canvas.height = height ? height : img.height;
    let ctx = canvas.getContext("2d");
    ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
    let dataURL = canvas.toDataURL();
    return dataURL;
  }
  let image = new Image();
  image.crossOrigin = '';
  image.src = img;
  let deferred = $.Deferred();
  if (img) {
    image.onload = function() {
      deferred.resolve(getBase64Image(image));
    }
    return deferred.promise();
  }
}
```

## 7、生成随机数范围

```js
// 生成随机数范围
const random = function(min, max) { 
  if (arguments.length === 2) {
    return Math.floor(min + Math.random() * ((max + 1) - min))
  } else {
    return null
  }
}
```

## 8、过滤html代码

```js
const filterTag = function(str) {
  str = str.replace(/&/ig, '&')
  str = str.replace(/</ig, '<')
  str = str.replace(/>/ig, '>')
  str = str.replace(' ', ' ')
  return str
}
```

## 9、去除字符串空格

```js
// 去除空格， type:  1-所有空格  2-前后空格  3-前空格 4-后空格
const trim = function(str, type) { 
  type = type || 1
  switch (type) {
    case 1:
      return str.replace(/\s+/g, '')
    case 2:
      return str.replace(/(^\s*)|(\s*$)/g, '')
    case 3:
      return str.replace(/(^\s*)/g, '')
    case 4:
      return str.replace(/(\s*$)/g, '')
    default:
      return str
  }
}
```

## 10、常用正则验证

```js
 // 常用正则验证，注意type大小写
const checkStr = function(str, type) {
  switch (type) {
    case 'phone': // 手机号码
      return /^1[3|4|5|6|7|8|9][0-9]{9}$/.test(str)
    case 'tel': // 座机
      return /^(0\d{2,3}-\d{7,8})(-\d{1,4})?$/.test(str)
    case 'card': // 身份证
      return /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(str)
    case 'pwd': // 密码以字母开头，长度在6~18之间，只能包含字母、数字和下划线
      return /^[a-zA-Z]\w{5,17}$/.test(str)
    case 'postal': // 邮政编码
      return /[1-9]\d{5}(?!\d)/.test(str)
    case 'QQ': // QQ号
      return /^[1-9][0-9]{4,9}$/.test(str)
    case 'email': // 邮箱
      return /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/.test(str)
    case 'money': // 金额(小数点2位)
      return /^\d*(?:\.\d{0,2})?$/.test(str)
    case 'URL': // 网址
      return /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/.test(str)
    case 'IP': // IP
      return /((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d))/.test(str)
    case 'date': // 日期时间
      return /^(\d{4})\-(\d{2})\-(\d{2}) (\d{2})(?:\:\d{2}|:(\d{2}):(\d{2}))$/.test(str) ||
        /^(\d{4})\-(\d{2})\-(\d{2})$/.test(str)
    case 'number': // 数字
      return /^[0-9]$/.test(str)
    case 'english': // 英文
      return /^[a-zA-Z]+$/.test(str)
    case 'chinese': // 中文
      return /^[\u4E00-\u9FA5]+$/.test(str)
    case 'lower': // 小写
      return /^[a-z]+$/.test(str)
    case 'upper': // 大写
      return /^[A-Z]+$/.test(str)
    case 'HTML': // HTML标记
      return /<("[^"]*"|'[^']*'|[^'">])*>/.test(str)
    default:
      return true
  }
}
```

