

-- SUNDAY HOME WORK MULTIPLE TABLES

-- TABLE CLIENT MASTER 
create table client_master(CLIENTNO varchar(7) primary key,NAME varchar(15),Address1 varchar(20),Address2 varchar(20),CITY varchar(15),PINCODE varchar(8),STATE varchar(15),BALDUE varchar(10),CHECK(CLIENTNO like 'C%'));

insert into client_master values('C00001','lvan Byross','-','-','Mumbai','400054','maharashtra','15000');
insert into client_master values('C00002','Mamta Muzumdar','-','-','Mumbai','780001','maharashtra','0');
insert into client_master values('C00003','Chhaya Bankar','-','-','Madras','400057','Tamilnadu','5000');
insert into client_master values('C00004','Ashwini Joshi','-','-','Banglore','560001','Karnataka','0');
insert into client_master values('C00005','Hansel Colaco','-','-','Mumbai','400060','maharashtr','2000');
insert into client_master values('C00006','Deepak Sharma','-','-','Manglore','560050','Karnataka','0');



 create table product_master(PRODUCT_NO varchar(7),                       
     DESCRIPTION varchar(17),
     PROFIT_PRE varchar(5),
    UNIT_MEASURE varchar(12),
    QTY_ONHAND numeric(8),
    RECORDLVL numeric(8),
     SELLPRICE varchar(8),
     COSTPRICE varchar(8),
     constraint pk_product_no primary key(PRODUCT_NO),
     CHECK(SELLPRICE>0),
     CHECK(COSTPRICE>0),
     CHECK(PRODUCT_NO LIKE 'P%'));

insert into product_master values('P00001','T-shirt','5','piece',200,50,'350','250');
insert into product_master values('P0345','shirt','6','piece',150,50,'500','350');
insert into product_master values('P06734','jeans','5','piece',100,20,'600','450');
insert into product_master values('P07865','jeans','5','piece',100,20,'750','500');
insert into product_master values('P07868','trousers','2','piece',150,50,'850','550');
insert into product_master values('P07885','pullovers','2.5','piece',80,30,'700','450');
insert into product_master values('P07965','denimshirt','4','piece',100,40,'350','250');
insert into product_master values('P07975','Lycra Tops','5','piece',70,30,'300','175');
insert into product_master values('P08865','Skirts','5','piece',75,30,'450','300');



 create table salesman_master(SALESMANNO varchar(7) primary key,
     NAME varchar(15),
     ADDRESS1 varchar(20),
     ADDRESS2 varchar(20),
    CITY varchar(15),
     PINCODE numeric(8),
     STATE varchar(15),
    SALAMT varchar(8),
     TGTTOGET varchar(8),
     YTDSALES varchar(8),
     REMARKS varchar(10),
     CHECK(SALESMANNO LIKE 'S%'),
     CHECK(SALAMT>0),
    CHECK(TGTTOGET>0));

insert into salesman_master values('S00001','Aman','A/14','Waroli','Mumbai',400002,'maharashtra','3000','100','50','Good');
insert into salesman_master values('S00002','omkar','65','Nariman','Mumbai',400001,'maharashtra','3000','200','100','Good');
insert into salesman_master values('S00003','Raj','p-7','Bandra','Mumbai',400032,'maharashtra','3000','200','100','Good');
insert into salesman_master values('S00004','Ashish','A/5','juhu','Mumbai',400044,'maharashtra','3500','200','150','Good');


create table sales_order(ORDERNO varchar(7) primary key,
          CLIENTNO varchar(7),
          ORDERDATE Date,
          DELYADDR varchar(25),
          SALESMANNO varchar(7),
          DELYTYPE varchar(5),
          BILLYN char,
          DELYDATE Date,
          ORDERSTATUS varchar(10),
          CHECK(ORDERNO LIKE 'O%'),
          constraint fk_sale_client_id foreign key(CLIENTNO)
          references client_master(CLIENTNO),
          constraint fk_sale_sales_id foreign key(SALESMANNO)
          references salesman_master(SALESMANNO),
          CHECK(DELYTYPE IN("P","F")),
          CHECK(ORDERSTATUS IN("in process","Fulfilled","BackOrder","Cancelled")));

    mysql> desc sales_order;


insert into sales_order values('O19001','C00001','04-06-12','','S00001','F','N','02-07-20','in process');
insert into sales_order values('O19002','C00002','04-06-25','','S00002','P','N','02-06-27','Cancelled');
insert into sales_order values('O46865','C00003','04-02-18','','S00003','F','Y','02-02-20','Fulfilled');
insert into sales_order values('O19003','C00001','04-04-03','','S00001','F','Y','02-04-07','Fulfilled');
insert into sales_order values('O46866','C00004','04-05-20','','S00002','P','N','02-05-22','Cancelled');
insert into sales_order values('O19008','C00005','04-05-24','','S00004','F','N','02-07-26','in process');



 create table sales_order_details(ORDERNO varchar(7),
     PRODUCT_NO varchar(7),
     QTYORDERED numeric(8),
     QTYDISP numeric(8),
     PRODUCTRATE varchar(10),
     constraint fk_sale_order_no foreign key(ORDERNO)
     references sales_order(ORDERNO),
     constraint fk_sale_prod_no foreign key(PRODUCT_NO)
     references product_master(PRODUCT_NO));

insert into sales_order_details values('O19001','P00001', 4,4,'525');
insert into sales_order_details values('O19001','P07965', 2,1,'8400');
insert into sales_order_details values('O19001','P07885', 2,1,'5250');
insert into sales_order_details values('O19002','P00001', 10,0,'525');
insert into sales_order_details values('O46865','P07868', 3,3 ,'3150');
insert into sales_order_details values('O46865','P07885', 3,1 ,'5250');
insert into sales_order_details values('O46865','P00001', 10,10 ,'525');
insert into sales_order_details values('O46865','P0345', 4,4 ,'1050');
insert into sales_order_details values('O19003','P0345', 2,2 ,'1050');
insert into sales_order_details values('O19003','P06734',1 ,1 ,'12000');
insert into sales_order_details values('O46866','P07965',1 ,0 ,'8400');
insert into sales_order_details values('O46866','P07975',1 ,0 ,'1050');
insert into sales_order_details values('O19008','P00001',10 ,5 ,'525');
insert into sales_order_details values('O19008','P07975', 5,3 ,'1050');