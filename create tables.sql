CREATE TABLE Games 
(	gameid char(7) NOT NULL,
	gamename varchar(50) NOT NULL,
	price numeric(5,2) NOT NULL, 
	esrbrating varchar(10) NOT NULL,
	primary key (gameid) );

CREATE TABLE Stores
(	storeid char(7) NOT NULL,
	sphonenum varchar(12) NOT NULL,
	city varchar(30) NOT NULL,
	storestate varchar(2) NOT NULL,
	zipcode char(5) NOT NULL,
	primary key(storeid) );

CREATE TABLE Developers
(	devname varchar(40) NOT NULL,
	age char(3) NOT NULL,
	areacode char(10) NOT NULL,
	countrycode char(10) NOT NULL,
	creationdate date NOT NULL,
	dphonenum varchar(12) NOT NULL,
	primary key (devname) );

CREATE TABLE Publishers
(	pubname varchar(40) NOT NULL,
	creationdate date NOT NULL,
	age char(2) NOT NULL,
	DevName varchar(40) NOT NULL,
	primary key (pubname), 
	foreign key (DevName) REFERENCES Developers(devname) );

CREATE TABLE GameGenre
(	gamegenre varchar(60) NOT NULL,
	GameID char(7) NOT NULL,
	foreign key (GameID) REFERENCES Games(gameid) );

CREATE TABLE Platforms
(	platforms varchar(50) NOT NULL,
	GameID char(7) NOT NULL,
	foreign key (GameID) REFERENCES Games(gameid) );

CREATE TABLE Developed
(	GameID char(7) NOT NULL,
	DevName varchar(40) NOT NULL,
	foreign key (GameID) REFERENCES Games(gameid), 
	foreign key (DevName) REFERENCES Developers(DevName) );

CREATE TABLE "Has A"
(	GameID char(7) NOT NULL,
	StoreID char(7) NOT NULL,
	Quantity int NOT NULL,
	foreign key (GameID) REFERENCES Games(gameid), 
	foreign key (StoreID) REFERENCES Stores(storeid) );

CREATE TABLE PubLocations
(	streetaddress varchar(50) NOT NULL,
	pubstate varchar(20) NOT NULL,
	country varchar(30) NOT NULL,
	zip char(5) NOT NULL,
	PubName varchar(25) NOT NULL,
	foreign key (PubName) REFERENCES Publishers(pubname) );

CREATE TABLE DevLocations
(	streetaddress varchar(50) NOT NULL,
	devstate varchar(20) NOT NULL,
	country varchar(30) NOT NULL,
	zip char(5) NOT NULL,
	DevName varchar(25) NOT NULL,
	foreign key (DevName) REFERENCES Developers(DevName) );