-----------------------------------------
-- 测试用的表person
-----------------------------------------
drop table if exists person;

create table person (
    id int unsigned auto_increment,
    name varchar(100),
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------
-- 用于从指定的文本文件中导入数据
-----------------------------------------
drop table if exists textfile;

create table textfile (
    id int unsigned auto_increment,
    name varchar(100),
    text varchar(4000),
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------
-- 组件状态表
-----------------------------------------
drop table if exists systems;

create table systems (
    name varchar(100),
    address varchar(100),
    start datetime,
    CONSTRAINT sys_pk_systems PRIMARY KEY (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------
-- 系统配置表
-----------------------------------------
drop table if exists configs;

create table configs (
    cname varchar(100),
    ckey varchar(100),
    cvalue varchar(100),
    CONSTRAINT sys_pk_configs PRIMARY KEY (cname, ckey)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------
-- 插件配置表
-- LogisticRegressionTrain.V1 LogisticRegressionTrain 训练次数 300
-- LogisticRegressionTrain.V1 LogisticRegressionTrain 维度 10
-- LogisticRegressionPredict.V1 LogisticRegressionPredict path ../../../模型文件名
-- LogisticRegressionPredict.V1 LogisticRegressionPredict 维度 10
-- FileStorage.V1 FileStorage file path ../../../
-- FileStorage.V2 FileStorage file path ../../../
-- LineParser.V1 LineParser 分隔符 " "
-- LineParser.V1 LineParser 字段名 "a b c"
-- SqlConvert.V1 sqlConvert sql "select int(a), int(b) from table"
-----------------------------------------
drop table if exists plugins;

create table plugins (
    plugin varchar(100),
    ckey varchar(100),
    cvalue varchar(500),
    CONSTRAINT sys_pk_plugins PRIMARY KEY (plugin, ckey)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------
-- 算法配置表
-- LogisticRegression 随机种子 47
-----------------------------------------
drop table if exists algorithms;

create table algorithms (
    cname varchar(100),
    ckey varchar(100),
    cvalue varchar(100),
    CONSTRAINT sys_pk_algorithms PRIMARY KEY (cname, ckey)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------
-- 任务配置表
-- DemoLogisticRegressionTrain input FileInstance1
-- DemoLogisticRegressionTrain output FileInstance2
-- DemoLogisticRegressionTrain filter LineParserInstance1 1
-- DemoLogisticRegressionTrain filter sqlConvertInstance1 2
-- DemoLogisticRegressionTrain filter LogisticRegressionTrainV1 3
-----------------------------------------
drop table if exists jobs;

create table jobs (
    id int unsigned auto_increment,
    name varchar(100),
    type varchar(10),
    plugin varchar(100),
    priority int,
    CONSTRAINT sys_pk_jobs UNIQUE KEY (name, type, plugin),
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------
-- 任务定时配置表
-- DemoLogisticRegressionTrain 定时模式 秒/分/时
-- DemoLogisticRegressionTrain 定时模式 秒/分/时
-- 定时模式：-2->不执行 -1->立刻执行 0->一次 1->每天
-----------------------------------------
drop table if exists schedules;

create table schedules (
    id int unsigned auto_increment,
    jobname varchar(100),
    type int,
    runat varchar(100),
    nextid int,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------
-- 流式任务配置表
-----------------------------------------
drop table if exists streamings;

create table streamings (
    jobname varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------
-- 插件装载路径
-----------------------------------------
drop table if exists pluginclass;

create table pluginclass (
    name varchar(100),
    type varchar(100),
    clazz varchar(300),
    CONSTRAINT sys_pk_pluginclass PRIMARY KEY (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------
-- 日志记录表
-----------------------------------------
drop table if exists logs;

create table logs (
    id int unsigned auto_increment,
    jobname varchar(100),
    sessionid varchar(100),
    act varchar(100),
    acttime datetime,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
