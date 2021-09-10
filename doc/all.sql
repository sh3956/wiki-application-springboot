drop table if exists `test`;
create table `test` (
                        `id` bigint not null comment 'id',
                        `name` varchar(50) comment 'name',
                        `password` varchar(50) comment 'password',
                        primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='test';

insert into `test` (id, name, password) values (1, 'test', 'password');

###
drop table if exists `demo`;
create table `demo` (
                        `id` bigint not null comment 'id',
                        `name` varchar(50) comment 'name',
                        primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='test';

insert into `demo` (id, name) values (1, 'test');

###
drop table if exists `ebook`;
create table `ebook`
(
    `id`           bigint not null comment 'id',
    `name`         varchar(50) comment 'name',
    `category1_id` bigint comment 'category_1',
    `category2_id` bigint comment 'category_2',
    `description`  varchar(200) comment 'description',
    `cover`        varchar(200) comment 'cover',
    `doc_count`    int comment 'number of documents',
    `view_count`   int comment 'number of views',
    `vote_count`   int comment 'number of votes',
    primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='ebook';

insert into `ebook` (id, name, description) values (1, 'Spring Boot Beginning Tutorial',
                    'Java Application, the best framework for enterprise application development')
insert into `ebook` (id, name, description) values (2, 'Vue Beginning Tutorial',
                    'Vue Application, the preferred framework for enterprise application development')
insert into `ebook` (id, name, description) values (3, 'Python Beginning Tutorial',
                    'Python Application, the best framework for enterprise application development')
insert into `ebook` (id, name, description) values (4, 'Mysql Beginning Tutorial',
                    'Mysql Application, the preferred framework for enterprise application development')
insert into `ebook` (id, name, description) values (5, 'Oracle Beginning Tutorial',
                    'Oracle Application, the best framework for enterprise application development')
