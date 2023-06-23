---
title: chin
date: 2023-06-23 00:01:18
copyright_author: chinyan
copyright_author_href: https://chinyan.top/posts/62832/
copyright_url: https://chinyan.top/posts/62832/
copyright_info: 此文章版权归chinyan所有，如有转载，请注明来自原作者
comments: true
---
[](# "开始之前的准备")开始之前的准备
----------------------

### [](# "环境准备")环境准备

在开始前要确保本地已经安装好了[git](https://git-scm.com/downloads)和稳定版本的[node.js](https://nodejs.org/en/) ，安装和配置的方式在这里就不再复述，相信这个对大家来讲都不是什么大问题。

### [](# "参考文档")参考文档

[https://hexo.io/zh-cn/docs/](https://hexo.io/zh-cn/docs/)

[](# "那就开始吧")那就开始吧
------------------

### [](# "安装")安装

首先来全局安装一下

```bash
  npm install -g hexo-cli  
```
macos系统在安装的时候可能会报错`EACCES`，是因为安装需要管理员权限，`sudo -s`回车，输入密码获得管理员权限，然后再次尝试安装即可。

### [](# "初始化")初始化

安装完成后在本地建一个项目文件夹，在文件夹下打开`git bash here`运行命令。  
  
mac可直接终端，进入到文件夹目录下运行命令初始化项目

```bash
hexo init  
```
如果出现报错也莫慌，多半是网络问题造成的，多试几次就好了，下图为初始化成功截图。  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202208312303581.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202208312303581.png)

### [](# "目录结构")目录结构

初始化完成后可以看到以下这些主要目录  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202208312306580.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202208312306580.png)  
简单介绍下文件结构
  
```bash
public        // 最终所见网页的所有内容  
node\_modules  // 插件以及hexo所需node.js模块  
\_config.yml   // 站点配置文件，设定一些公开信息等  
package.json  // 应用程序信息，配置hexo运行所需js包  
scaffolds     // 模板文件夹，新建文章，会默认包含对应模板内容  
themes        // 存放主题文件，hexo根据主题生成静态网页（速度贼快）  
source        // 用于存放用户资源（除 posts 文件夹，其余命名方式为 “ + 文件名”的文件被忽略）  
```
日常写文的操作都在 source/\_post下，写文主要是用的[Markdown](https://www.runoob.com/markdown/md-tutorial.html)语法，不会用的可以先去补补课。

### [](# "运行")运行

接下来让我们运行一下吧

```bash
hexo s  
```
运行成功后会提醒你在[本地](http://localhost:4000/)进行预览你的博客  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202208312317891.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202208312317891.png)  
本地打开的页面  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202208312316281.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202208312316281.png)

博客页面

  
到这里本地的任务已经基本是完成了，当然，我们想要的可不仅仅是如此。

### [](# "主题")主题

接下来以[butterfly](https://butterfly.js.org/)小蝴蝶主题为例，先安装主题

```bash
git clone -b master https://gitee.com/immyw/hexo-theme-butterfly.git themes/butterfly  
```
还需要安装pug以及stylus的渲染器，如果没有安装，预览界面可能会出现一些你不喜欢的“小”问题，如下  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209010012464.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209010012464.png)

出了点小状况

  
在控制台全局安装

```bash
npm install hexo-renderer-pug hexo-renderer-stylus --save  
```
安装完成后修改一下配置文件  
网站根目录下找到`_config.yml`文件，修改主题为`butterfly`后保存（注意文件格式）  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209010007503.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209010007503.png)

就是这个

  
然后运行预览一下。

```bash
hexo clean && hexo g && hexo s  
```
运行成功  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202208310033427.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202208310033427.png)  
看一下效果，大气  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209010013318.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209010013318.png)

往下接着划，完美  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209010015548.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209010015548.png)

嘿，细节

  
到这里，本地代码要做的事情也就差不多了，如果想整的更漂亮一些或者想换别的主题就需要你自己去研究一下啦。接下来就准备上线吧，城堡建好了怎么着也得给别人看一下的吧！

### [](# "上线")上线

终于要准备上线了，作为平民窟代表，一个极低成本的博客当然也是需求的一部分，那一个免费博客存放服务器当然也是必不可少了。  
**GitHub Pages**就刚好符合我们的要求，**GitHub Pages**允许用户的任何一个Repo的gh-pages分支上的代码可以经由HTTP访问到。类似提供了静态文件服务。  
首先，我们要新建一个和用户名同名的仓库。进入到github，点击自己的头像选择**Your repositories**，进入仓库页面。然后**New**一个新仓库，仓库名格式为**用户名.github.io**，用户名就是你登陆的名字  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209012332115.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209012332115.png)

看图片教程

  
然后回到我们的代码，修改根目录下的 `_config.yml`，配置`deploy`相关信息  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209012340817.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209012340817.png)

这样子

  
这些字段代表的东西

```bash
deploy \# 这不需要，忽略这个，这个完全是我手滑多打出来的一个，小失误！  
type   \# 上传类型，用git就行  
repo   \# 仓库地址，clone代码的时候那个HTTPS地址  
branch \# 代码分支，以你上传的主分支为准  
token  \# GitHub 的 Personal access tokens，看下图  
```
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209012349476.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209012349476.png)

