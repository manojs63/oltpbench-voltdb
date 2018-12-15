drop table region if exists;

create table region (
   r_regionkey int not null,
   r_name varchar(55) not null,
   r_comment varchar(152) not null,
   PRIMARY KEY ( r_regionkey )
);

drop table nation if exists;
create table nation (
   n_nationkey int not null,
   n_name varchar(25) not null,
   n_regionkey int not null references region(r_regionkey), 
   n_comment varchar(152) not null,
   PRIMARY KEY ( n_nationkey )
);

drop table supplier if exists;
create table supplier (
   su_suppkey int not null,
   su_name varchar(25) not null,
   su_address varchar(40) not null,
   su_nationkey int not null references nation(n_nationkey),
   su_phone varchar(15) not null,
   su_acctbal decimal(12,2) not null,
   su_comment varchar(101) not null,
   PRIMARY KEY ( su_suppkey )
);
