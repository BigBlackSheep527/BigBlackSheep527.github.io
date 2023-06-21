---
title: Git常用命令
date: 2023-06-20 22:53:25
cover: https://mp-6fc29f3f-14dc-4d29-99e1-a8caab6a2c40.cdn.bspapp.com/博客图片/R-C.png
top_img: https://mp-6fc29f3f-14dc-4d29-99e1-a8caab6a2c40.cdn.bspapp.com/博客图片/R-C.png
categories:
- Git
- Git常用命令
tags:
- 基础
- Git常用
---
| 目的 | GIT命令 |
| ---- | ------- |
| 第一次初始化仓库 | `git init`<br>`git add .`<br>`git commit -m [描述字体，例如 "first commit "]`<br>`git remote add origin [仓库地址]`<br>`git push -u origin [分支名称，一般第一次有默认的master]` |
| 拉取远程分支到本地 | `git fetch origin [分支名称]` |
| 提送到git | `git push origin [分支名称]` |
| 删除本地分支 | `git branch -d [分支的名称]` |
| 删除远程分支 | `git push origin --delete [分支的名称]` |
| 查看远程分支与本地分支 | `git branch -a` |
| 合并分支 | `git pull origin [目标分支]`<br>`git merge [被合分支]`<br>`git push origin [目标分支]` |
| 更新远程分支列表 | `git remote update origin --prune` |
| 查看所有分支 | `git branch -a` |
| 撤销提交 | `git reset --soft [HEAD^ \| HEAD~1 \| HEAD ~<n>]` |
| 创建本地分支 | `git branch [分支名称]` |
| 切换分支 | `git checkout [分支名称]` |
| 创建并切换到创建的分支 | `git checkout -b [分支名称]` |
| 根据已有的远程分支创建新的分支 | `git checkout -b [创建的分支名] origin/[远程的分支名称]` |
| 删除分支 | `git branch -d [分支名称]` |

