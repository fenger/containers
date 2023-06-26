create database if not exists db01;

create table if not exists db01.users
(
    id int not null,
    name varchar(32),
    age tinyint unsigned,
    birthday date,
    address varchar(256),
    primary key(id)
);
