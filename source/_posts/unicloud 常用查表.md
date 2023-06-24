---
title: unicloud 常用查表
tags:
- unicloud
- 常用查表
top_img: https://mp-6fc29f3f-14dc-4d29-99e1-a8caab6a2c40.cdn.bspapp.com/博客图片/uniCloud.png
cover: https://mp-6fc29f3f-14dc-4d29-99e1-a8caab6a2c40.cdn.bspapp.com/博客图片/uniCloud.png
---
```javascript
// 直接关联多个表为虚拟联表再进行查询，旧写法，目前更推荐使用getTemp进行联表查询
const res = await db.collection('order,book').where('_id=="1"').get() // 直接关联order和book之后再过滤

// 使用getTemp先过滤处理获取临时表再联表查询，推荐用法
const order = db.collection('order').where('_id=="1"').getTemp() // 注意结尾的方法是getTemp，对order表过滤得到临时表
const res = await db.collection(order, 'book').get() // 将获取的order表的临时表和book表进行联表查询

第二种比较好

// 客户端联表查询
const db = uniCloud.database()
const order = db.collection('order').field('book_id,quantity').getTemp() // 临时表field方法内需要包含关联字段，否则无法建立关联关系
const book = db.collection('book').field('_id,title,author').getTemp() // 临时表field方法内需要包含关联字段，否则无法建立关联关系
db.collection(order, book) // 注意collection方法内需要传入所有用到的表名，用逗号分隔，主表需要放在第一位
  .where('book_id.title == "三国演义"') // 查询order表内书名为“三国演义”的订单
  .get()
  .then(res => {
    console.log(res);
  }).catch(err => {
    console.error(err)
  })

// 直接使用虚拟联表查询
const res = await db.collection('article,comment')
.where('article_id._value=="1"')
.get()

// 先过滤article表，再获取虚拟联表联表获取评论
const article = db.collection('article').where('article_id=="1"').getTemp() // 注意是getTemp不是get
const res = await db.collection(article, 'comment').get()
```
```javascript
const db = uniCloud.database()
db.collection('book')
  .where('status == "onsale"')
  .skip(20) // 跳过前20条
  .limit(20) // 获取20条
  .get()
  
// 上述用法对应的分页条件为：每页20条取第2页
```
```javascript
db.collection('order').count()

const db = uniCloud.database()
  db.collection('order')
    .get({
      getCount:true
    })
    .then(res => {
      console.log(res);
    }).catch(err => {
      console.error(err)
    })
```
```javascript
const bannerQuery = db.collection('banner').field('url,image').getTemp() // 这里使用getTemp不直接发送get请求，等到multiSend时再发送
const noticeQuery = db.collection('notice').field('text,url,level').getTemp()
const res = await db.multiSend(bannerQuery,noticeQuery)
```
