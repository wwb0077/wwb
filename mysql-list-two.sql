--字段属性：用于对字段进行修饰 允许对字段设置附加属性
--null 属性
  null--默认是空 允许字段为空
  not null 不允许字段为空


--default 属性
  设置字段的默认值，当插入新数据时，如果没有为该字段赋值，自动使用默认值。

  eg:
  create table default_1(
    username varchar(20) defult '匿名'---所有值的地方都需要用单引号
    gender char(2)
  )

  --default 关键字 在插入数据时使用 default 将强制使用默认值
  insert into def_1 values(default,'张少')；

  --特殊的默认值
  --timestamp 时间戳类型，默认值是： current_timestamp on update current_timestamp

  alter table default_1（数据表） add column reg_time(注册时间，字段名) timestamp;

  --时间戳的常用写法 ：
  timestamp default CURRENT_TIMESTAMP
  注意：如果不写，每次修改数据时，默认时间就会选择修改的时间，历史时间也会被修改。
