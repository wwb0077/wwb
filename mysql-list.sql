-- noinspection SqlNoDataSourceInspectionForFile
-----------------数据库操作=====================
--创建数据库
create database 数据库名;--如果数据库名要用关键字，就需要打反引号，1旁边的符号；
create database `create`;

--显示数据库
show databases;--显示服务器上所有的数据库列表

show databases like '%t%';--like 子命令 显示所有带t的数据库名；
    -- % 是匹配0个或多个任意字符 ， _匹配任意一个字符；

show create database insource; --查看建立数据库的语句

--修改数据库
alter database itsource charset=gbk;--修改字符集 注意：utf-8 需要写成utf8;

--删除数据库
drop database itsource;--删除itsource数据库；注意：my-SQL 默认的几个库不能删除；

--设置默认数据库
use 数据库名;

-----------------数据表操作===================

--创建数据表
create table 表名(
字段名 字段类型 字段属性,
id int,
username varchar(20),
age int
);

create table classes(
id int,
classname varchar(10),
classroom varchar(3)
);


--查看数据表
show tables; --查看所有数据表
show create table student; --查看数据表的建表语句
desc student; --查看数据表的结构；

--删除数据表
drop table student;

--修改表
alter table (数据库表名) engine=innodb; --修改默认引擎
alter table (数据库表名) varchar(10)=utf8;--修改字符集
alter table (原始表名) to (现表名); --修改表名

-------------字段操作（数据表中的字段操作）-=====================
--创建字段在创建数据表时进行操作，在已经拥护的表之后，还可以对字段进行操作

--新增字段
alter table (数据库表名) add column (新增字段) (新增字段类型); --在表中新增 字段

--修改字段类型和属性
alter table student modify columb gender varchar(10) after id;--修改gender 字段定义 并且在id后面 after id /first等设置；

--修改字段的名字和定义
alter table student change column gender sex varchar(2);--修改字段名和定义

--删除字段
alter table student drop column gender;

---------------记录操作===================
--数据模型概念 开发会频繁操作

--新增记录
insert into 表名(字段列表---可以省略) values (值的列表);----值的个数 与 数据表中的字段完全一致时，可以省略字段列表；必须一一对应
insert into student(username) values ('翁');
insert into study.student (id,name,age) values (4,'问3',2);

--记录查询：从数据表中查询数据
select [字段列表] [from 从什么什么数据表] [where 后面跟条件] [order by 筛选] [limit 条数] ---[group by] [having][inner join]
  --字段列表  指 数据表的表头 * 指通配符 指所有字段都显示出
    select name,age from student;
    select name from student;
  --from :用于为select 语句提供数据 ，确定数据源
    --1个表：将这个表设置为数据的来源表
    --多个表：联表查询 往往配合where 使用
    --还可以为表格指定别名
    select * from student;--从表中查询出所有数据
    select * from student s;--指定别名为s
    select * from student,classes;

  --where子句 :用于过滤 数据 ，只取出条件满足条件的记录
    select * from student where age>=20;
    select * from student where id>2;--查询id大于2的数据

  --order by子句：用于对显示的数据进行排序
    select * from student where age>=20 order by age asc; --查询大于等于20年龄 并且升序排列 asc 、desc降序

  --limit 子句：用于限制输出数据的条件  主要用分页
    --查询出年龄大于20的同学 ，只要最大的两条数据
    limit n数据;---提取前n 条数据；
    limit m,n;--提取从m条开始提取 n条数据
    select * from setudent where age>20 order by age asc limit 2;

--修改记录
 update 表名 set 字段名1=新的值1,字段名2=新的值2,字段名n=新的值n where 子句;

 将所有学生归到id为1中去
 update student set classId=1;
 --更新字段数据表中的数据值
  update student set age=52 where name='wwb';--需要加引号  条件不能缺少

--删除记录
delete from 表名 where 条件子句;
delete from student where age=23; --删除年龄为23的数据

注意:在做修改删除 和修改数据时;一定要备份 再操作;！！！！！！！！

--小结:
  sql = ddl+dml
  ddl:数据定义语言！数据结构的操作（数据库操作和数据表操作）;
  create ， drop ，show ，alter;
  alter table add column , drop column , change column ,modify column;

  dml:数据管理语言
  数据的操作：insert(增) ，delete(删) ，update(修改) ，select (查询)

  set names gbk;  --dos框中不显示中文的解决办法；
  --查看字符集
  show variables like '%char%';

sssssss