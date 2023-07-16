---
title: Get请求如何正确的传递数组
date: 2023-07-16 11:52:36
tags:
---

Get请求如何正确的传递数组
==============

假如现在后端有这么一个接口/users，前端可以通过传roleIds数组来查询这些角色关联的用户，后端的接口和参数定义如下：

```java
//Controller @GetMapping("/users") public R<?> list(ReqVo vo) {   //... }
```
```java
//ReqVo @Data public class ReqVo {   private List<String> roleIds; }
```
那么我们可以有以下几种方式来传递数组：

*   方式一

```bash

GET http://localhost:8080/users?roleIds=1&roleIds=2
```
*   方式二

```bash
GET http://localhost:8080/users?roleIds=1,2
```
*   方式三

```bash
GET http://localhost:8080/users?roleIds[0]=1&roleIds[1]=2
```
*   方式四

```bash

GET http://localhost:8080/users?roleIds[]=1&roleIds[]=2
```
需要注意的是，最后两种方式带有中括号`[]`，`[]`在url中属于功能性字符，前端需要使用`encodeURIComponent()`函数转义，否则在高版本tomcat中会出现_400 Bad Request_错误