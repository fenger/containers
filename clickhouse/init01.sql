create database if not exists db01;

create table if not exists db01.users_origin
(
    id Int64,
    name String,
    age UInt8,
    address String,
    birthday Date,
    createTime Datetime
) engine = MergeTree
partition by toYYYYMMDD(createTime) primary key (id)
order by (id, name);
