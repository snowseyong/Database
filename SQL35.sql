create table Category
(
ID bigint,
name nvarchar(500),
notes nvarchar(250),
icon nvarchar(250),
IDparent bigint,
Slug nvarchar(160),
Meta_title nvarchar(500),
Meta_keyword nvarchar(500),
Created_date datetime,
Updated_date datetime,
Create_by bigint,
Update_by bigint,
IsDelete tinyint,
IsActive tinyint,
CONSTRAINT pk_Category PRIMARY KEY (ID)
)
create table Product 
(
ID bigint,
Name nvarchar(500),
Descriptions text,
Notes text,
Images nvarchar(550),
IDCategory bigint,
Contents text,
Price decimal,
Quantity int,
Slug nvarchar(100),
Meta_title nvarchar(100),
Meta_keyword nvarchar(500),
Meta_description nvarchar(500),
Create_date datetime,
Updated_date datetime,
Create_by bigint,
Update_by bigint,
isdelete tinyint,
isActive tinyint,
CONSTRAINT pk_Product PRIMARY KEY (ID),
CONSTRAINT fk_ProductCategory
  FOREIGN KEY (IDCategory)
  REFERENCES Category (ID)
)
create table Customer
(
ID bigint,
name nvarchar(250),
username nvarchar(50),
passwords nvarchar(32),
addr nvarchar(500),
email nvarchar(150),
phone nvarchar(20),
created_date datetime,
isDelete tinyint,
isActive tinyint,
CONSTRAINT pk_Customer PRIMARY KEY (ID)
)
create table Configuration
(
ID bigint,
name nvarchar(500),
notes text,
isDelete tinyint,
isActive tinyint,
CONSTRAINT pk_Configuration PRIMARY KEY (ID)
)
create table Product_Config
(
ID bigint,
IDProduct bigint,
IDConfig bigint,
value text,
CONSTRAINT pk_ProductConfig PRIMARY KEY (ID),
CONSTRAINT fk_Product_Config
  FOREIGN KEY (IDProduct)
  REFERENCES Product (ID),
  CONSTRAINT fk_Config_Product
  FOREIGN KEY (IDConfig)
  REFERENCES Configuration (ID)

)
create table Product_Images
(
ID bigint,
name nvarchar(250),
URLimg nvarchar(250),
IDProduct bigint,
CONSTRAINT pk_ProductImages PRIMARY KEY (ID),
CONSTRAINT fk_ProductImages_Product
  FOREIGN KEY (IDProduct)
  REFERENCES Product (ID)
)
create table NewCategory
(
ID bigint,
name nvarchar(500),
notes text,
Icon nvarchar(250),
IDParent bigint,
Slug nvarchar(150),
Metatitle nvarchar(100),
MetaKeyword nvarchar(500),
Create_date datetime,
Updated_date datetime,
Created_by bigint,
Updated_by bigint,
isDelete tinyint,
isActive tinyint,
CONSTRAINT pk_NewCategory PRIMARY KEY (ID),
CONSTRAINT fk_NewCategory_Category
  FOREIGN KEY (IDParent)
  REFERENCES Category (ID)
)
create table News
(
ID bigint,
Name nvarchar(500),
Descriptions text,
Images nvarchar(550),
IdNewCategory bigint,
Contents text,
Slug nvarchar(160),
Meta_title nvarchar(100),
MetaKeyword nvarchar(500),
Create_date datetime,
Updated_date datetime,
Created_by bigint,
Updated_by bigint,
isDelete tinyint,
isActive tinyint,
CONSTRAINT pk_News PRIMARY KEY (ID),
CONSTRAINT fk_News_NewCategory
  FOREIGN KEY (IDNewCategory)
  REFERENCES NewCategory (ID)


)
create table Orders
(
ID bigint,
IDorders char(10),
OrderDate datetime,
IDCustomer bigint,
Total_Money decimal,
Notes text,
Name_Reciver nvarchar(250),
Addr nvarchar(500),
Email nvarchar(150),
Phone nvarchar(50),
IsDelete tinyint,
isActive tinyint,

CONSTRAINT pk_Orders PRIMARY KEY (ID),
CONSTRAINT fk_Orders_Customer
  FOREIGN KEY (IDCustomer)
  REFERENCES Customer (ID)
)
create table Orders_Details
(
ID bigint,
IDorder bigint,
IDProduct bigint ,
Price decimal,
Quantity int,
Totol Decimal,
Return_Quantity int,
CONSTRAINT pk_OrdersDetails PRIMARY KEY (ID),
CONSTRAINT fk_OrdersDetails_Orders
  FOREIGN KEY (IDorder)
  REFERENCES Orders (ID),
  CONSTRAINT fk_OrdersDetails_Product
  FOREIGN KEY (IDProduct)
  REFERENCES Product (ID)
)

create table PaymentMethod
(
ID bigint,
Name nvarchar(250),
Notes text,
CreatedDate datetime,
UpdateDate datetime,
isDelete tinyint,
isActive tinyint,
CONSTRAINT pk_PaymentMethod PRIMARY KEY (ID)
)

create table OrderPayments
(
ID bigint,
IDord bigint,
IDPayment bigint,
Notes text,
isActive tinyint,
CONSTRAINT pk_OrdersPayment PRIMARY KEY (ID),
CONSTRAINT fk_OrdersPayment_Orders
  FOREIGN KEY (IDord)
  REFERENCES Orders (ID),
  CONSTRAINT fk_OrdersPayment_PaymentMethod
  FOREIGN KEY (IDPayment)
  REFERENCES PaymentMethod (ID)
)
create table Transport_Method
(
ID bigint,
Name nvarchar(250),
Notes text,
Create_date datetime,
Updated_date datetime,
Created_by bigint,
Updated_by bigint,
isDelete tinyint,
isActive tinyint,
CONSTRAINT pk_TransportMethod PRIMARY KEY (ID)
)
create table Orders_Tranport
(
ID bigint,
IDord bigint,
IDTransport bigint,
Total decimal,
Note text,
isActive tinyint,
CONSTRAINT pk_Orders_Tranport PRIMARY KEY (ID),
CONSTRAINT fk_Orders_Tranport_Orders
  FOREIGN KEY (IDord)
  REFERENCES Orders (ID),
  CONSTRAINT fk_Orders_Tranport_TranportMethod
  FOREIGN KEY (IDTransport)
  REFERENCES Transport_Method (ID)
)

