CREATE TABLE Clients 
(
  Id INT PRIMARY KEY IDENTITY NOT NULL,
  FullName NVARCHAR(100) NOT NULL,
  Birthday DATE NOT NULL,
  HomeAdress NVARCHAR(50) NOT NULL,
  PassportData NVARCHAR(50) NOT NULL,
  Gender NVARCHAR(20) NOT NULL,
  PhoneNumber NVARCHAR(20) NOT NULL
)

CREATE TABLE Currencies
(
  Id INT PRIMARY KEY IDENTITY NOT NULL,
  Balance MONEY  NOT NULL,
  Marking NVARCHAR(20) NOT NULL,
  Country NVARCHAR(50) NOT NULL,
  Course MONEY NOT NULL
)

CREATE TABLE Paymenthistories
(
  Id INT PRIMARY KEY IDENTITY NOT NULL,
  CurrencyId INT REFERENCES Currencies(Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CurrencyAmount MONEY NOT NULL,
  OperationType NVARCHAR(30) NOT NULL,
  Course MONEY NOT NULL,
  Discount MONEY NOT NULL,
  PurchaesAmount MONEY NOT NULL,
  Date DATE NOT NULL,
  Time NVARCHAR(50) NOT NULL
)

CREATE TABLE Users
(
  Id INT PRIMARY KEY IDENTITY NOT NULL,
  Login NVARCHAR(20) UNIQUE NOT NULL,
  Password NVARCHAR(20) UNIQUE NOT NULL,
  FullName NVARCHAR(50) NOT NULL,
  Role SMALLINT NOT NULL -- 0 is admin, 1 is simple user
)

INSERT INTO Users VALUES('admin', 'admin', 'Жмышенко Валерий Альбертович', 0)
INSERT INTO Users VALUES('slava', '123', 'Фикалис Антон Павлович', 1)

INSERT INTO Currencies VALUES(30000, 'USD', 'USA', 75)
INSERT INTO Currencies VALUES(50000, 'EUR', 'Germany', 99)
INSERT INTO Currencies VALUES(1000000, 'RUB', 'Russia', 99)

INSERT INTO Clients VALUES('Кравченко Николай Борисович', '2000-02-02', 'Клещева 2', '125554', 'М', '90013020302')
INSERT INTO Clients VALUES('Шастунов Николай Алекссеевич', '2000-02-02', 'Клещева 2', '125554', 'М', '90013020302')