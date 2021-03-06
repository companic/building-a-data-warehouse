use DDS
go

if exists 
  (select * from sys.tables 
   where name = 'fact_supplier_performance')
drop table fact_supplier_performance
go

create table fact_supplier_performance
( week_key                  int      not null
, supplier_key              int      not null
, product_key               int      not null
, start_date_key            int      not null
, ordered_quantity          int
, unit_cost                 money
, ordered_value             money
, returns_quantity          int
, returns_value             money
, rejects_quantity          int
, rejects_value             money
, total_spend               money
, title_availability        decimal (9,2)
, format_availability       decimal (9,2)
, stock_outage              decimal (9,2)
, average_lead_time         smallint
, source_system_code        tinyint
, create_timestamp          datetime
, update_timestamp          datetime
, constraint pk_fact_supplier_performance
  primary key clustered
  ( week_key, supplier_key, product_key ) 
  on dds_fg4
, constraint fk_fact_supplier_performance_dim_date1
  foreign key (week_key)
  references dim_date(date_key)
, constraint fk_fact_supplier_performance_dim_supplier
  foreign key (supplier_key)
  references dim_supplier(supplier_key)
, constraint fk_fact_supplier_performance_dim_product
  foreign key (product_key)
  references dim_product(product_key)
, constraint fk_fact_supplier_performance_dim_date2
  foreign key (start_date_key)
  references dim_date(date_key)
) on dds_fg3
go

create index fact_supplier_performance_week_key
  on fact_supplier_performance(week_key)
  on dds_fg6
go


create index fact_supplier_performance_supplier_key
  on fact_supplier_performance(supplier_key)
  on dds_fg6
go

create index fact_supplier_performance_product_key
  on fact_supplier_performance(product_key)
  on dds_fg6
go