---
title: js判断键盘大小写是否开启
categories:
  - 前端
tags:
  - js
abbrlink: 30463
date: 2020-09-11 11:40:20
---

```html
<input onkeypress="detectCapsLock()" type="password" name="password" />
<span style="display:none;">大写锁定键被按下，请注意大小写</span>
```

```js
function detectCapsLock() {
    let e = window.event;
    let o = e.target || e.srcElement;
    let oTip = o.nextElementSibling;
    let keyCode = e.keyCode || e.which; // 按键的keyCode 
    // 65～90为26个大写英文字母，97～122号为26个小写英文字母
    if (keyCode >= 65 && keyCode <= 90)  {
        oTip.style.display = '';
    } else {
        oTip.style.display = 'none';
    }
}
```

