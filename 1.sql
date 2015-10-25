# --- !Ups

create table cluster (
  id                        bigserial not null,
  authentication_token      varchar(255),
  constraint pk_cluster primary key (id))
;

create table commodity (
  id                        bigserial not null,
  startLatitude             float not null,
  startLongitude            float not null,
  endLatitude               float not null,
  endLongitude              float not null,
  param                     integer,
  cluster_id                bigint,
  constraint pk_commodity primary key (id))
;

create table pathfinder_application (
  id                        varchar(40) not null,
  name                      varchar(255),
  token                     varchar(255),
  cluster_id                bigint,
  constraint pk_pathfinder_application primary key (id))
;

create table vehicle (
  id                        bigserial not null,
  latitude                  float not null,
  longitude                 float not null,
  capacity                  integer not null,
  cluster_id                bigint,
  constraint pk_vehicle primary key (id))
;

alter table commodity add constraint fk_commodity_cluster_1 foreign key (cluster_id) references cluster (id);
create index ix_commodity_cluster_1 on commodity (cluster_id);
alter table pathfinder_application add constraint fk_pathfinder_application_clus_2 foreign key (cluster_id) references cluster (id);
create index ix_pathfinder_application_clus_2 on pathfinder_application (cluster_id);
alter table vehicle add constraint fk_vehicle_cluster_3 foreign key (cluster_id) references cluster (id);
create index ix_vehicle_cluster_3 on vehicle (cluster_id);



# --- !Downs

drop table if exists cluster cascade;

drop table if exists commodity cascade;

drop table if exists pathfinder_application cascade;

drop table if exists vehicle cascade;
