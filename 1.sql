# --- !Ups
create table cluster (
  id                        bigserial not null,
  parent_id                 bigint,
  authentication_token      bytea not null,
  constraint pk_cluster primary key (id))
;

create table commodity (
  id                        bigserial not null,
  startLatitude             float not null,
  startLongitude            float not null,
  endLatitude               float not null,
  endLongitude              float not null,
  status                    integer not null,
  param                     integer,
  cluster_id                bigint,
  constraint ck_commodity_status check (status in ('3','0','1','4','2')),
  constraint pk_commodity primary key (id))
;

create table pathfinder_application (
  id                        varchar(40) not null,
  name                      varchar(255),
  token                     bytea not null,
  cluster_id                bigint,
  constraint pk_pathfinder_application primary key (id))
;

create table pathfinder_user (
  username                  varchar(255) not null,
  password                  varchar(255) not null,
  user_token                bytea not null,
  constraint pk_pathfinder_user primary key (username))
;

create table vehicle (
  id                        bigserial not null,
  latitude                  float not null,
  longitude                 float not null,
  capacity                  integer not null,
  status                    integer not null,
  cluster_id                bigint,
  constraint ck_vehicle_status check (status in ('0','1')),
  constraint pk_vehicle primary key (id))
;

alter table cluster add constraint fk_cluster_parentCluster_1 foreign key (parent_id) references cluster (id) on delete restrict on update restrict;
create index ix_cluster_parentCluster_1 on cluster (parent_id);
alter table commodity add constraint fk_commodity_cluster_2 foreign key (cluster_id) references cluster (id) on delete restrict on update restrict;
create index ix_commodity_cluster_2 on commodity (cluster_id);
alter table pathfinder_application add constraint fk_pathfinder_application_clus_3 foreign key (cluster_id) references cluster (id) on delete restrict on update restrict;
create index ix_pathfinder_application_clus_3 on pathfinder_application (cluster_id);
alter table vehicle add constraint fk_vehicle_cluster_4 foreign key (cluster_id) references cluster (id) on delete restrict on update restrict;
create index ix_vehicle_cluster_4 on vehicle (cluster_id);


# --- !Downs
SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists cluster cascade;

drop table if exists commodity cascade;

drop table if exists pathfinder_application cascade;

drop table if exists pathfinder_user cascade;

drop table if exists vehicle cascade;

SET REFERENTIAL_INTEGRITY TRUE;
