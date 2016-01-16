
# --- !Ups

create table application (
  id                            varchar(255) not null,
  name                          varchar(255),
  customer_email                varchar(255),
  objective_function_id         varchar(255),
  cluster_path                  varchar(255),
  constraint pk_application primary key (id)
);

create table capacity_parameter (
  id                            bigserial not null,
  application_id                varchar(255) not null,
  parameter                     varchar(255) not null,
  constraint pk_capacity_parameter primary key (id)
);

create table cluster (
  path                          varchar(255) not null,
  authentication_token          bytea,
  constraint pk_cluster primary key (path)
);

create table commodity (
  id                            bigserial not null,
  startlatitude                 float not null,
  startlongitude                float not null,
  endlatitude                   float not null,
  endlongitude                  float not null,
  status                        integer not null,
  metadata                      json,
  cluster_path                  varchar(255),
  constraint ck_commodity_status check (status in ('3','0','1','4','2')),
  constraint pk_commodity primary key (id)
);

create table customer (
  email                         varchar(255) not null,
  password                      varchar(255) not null,
  constraint pk_customer primary key (email)
);

create table objective_function (
  id                            varchar(255) not null,
  function                      varchar(255) not null,
  constraint pk_objective_function primary key (id)
);

create table objective_parameter (
  id                            bigserial not null,
  application_id                varchar(255) not null,
  parameter                     varchar(255) not null,
  constraint pk_objective_parameter primary key (id)
);

create table vehicle (
  id                            bigserial not null,
  latitude                      float not null,
  longitude                     float not null,
  clusterpath                   varchar(255),
  status                        integer not null,
  metadata                      json,
  constraint ck_vehicle_status check (status in ('0','1')),
  constraint pk_vehicle primary key (id)
);

alter table application add constraint fk_application_customer_email foreign key (customer_email) references customer (email) on delete restrict on update restrict;
create index ix_application_customer_email on application (customer_email);

alter table application add constraint fk_application_objective_function_id foreign key (objective_function_id) references objective_function (id) on delete restrict on update restrict;
create index ix_application_objective_function_id on application (objective_function_id);

alter table application add constraint fk_application_cluster_path foreign key (cluster_path) references cluster (path) on delete restrict on update restrict;
create index ix_application_cluster_path on application (cluster_path);

alter table capacity_parameter add constraint fk_capacity_parameter_application_id foreign key (application_id) references application (id) on delete restrict on update restrict;
create index ix_capacity_parameter_application_id on capacity_parameter (application_id);

alter table commodity add constraint fk_commodity_cluster_path foreign key (cluster_path) references cluster (path) on delete restrict on update restrict;
create index ix_commodity_cluster_path on commodity (cluster_path);

alter table objective_parameter add constraint fk_objective_parameter_application_id foreign key (application_id) references application (id) on delete restrict on update restrict;
create index ix_objective_parameter_application_id on objective_parameter (application_id);

alter table vehicle add constraint fk_vehicle_clusterpath foreign key (clusterpath) references cluster (path) on delete restrict on update restrict;
create index ix_vehicle_clusterpath on vehicle (clusterpath);


# --- !Downs

alter table application drop constraint if exists fk_application_customer_email;
drop index if exists ix_application_customer_email;

alter table application drop constraint if exists fk_application_objective_function_id;
drop index if exists ix_application_objective_function_id;

alter table application drop constraint if exists fk_application_cluster_path;
drop index if exists ix_application_cluster_path;

alter table capacity_parameter drop constraint if exists fk_capacity_parameter_application_id;
drop index if exists ix_capacity_parameter_application_id;

alter table commodity drop constraint if exists fk_commodity_cluster_path;
drop index if exists ix_commodity_cluster_path;

alter table objective_parameter drop constraint if exists fk_objective_parameter_application_id;
drop index if exists ix_objective_parameter_application_id;

alter table vehicle drop constraint if exists fk_vehicle_clusterpath;
drop index if exists ix_vehicle_clusterpath;

drop table if exists application cascade;

drop table if exists capacity_parameter cascade;

drop table if exists application cascade;

drop table if exists capacity_parameter cascade;

drop table if exists customer cascade;

drop table if exists objective_function cascade;

drop table if exists objective_parameter cascade;
