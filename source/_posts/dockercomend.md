---
title: docker常用命令
date: 2023-06-22 21:20:16
top_img: https://mp-6fc29f3f-14dc-4d29-99e1-a8caab6a2c40.cdn.bspapp.com/博客图片/docker.png
cover: https://mp-6fc29f3f-14dc-4d29-99e1-a8caab6a2c40.cdn.bspapp.com/博客图片/docker.png
categories:
- docker
- docker常用命令
tags:
- 基础
- docker常用
---
| 作用 | 命令 |
| --- | --- |
| 查看镜像列表 | docker conainer ls  |
| 查看镜像列表 | docker ps -a |
| 停用指定镜像 | docker stop [containerId] |
| 启用指定镜像 | docker start [containerId] |
| 进入指定容器 | docker exec -it [containerId] /bin/sh |
| 退出容器 | exit |
| 查看容器状态 | docker inspect [containerId] |
| 查看容器端口信息 | docker port [containerId] |
| 查询容器日志信息 | docker logs -f [containerId] |
| 删除镜像 | docker rm [containerId] |
| 查询docker映射 | docker inspect [containerId] &#124; grep Mounts -A 20 |
| 查看日志 | docker logs --since 30m [containerId] |
| 删除所有的容器 | docker stop $(docker ps -q) & docker rm $(docker ps -q) |
|  |  |
| 切换 root 账号 | sudo su - root  |
| 查看被占用的端口的进程号 | netstat -ano &#124; findstr [端口号] |
| 根据进程号查看进程名 | tasklist &#124; findstr [进程号] |
| 根据进程号杀死进程 | taskkill /f /pid [进程号] |
| 根据进程名称杀死进程 | taskkill /f /t /i [进程名称] |

