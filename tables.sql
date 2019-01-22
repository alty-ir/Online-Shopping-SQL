CREATE TABLE Product (
  ID int AUTO_INCREMENT,
  Name varchar(50),
  Product_Code varchar(20),
  Discount int,
  Count int,
  ProducerName varchar(50),
  Price float,
  PRIMARY KEY (ID)
);


CREATE TABLE Sport_Product (
    Product_ID int,
  Color varchar(20),
    PRIMARY KEY (Product_ID),
    FOREIGN KEY (Product_ID) REFERENCES product(ID) ON DELETE CASCADE
);

CREATE TABLE Home_Product (
    Product_ID int,
  Date date,
    PRIMARY KEY (Product_ID),
    FOREIGN KEY (Product_ID) REFERENCES product(ID) ON DELETE CASCADE
);

CREATE TABLE Person (
  ID int AUTO_INCREMENT,
  FName varchar(50),
  LName varchar(50),
  PRIMARY KEY (ID)
);

CREATE TABLE Person_Address (
  Person_ID int,
  Address varchar(100),
  PRIMARY KEY (Address,Person_ID),
  FOREIGN KEY (Person_ID) REFERENCES person(ID) ON DELETE CASCADE
);

CREATE TABLE Person_Phone (
  Person_ID int,
  Phone numeric(10),
  PRIMARY KEY (Phone,Person_ID),
  FOREIGN KEY (Person_ID) REFERENCES person(ID) ON DELETE CASCADE
);

CREATE TABLE Customer (
  Person_ID int,
  ID int AUTO_INCREMENT,
  UserName varchar(20),
  PRIMARY KEY (ID),
  FOREIGN KEY (Person_ID) REFERENCES person(ID) ON DELETE CASCADE
);

CREATE TABLE Registered_Customer (
    customer_ID int,
  Credit int,
  	registerDate Date,
    PRIMARY KEY (customer_ID),
    FOREIGN KEY (customer_ID) REFERENCES customer(ID) on DELETE CASCADE
);

CREATE TABLE Product_Rating (
  Product_ID int,
  Customer_ID int,
  Rating int,
  PRIMARY KEY (Product_ID, Customer_ID),
    FOREIGN KEY (Customer_ID) REFERENCES customer(ID) on DELETE CASCADE,
    FOREIGN KEY (Product_ID) REFERENCES product(ID) on DELETE CASCADE
);

CREATE TABLE Purchase (
  ID int AUTO_INCREMENT,
  Discount int,
  DateTime datetime,
  Tax int,
  TotalPrice int,
  Type boolean,
  PRIMARY KEY (ID)
);

CREATE TABLE Company (
  ID int AUTO_INCREMENT,
  Name varchar(50),
  PRIMARY KEY (ID)
);

CREATE TABLE Company_Address (
  Company_ID int,
  Address varchar(100),
  PRIMARY KEY (Address,Company_ID),
  FOREIGN KEY (Company_ID) REFERENCES company(ID) ON DELETE CASCADE
);

CREATE TABLE Company_Phone (
  Company_ID int,
  Phone numeric(10),
  PRIMARY KEY (Phone,Company_ID),
  FOREIGN KEY (Company_ID) REFERENCES company(ID) ON DELETE CASCADE
);

CREATE TABLE Employee (
  ID int AUTO_INCREMENT,
  customer_ID int,
  Company_ID int,
  Validation boolean DEFAULT false,
  PRIMARY KEY (ID),
  FOREIGN KEY (Company_ID) REFERENCES company(ID) ON DELETE CASCADE,
  FOREIGN KEY (customer_ID) REFERENCES customer(ID) ON DELETE CASCADE
);

CREATE TABLE Employee_Purchase (
  Employee_ID int,
  Purchase_ID int,
  PRIMARY KEY (Employee_ID,Purchase_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(ID) ON DELETE CASCADE,
  FOREIGN KEY (Purchase_ID) REFERENCES Purchase(ID) ON DELETE CASCADE
);

CREATE TABLE Cart (
  ID int AUTO_INCREMENT,
  Purchase_ID int,
  Customer_ID int,
  PRIMARY KEY (ID),
  FOREIGN KEY (Purchase_ID) REFERENCES Purchase(ID) ON DELETE CASCADE,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(ID) ON DELETE CASCADE
);

CREATE TABLE Cart_Content (
  Product_ID int,
  Cart_ID int,
  Count int DEFAULT 1,
  PRIMARY KEY (Product_ID, Cart_ID),
  FOREIGN KEY (Product_ID) REFERENCES Product(ID) ON DELETE CASCADE,
  FOREIGN KEY (Cart_ID) REFERENCES Cart(ID) ON DELETE CASCADE
);

CREATE TABLE Operator (
  ID int AUTO_INCREMENT,
  FName varchar(50),
  LName varchar(50),
  Company_ID int,
  HireDate date,
  PRIMARY KEY (ID),
  FOREIGN KEY (Company_ID) REFERENCES Company(ID) ON DELETE CASCADE
);

CREATE TABLE Operator_Phone (
  Operator_ID int,
  Phone numeric(10),
  PRIMARY KEY (Phone, Operator_ID),
  FOREIGN KEY (Operator_ID) REFERENCES Operator(ID) ON DELETE CASCADE
);

CREATE TABLE Driver (
  ID int AUTO_INCREMENT,
  Person_ID int,
  License_Plate varchar(20),
  Car_Type varchar(20),
  Nation_Code numeric(10),
  Status int,
  PRIMARY KEY (ID),
  FOREIGN KEY (Person_ID) REFERENCES Person(ID) ON DELETE CASCADE
);

CREATE TABLE Delivery (
	ID int AUTO_INCREMENT,
  Purchase_ID int,
  Driver_ID int,
  Status boolean DEFAULT false,
  dateDelivered datetime, 
  PRIMARY KEY (Purchase_ID, Driver_ID, ID),
  FOREIGN KEY (Purchase_ID) REFERENCES Purchase(ID) ON DELETE CASCADE,
  FOREIGN KEY (Driver_ID) REFERENCES Driver(ID) ON DELETE CASCADE
);

CREATE TABLE Support (
  ID int AUTO_INCREMENT,
  Person_ID int,
  PRIMARY KEY (ID),
  FOREIGN KEY (Person_ID) REFERENCES Person(ID) ON DELETE CASCADE
);

CREATE TABLE Status_Support (
  ID int AUTO_INCREMENT,
  Support_ID int,
  Type boolean ,
  Status_DateTime datetime,
  PRIMARY KEY (ID),
  FOREIGN KEY (Support_ID) REFERENCES Support(ID) ON DELETE CASCADE
);

CREATE TABLE Chat (
  ID int AUTO_INCREMENT,
  Support_ID int,
  User int,
  Title varchar(100),
  Duration time,
  ChatDate Date,
  PRIMARY KEY (ID),
  FOREIGN KEY (Support_ID) REFERENCES Support(ID) ON DELETE CASCADE
);