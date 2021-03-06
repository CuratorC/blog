---
title: MySQL 创建用户和授权
tags:
  - MySQL
  - 入门
categories:
  - MySQL
date: 2021-08-13 11:47:05
updated: 2022-07-06 17:20:21
description: 一般情况在公司之后DBA工程师会创建一个用户和密码，让你去连接数据库的操作，并给当前的用户设置某个操作的权限（或者所有权限）。那么这时就需要我们来简单了解一下： 如何创建用户和密码、给当前的用户授权、移除当前用户的权限
keywords: MySQL, 创建用户
top_img: /images/mysql/MySQLCover1.png
cover: /images/mysql/MySQLCover1.png
---


## 权限管理
我们知道我们的最高权限管理者是root用户，它拥有着最高的权限操作。包括`select`、`update`、`delete`、`update`、`grant`等操作。

那么一般情况在公司之后DBA工程师会创建一个用户和密码，让你去连接数据库的操作，并给当前的用户设置某个操作的权限（或者所有权限）。那么这时就需要我们来简单了解一下：

* 如何创建用户和密码
* 给当前的用户授权
* 移除当前用户的权限

## 进入到 MySQL 数据库下

```sql
mysql> use mysql
Database changed
```

## 对新用户增删改

### 创建用户

```sql
CREATE USER "username"@"host" IDENTIFIED WITH mysql_native_password BY "password";
```

```sql  eg:
-- 指定ip：47.99.161.35的用户 curatorc 登录
CREATE USER "curatorc"@"47.99.161.35" IDENTIFIED WITH mysql_native_password by "password";
-- 指定ip：47.99.161. 开头的用户 curatorc 登录
CREATE USER "curatorc"@"47.99.161.%" IDENTIFIED WITH mysql_native_password by "password";
-- 指定任何ip的用户 curatorc 登录
CREATE USER "curatorc"@"%" IDENTIFIED WITH mysql_native_password by "password";
```

### 删除用户

```sql
DROP USER "username"@"host";
```

### 修改用户

```sql
RENAME USER "username"@"host" TO "newusn"@"host";
```

### 修改密码

```sql
ALTER USER 'username'@'host' IDENTIFIED WITH mysql_native_password BY "password";
```

## 对当前的用户授权管理

### 授权

```sql
GRANT all privileges ON database.table TO "username"@"host";
```

```sql eg:
-- 授权用户 curatorc 仅对db1.t1文件有查询、插入和更新的操作
GRANT select, insert, update ON db1.t1 TO "curatorc"@"%";

-- 表示有所有的权限，除了 grant 这个命令，这个命令是root才有的。用户 curatorc 对db1下的t1文件有任意操作
GRANT all privileges ON db1.t1 TO "curatorc"@"%";
-- 用户 curatorc 对db1数据库中的文件执行任何操作
GRANT all privileges ON db1.* TO "curatorc"@"%";
-- 用户 curatorc 对所有数据库中文件有任何操作
GRANT all privileges ON *.* TO "curatorc"@"%";
```

### 查看授权

```sql
SHOW GRANTS FOR "username"@"host"
```

### 取消权限

```sql
REVOKE ALL ON database.table FROM "username"@"host";
```

## 刷新授权

```sql
FLUSH PRIVILEGES;
```

## 备份操作

```sql
-- 备份：数据表结构+数据
MYSQDUMP -u root db1 > db1.sql -p

-- 备份：数据表结构
MYSQDUMP -u root -d db1 > db1.sql -p

-- 导入现有的数据到某个数据库
-- 1.先创建一个新的数据库
CREATE DATABASE db10;
-- 2.将已有的数据库文件导入到db10数据库中
MYSQDUMP -u root -d db10 < db1.sql -p
```

> [转载链接](https://www.cnblogs.com/wangyueping/p/11258028.html)
