---
title: SQL常用命令
date: 2023-06-22 21:24:37
top_img: https://mp-34802e5d-78f8-44c6-8138-463f8ec9869b.cdn.bspapp.com/博客图片/sql.webp
cover: https://mp-34802e5d-78f8-44c6-8138-463f8ec9869b.cdn.bspapp.com/博客图片/sql.webp
categories:
- SQL
- SQL常用命令
tags:
- 基础
- SQL常用
---
<a name="cKqKF"></a>
### (一）insert
<a name="Chmu3"></a>
#### 1.全部字段插入
注意：添加数据的顺序必须和表结构一致<br />存在一个表person ，字段有 id,name,sex,dep,bir
```sql
insert into person values ( '张三','男','开发部','2019-07-17')
```
<a name="ae3i5"></a>
#### 2.指定字段插入
```sql
insert into person(name,sex) values ('张三','男')
insert into person(name,sex,bir) values ('张三','男',NOW()) 
// NOW()表示当前时间（yyyy-mm-dd hh:mm:ss），SYSDATA()也可以
```
<a name="YdGQQ"></a>
### (二）update
注意：修改语句通常指定条件，否则会对所以数据进行修改
```sql
update person set dep='开发部' where name='李四'
update person set dep='开发部'，sex="女" where name='李四'
```
<a name="j5Azj"></a>
### (三）delete
注意：删除语句通常指定条件，否则会对所以数据进行删除
```typescript
delete from person  // 全删
delete from person where id=3
```
<a name="bM1oD"></a>
### (四）select
<a name="QAbsJ"></a>
#### (1）select 子语句
```plsql
select * from person
select name ,dep from person
select name n,dep d from person //n和p是别名 
```
<a name="dTrGj"></a>
#### (2）from子语句
```sql
select * from person;
select person.id,perons.name from person
select t.id,person.name from person t;
```
<a name="z9ToZ"></a>
#### (3) where 子语句
```sql
// 逻辑运算符 >,< ,...,and,or
select * from job where age>20 and age<25 and sex='男' // and or not
// 数字区间运算符
select * from job where age between 18 and 20;
select * from job where age not between 18 and 20;
// 集合运算符
select * from job where position in ('美工','实习生')
// 模糊查询运算符
// 匹配符： “_”匹配一个任意字符、%匹配一个多个任意字符
select * from job where name like '黄_'
select * from job where name like '黄%' 
// 空NULL 表示未知，没有，不是0，不是空字符串
// 注意 判断空必须使用is或者is not 来判断
select * from person where dep is null
select * from person where dep is not null
```
<a name="wL1IK"></a>
#### (4）group by 分组
分组的理解：相同的是一组，按照组来显示记录，几组就显示几条记录，从某种意义上来说类似于去重<br />分组的注意： 分组的时候，select显示的字段有约束条件，一是分组的组名，二是聚合函数
```sql
select sex,age from group by sex // 错误，不能是sex、age两个，只能是se x一个
select sex from group by sex // 正确
select sex,MAX(age) 最大,MIN(age) 最小,COUNT(*) 个数,SUM(age) 求和,AVG(age) 平均 
from job GROUP BY sex;
```
<a name="k4qcv"></a>
#### (5）HAVING 分组过滤的条件语句
注意：where和having都是条件语句<br />注意：where是对每一条记录进行过滤筛选<br />注意：having是对组进行过滤筛选。分组之后才能使用having
```sql
select source s ,count(*) from job group by s having c>10
```
<a name="tK4Fd"></a>
#### (6)ORDERF BY 排序
默认按照升序排序
```sql
select * from job order by age
// 升序
select * from job order by age ASC
// 降序
select * from job order by age DESC
```
同时使用六个查询语句
```sql
select position p,count (*) c
FROM job
where age >20
group by p 
having c>10
order by c desc
```
<a name="odnXR"></a>
### (五）多表查询：子查询
案例：查小刘的所在公司<br />多表连接的写法
```sql
select c.name 公司名 
from company c,member m 
where c.id=m.comid and m.name='小刘'
```
<a name="rdwsM"></a>
#### （1）select 子查询
```sql
select (select name from company where id=comid) 公司
from member 
where name='小刘’
```
<a name="PvmoP"></a>
#### （2） where 子查询
```sql
select name 公司名
from company
where id =(select comid from member where name='小刘')

select name 公司名
from company
where id in (select comid from member where name='小刘' or name='小黄')
```
<a name="pwxHs"></a>
#### （3）from子查询
注意 ：from子查询主要用于3张表以上的连接查询<br />举例：有abc三张表。先查询a和b，再用查询结果和c表连接查询

注意： select 和where是将查询结果当成【数据】<br />注意： select 和where是将查询结果当成【表】
```sql
select c.name form  (select name n,comid,c from member where n=' 小刘') t,company c
where t.c=c.id.	
```
<a name="C9LVH"></a>
### (六) limit
注意limit 通常于order by 一起用，主要有两个作用
<a name="K2ma7"></a>
#### （1）分析top-n
```sql
// 使用一个参数
select * from job order by age desc limit 5 // 提取降序前五个
```
<a name="lAorM"></a>
#### （2） 用于分页
使用两个参数<br />参数一：表示起始位置<br />参数二：表示个数
```sql
select * from job order by age desc limit 0,10 					//第一页
select * from job order by age desc limit 10,10  				//第二页
select * from job order by age desc limit (n-1)*10,10  	//第三页
```
