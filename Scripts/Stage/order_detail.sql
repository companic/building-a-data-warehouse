use stage
go

create table order_detail
( order_id       int
, line_no        int
, product_code   varchar(10)
, qty            numeric(9,2)
, price          money
, unit_cost      money
)
go
