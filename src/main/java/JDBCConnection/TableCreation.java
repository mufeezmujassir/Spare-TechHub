package JDBCConnection;

public class TableCreation {
	/*
	 * 
	 * CREATE TABLE `card` (
  `username` varchar(50) NOT NULL,
  `cname` varchar(45) NOT NULL,
  `cardnumber` varchar(45) NOT NULL,
  `cvv` varchar(45) NOT NULL,
  `expmonth` varchar(45) NOT NULL,
  `expyear` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idproduct` int NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `description` varchar(555) DEFAULT NULL,
  `totalamount` float DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `orders` (
  `productid` int NOT NULL,
  `pname` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `quantity` int DEFAULT NULL,
  `totalamount` double DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `payment` (
  `username` varchar(45) NOT NULL,
  `totalamount` double NOT NULL,
  `cname` varchar(45) NOT NULL,
  `cvv` varchar(45) NOT NULL,
  `expmonth` varchar(45) NOT NULL,
  `cardnumber` varchar(45) DEFAULT NULL,
  `expyear` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci




CREATE TABLE `product` (
  `idproduct` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(45) NOT NULL,
  `producttype` varchar(100) NOT NULL,
  `price` varchar(45) NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `description` varchar(5555) NOT NULL,
  `image` varchar(45) NOT NULL,
  `usrname` varchar(45) NOT NULL,
  PRIMARY KEY (`idproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `suggestion` (
  `suggestionid` int NOT NULL AUTO_INCREMENT,
  `suggestiontype` varchar(45) NOT NULL,
  `feedback` varchar(5555) NOT NULL,
  `image` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `reply` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`suggestionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci




CREATE TABLE `user` (
  `username` varchar(100) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(555) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
*/
}