获取token

  
好了，配置完后安装一下`hexo-deployer-git`

```bash
npm install hexo-deployer-git --save  
```
安装完成后运行命令

```bash
hexo clean && hexo g && hexo d  
```
然后你看到下面这个东西就表示推送成功，打开仓库就能看到你刚刚推送的代码。  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209012358888.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209012358888.png)

推送成功

  
当然，到这里还没有结束，还有最后一步。

### [](# "最后一步")最后一步

打开你刚刚创建的仓库，找到**GitHub Pages**页面，按下图操作，然后大功告成！  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209020005349.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209020005349.png)

大功告成

[](# "如果你也刚好有一个域名")如果你也刚好有一个域名
------------------------------

### [](# "有域名，那更好了！")有域名，那更好了！

如果你也跟我一样，刚好有一个域名，那么你就可以把github的博客地址解析到你自己的域名上，岂不美哉。  
因为我的域名是之前从腾讯转到阿里的，那这里就以阿里云为例，先到阿里云的域名控制台找到自己的域名点解析  
如果没有解析记录的话就新增一条，然后按下图进行配置  
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209032342661.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209032342661.png)

云解析DNS

  
现在买一个域名的话也不算很贵，第一次买挑一个喜欢的域名一次多充值几年，四舍五入也是等于白嫖了！而且腾讯和阿里也经常会有活动，如果有需求的话可以考虑买一个。

[](# "如果你刚好有一个服务器")如果你刚好有一个服务器
------------------------------

### [](# "如果你恰好财力雄厚")如果你恰好财力雄厚

如果你刚好有一个服务器，那么，关我什么事，我又没有服务器，想知道怎么部署就自己去百度！或者滑到下面看参考文章，当然也可能有一天我有时间，自己去搭建了一个服务器，那就另当别论了。

[](# "其他")其他
------------

### [](# "热更新")热更新

你会发现每次本地文件修改后都要重新运行一下`hexo s`才会生效。所以，怎么会有人不喜欢热更新啊。

```bash
\# 为了在修改文件后不再重复启动，将本地项目设置成热更新。  
$ npm install hexo-server --save  
\# 安装完成后，输入以下命令以启动服务器。  
$ hexo server  
\# 如果想要更改端口，或是在执行时遇到了 EADDRINUSE 错误，执行以下命令更换端口。  
$ hexo server -p 5000  
```
### [](# "图床")图床

写博客的话虽然可以吧图片放在静态文件进行引用，但是太多图片会占据很大的空间，所以还是建议整一个自己的图床来使用。  
下一期再专门出一期教程来配置图床，[点我直达](#)

[](# "可能会遇到的坑")可能会遇到的坑
----------------------

### [](# "github部署问题")github部署问题

不用自己去部署！不用自己去部署！不用自己去部署！重要的事情说三遍。github初始化的仓库什么都没有，这个不用管，提交命令是集成在hexo的命令里的，按照上面的步骤一步步来就可以了，不用先拉仓库代码。

### [](# "端口已占用")端口已占用

[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202208312327377.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202208312327377.png)

端口已占用

  
如果想要更改端口，或是在执行时遇到了 EADDRINUSE 错误，执行以下命令更换端口


```bash
hexo server -p 5000  
```
### [](# "推送不上去1")推送不上去1

报错`ERROR Deployer not found: git`，反思一下自己是不是没有好好看教程，这是因为没安装`hexo-deployer-git`插件，安装后后再跑一下`hexo clean && hexo g && hexo d`命令就可以推送了
```
```bash
npm install hexo-deployer-git --save  
```
### [](# "推送不上去2")推送不上去2

你会看到下面这样的报错

```bash
FATAL Something's wrong. Maybe you can find the solution here: https://hexo.io/docs/troubleshooting.html  
Error: Spawn failed  
```
[![](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209182333878.png)](https://chinyan.oss-cn-hangzhou.aliyuncs.com/img/202209182333878.png)

推送不上去

  
别担心，网不好而已，在国内github的网站连接很不稳定，这确实挺膈应人，不过多试几次就好了，加油！

### [](# "推送不上去")推送不上去

报错信息 `error: invalid active developer path`  
  
这个是git的错误，一般会在升级系统后出现，只需要执行以下步骤即可

```bash
\# 安装 xcode-select  
xcode-select --install  
\# 在 xcode-select 质量安装好后检查一下git指令的帮助信息  
git -h  
```
然后大功告成！

### [](# "运行报错")运行报错

运行后打开页面后没有显示博客，而是空白页面上显示一串 `extends includes/layout.pug block content include ./includes/mixins/post-ui.pug #recent-posts.recent-posts +postUI include includes/pagination.pug`  
这个问题大概率是你项目复制到其他地方，然后依赖没有装全

```bash
\# 安装依赖  
npm install --save hexo-renderer-jade hexo-generator-feed hexo-generator-sitemap hexo-browsersync hexo-generator-archive  
\# 安装完后运行  
hexo hexo clean && hexo g && hexo s  
```
解决  
如果 `hexo d` 后 `ERROR Deployer not found: git`

```bash
\# 安装  
npm install --save hexo-deployer-git​  
```
