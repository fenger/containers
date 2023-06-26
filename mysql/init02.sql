create database if not exists db02;

create table if not exists db02.address
(
    id int,
    name varchar(256),
    longitude double,
    latitude double,
    primary key(id)
);