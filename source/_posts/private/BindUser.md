---
title: 浙里办新用户绑定说明
tags:
  - ESSO
  - 浙里办
categories:
  - Private
date: 2022-07-12 10:00:54
updated: 2022-07-12 10:00:54
description: 新用户接入系统，根据字段判断是否需要绑定 IRS 用户，并且整个绑定流程
keywords: ESSO, 浙里办
top_img: /images/three-party/ThreePartyCover3.png
cover: /images/three-party/ThreePartyCover3.png
---

## 判断是否需要绑定

1. 任何获取用户数据的接口都能在用户对象中拿到参数`need_bind`，类型是`tinyInteger`，对应说明如下

| 数值  | 说明   |
|-----|------|
| 1   | 需要绑定 |
| 9   | 无需绑定 |

2. 当`need_bind`的值为`9`时无需操作，当值为`1`时需要走绑定流程。理论上如果用户需要绑定，应拒绝用户的一切业务操作，仅允许他走绑定流程。否则可能会造成绑定完成后已产生用户数据的丢失。

## 登录流程回顾

{% note purple 'fa-regular fa-paste' flat %}
对于前端而言，`IRS`用户绑定与`IRS`用户登录采用同一套接口，仅在参数上存在一些区别。所以先回顾一下`IRS`登录流程。
也可以跳过回顾直接前往[绑定流程](/private/BindUser/#绑定流程)部分。
{% endnote %}

* `IRS`登录的大致流程：
    1. 用户需要先跳转至{% label IRS单点登录地址 blue %}.
    2. 完成登录后跳转至{% label 网关接口 pink %}，网关接口验证用户信息后生成用户 access_token。
    3. 跳转至前端{% label 业务页面 green %}。
* 所以`IRS`登录接口实际上是分别由{% label IRS单点登录地址 blue %}，{% label 网关接口 pink %}，{% label 业务页面 green %}三部分组成的。
* {% label IRS单点登录地址 blue %}是跳转的第一部分，是一个正常的地址
* {% label 网关接口 pink %}是跳转的第二部分，作为第一部分的`spappurl`参数跟在{% label IRS单点登录地址 blue %}的`query`部分。
* {% label 业务页面 green %}是跳转的第三部分，作为第二部分的`goto`参数跟在{% label 网关接口 pink %}的`query`部分。
* 所以最终跳转地址的形式为`https://esso.zjzwfw.gov.cn/opensso/spsaehandler/metaAlias/sp?spappurl=https://dea-api.idtshow.com:8443/ban/api/v1/login/irs?goto=` + url_encode

## 绑定流程

1. 获取当前url，并将其进行url编码

  ```javascript
  let url_encode = encodeURIComponent(location.href);
  ```

2. 在url编码前拼接登录指定地址。
    * 测试服地址：`http://essotest.zjzwfw.gov.cn/opensso/spsaehandler/metaAlias/sp?spappurl=https://gdte-api.cloudvhall.com:8443/ban/api/v1/login/irs?goto=`
    * 正式服地址：`https://esso.zjzwfw.gov.cn/opensso/spsaehandler/metaAlias/sp?spappurl=https://dea-api.idtshow.com:8443/ban/api/v1/login/irs?goto=`

  ```javascript
  // 正式服地址
  // const ESSO_PREFIX = 'https://esso.zjzwfw.gov.cn/opensso/spsaehandler/metaAlias/sp?spappurl=https://dea-api.idtshow.com:8443/ban/api/v1/login/irs?goto=';
  // 测试服地址
  const ESSO_PREFIX = 'http://essotest.zjzwfw.gov.cn/opensso/spsaehandler/metaAlias/sp?spappurl=https://gdte-api.cloudvhall.com:8443/ban/api/v1/login/irs?goto=';
  let irs_url = ESSO_PREFIX + url_encode;
  ```

3. 在登录地址后面拼接参数`bind_user_id`，值为用户对象中的`id`，使接口进行用户绑定操作。

  ```javascript
  let bind_user_url = irs_url + "&bind_user_id=" + userData.id
  ```

4. 令浏览器跳转至拼接出来的单点登录地址。

  ```javascript
  location.href = bind_user_url;
  ```


## 测试账号

* 公共测试账号：zjfrcszh
* 公共密码：Zjfrcszh123

## 测试用快捷地址

* 首先在浏览器中打开[浙江口岸的登录页面](https://testsso.chinabeston.com:41/sso/login)完成登录
  * 账号`testsso`
  * 密码`test1234`

* 访问下方地址一步完成`浙江口岸`用户认证为`BAN用户`的登录流程。

  ```markdown
  https://testsso.chinabeston.com:41/sso/oauth?appId=SWT00011&url=https://gdte-zlb.cloudvhall.com/findhall/
  ```