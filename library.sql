create database gestion_tareas;

use gestion_tareas;

create table user (
id int primary key auto_increment not null,
name varchar(25) not null,
role enum('user', 'admin'),
is_active boolean default false,
created_at datetime default current_timestamp,
update_at datetime default current_timestamp on update current_timestamp
);

create table tasks (
id int primary key auto_increment not null,
name_task varchar(40),
description text
);

create table list_tasks (
user_id int,
foreign key (user_id) references user(id),
tasks_id int,
foreign key (tasks_id) references tasks(id),    
primary key (user_id, tasks_id),
status enum('pending', 'doing', 'done'),
created_at datetime default current_timestamp,
updated_at datetime default current_timestamp on update current_timestamp,
due_time datetime
);