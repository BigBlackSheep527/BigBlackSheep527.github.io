---
title: Ubuntu 18.04 Docker 配置代理连接网络(2023811)
date: 2023-8-22 11:52:36
tags:
---

<br/>

## Ubuntu 18.04 Docker 配置代理连接网络
============================

> 创建目录  

```
mkdir -p /etc/systemd/system/docker.service.d
```

>  创建http-proxy.conf配置文件  

```
touch /etc/systemd/system/docker.service.d/http-proxy.conf
vim /etc/systemd/system/docker.service.d/http-proxy.conf
```

> 在http-proxy.conf文件中添加如下内容，注意【service】是必须要填写的（根据自家的代理情况填写，参考资料有HTTPS的说明）
> 
> 例如可以使用clash代理后的 127.0.0.1:7890

```apache_conf
[Service\]**  
Environment="HTTP\_PROXY=http://127.0.0.1:7890/" "NO\_PROXY=localhost,127.0.0.1"
```

>  Flush变更  

```
systemctl daemon-reload
```

> 重启Docker  

```
systemctl restart docker
```

> 验证配置是否已加载  

```
systemctl show --property=Environment docker  
```

> 当有如下输出  

```
Environment=HTTP\_PROXY=http://127.0.0.1:7890/ NO\_PROXY=localhost,127.0.0.1  
```
