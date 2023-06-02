---
title: css实现开关样式
categories:
  - 前端
tags:
  - css
  - html
abbrlink: 9666
date: 2020-08-10 16:31:55
---
- html代码：

```html
<div class="switch onswitch">
  <em>开启</em>
  <i></i>
</div>
```

- css代码

```css
.switch {
	position: relative;
	display: inline-block;
	height: 22px;
	line-height: 22px;
	min-width: 35px;
	padding: 0 5px;
	margin-top: 8px;
	border: 1px solid #d2d2d2;
	border-radius: 20px;
	cursor: pointer;
	background-color: #fff;
	-webkit-transition: .1s linear;
	transition: .1s linear;
}

.switch em {
	position: relative;
	top: 0;
	width: 25px;
	margin-left: 21px;
	padding: 0 !important;
	text-align: center !important;
	color: #999 !important;
	font-style: normal !important;
	font-size: 12px;
	user-select: none;
}

.switch i {
	position: absolute;
	left: 5px;
	top: 3px;
	width: 16px;
	height: 16px;
	border-radius: 20px;
	background-color: #d2d2d2;
	-webkit-transition: .1s linear;
	transition: .1s linear;
}

.onswitch {
	border-color: #5FB878;
	background-color: #5FB878;
}

.onswitch em {
	margin-left: 5px;
	margin-right: 21px;
	color: #fff !important;
}

.onswitch i {
	left: 100%;
	margin-left: -21px;
	background-color: #fff;
}
```

- js代码

```js
$('.switch').on('click', function(){
  let isCk = $(this).hasClass('onswitch');
  if(isCk){
	  //关
	  $(this).removeClass('onswitch');
	  $(this).find('em').html('关闭');
  } else {
	  //开
	  $(this).addClass('onswitch');
	  $(this).find('em').html('开启');
  }
});
```