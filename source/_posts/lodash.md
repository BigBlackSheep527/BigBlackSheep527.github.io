---
title: lodash常用函数
date: 2023-06-24 11:53:03
tags:
- lodash
- 常用
top_img: https://mp-6fc29f3f-14dc-4d29-99e1-a8caab6a2c40.cdn.bspapp.com/博客图片/lodash.png
cover: https://mp-6fc29f3f-14dc-4d29-99e1-a8caab6a2c40.cdn.bspapp.com/博客图片/lodash.png
---
<a name="dOB5s"></a>
### 1.去虚函数
```typescript
_.compact([0, 1, false, 2, '', 3]);// => [1, 2, 3]
```
<a name="FtVzU"></a>
### 2.分组
```typescript
_.chunk(['a', 'b', 'c', 'd'], 2);// => [['a', 'b'], ['c', 'd']]

_.chunk(['a', 'b', 'c', 'd'], 3);
// => [['a', 'b', 'c'], ['d']]
```
<a name="v3C2P"></a>
### 3.连接
```typescript
var array = [1];
var other = _.concat(array, 2, [3], [[4]]);

console.log(other);
// => [1, 2, 3, [4]]

console.log(array);
// => [1]
```
<a name="Kjn9J"></a>
### 4.限制字符串长度，超出用”...“表示
```typescript
 let a="aaaadfdfdfdf"
 let b=truncate(a,{length:(8+3)}) // 默认为"...",加3是因为三个点也包括在里面
 let b=truncate(a,{length:(8+3),omission: '>>>'}) // 
```
<a name="SMd0x"></a>
### 5.数组相减
```javascript
result=_.difference([1,2,3],[2,3,4])   // [1]
```
<a name="G2KFy"></a>
### 工作实际用到过
<a name="QmMQ2"></a>
#### 1.map与pick/omit的结合
```javascript
import {map, pick, omit} from "lodash"
// 提取Name与Num
let interData = map(takeCreateData, o => pick(o, ['Name', "Num"]))
// 剔除Name与Num
let outterData = map(takeCreateData, o => omit(o, ['Name', "Num"]))
```
<a name="lcXvK"></a>
#### 2.去重 isEqual, uniqWith，uniq
```javascript
import {unip, uniqWith, isEqual} from "lodash"
// 纯数组 例如[1,1,2,3,4,4,5]
let arr1 = uniq(arr) // [1,2,3,4,5]
// 对象数组 例如 [{a:1,b:2},{a:1,b:2},{a:1,b:3}] 
let arr2 = uniqWith(arr_, isEqual) // [{a:1,b:2},{a:1,b:3}]
```
<a name="Ue52a"></a>
#### 3.排序orderby
```javascript
import { orderBy } from "lodash"
/** 根据对象数组里面某个键的值来重新排序，desc 降序,asc升序,
 ** 例如[{a:1,b:2},{a:2,b:3}]   
*/
targetData = orderBy(targetData, ["a"], ["desc"])

// 字符串排序
sortBy(value,[function(o) { return o; }]);
```
<a name="u25Pt"></a>
#### 4.数组相减，lodash 没有找到的，有替代方法，待找
```javascript

let ids=[1,2,3,4,5,6]
let unids = [4,5,6]
// let needids = ids.filter(el => !unids.includes(el)) //[1,2,3]
let needids = ids.filter(el => !pids.find(pid => pid === el))
```
