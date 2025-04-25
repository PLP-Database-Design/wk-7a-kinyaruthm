---1NF
CREATE TABLE `productdetail` (
  `OrderId` INT NOT NULL,
  `CustomerName` VARCHAR(255) NOT NULL,
  `product` VARCHAR(255) NOT NULL);
  

INSERT INTO productdetail (OrderId,CustomerName,product) 
VALUES (101,"John Doe","Laptop"), (101,"John Doe","Mouse"),
(102,"Jane Smith","Tablet"),(102,"Jane Smith","Keyboard"),(102,"Jane Smith","Mouse"),
(103,"Emily Clark","Phone");


--2NF
--table 1
CREATE TABLE `orders` (
  `OrderId` INT NOT NULL,
  `CustomerName` VARCHAR(255) NULL,
  PRIMARY KEY (`OrderId`));
  
INSERT INTO hr.orders (OrderId,CustomerName) 
VALUES (101,"John Doe"), 
(102,"Jane Smith"),
(103,"Emily Clark");

--table 2
CREATE TABLE `orderdetails` (
  `OrderID` int(11) NOT NULL,
  `Product` varchar(255) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  KEY `OrderID_idx` (`OrderID`),
  CONSTRAINT `OrderID` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

INSERT INTO hr.orderdetails(OrderId,Product,Quantity) 
VALUES (101,"Laptop",2), 
(101,"Mouse",1), 
(102,"Tablet",3),
(102,"Keyboard",1),
(102,"Mouse",2),
(103,"Phone",1);
