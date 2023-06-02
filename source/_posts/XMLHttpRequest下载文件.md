---
title: XMLHttpRequest下载文件
categories:
  - 前端
tags:
  - js
keywords:
  - XMLHttpRequest
abbrlink: 52642
date: 2021-07-17 01:03:02
top_img:
---

使用XMLHttpRequest下载文件

```js
const xhr = new XMLHttpRequest()
xhr.open('get', '下载链接')
xhr.responseType = 'blob'
xhr.onreadystatechange = function () {
  if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
    saveAs(xhr.response, '文件名称')
  }
}
xhr.send();

function saveAs(data, name) {
  var urlObject = window.URL || window.webkitURL || window;
  const export_blob = new Blob([data]);
  var save_link = document.createElementNS('http://www.w3.org/1999/xhtml', 'a')
  save_link.href = urlObject.createObjectURL(export_blob);
  save_link.download = name;
  save_link.click();
}
```

