# --- !Ups

create table pathfinder_user (
  username                  varchar(255) not null,
  password                  varchar(255) not null,
  user_token                varchar(256) not null,
  constraint pk_pathfinder_user primary key (username))
;




# --- !Downs

drop table if exists pathfinder_user cascade;

