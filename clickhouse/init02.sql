create database if not exists db02;

create table if not exists db02.address_origin
(
    id Int64,
    name String,
    longitude Float64,
    latitude Float64,
    createTime Datetime
) engine = MergeTree
partition by toYYYYMMDD(createTime) primary key (id)
order by (id, name);
