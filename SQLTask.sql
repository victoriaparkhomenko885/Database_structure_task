CREATE DATABASE MOBILEPhone
COLLATE Cyrillic_General_CI_AS 
GO

CREATE TABLE PhoneModels
(
	ID int NOT NULL IDENTITY,
	Brand  nvarchar(55) NOT NULL,
	Model_description nvarchar(55) NOT NULL,
	Price money NOT NULL,
	Brand_vendor_phone char(12) NOT NULL
);

CREATE TABLE Consultant
(
	ID int NOT NULL IDENTITY,
	First_name  nvarchar(55) NOT NULL,
	Last_name nvarchar(55) NOT NULL,
	Expert_brand nvarchar(55) NOT NULL,
	Contact_phone char(12) NOT NULL
);

CREATE TABLE OrderPhone
( 
	ID int NOT NULL IDENTITY,
	Date_operation  nvarchar(55) NOT NULL,
	ModelID int NOT NULL,
	ConsultantID int NOT NULL,
	Price money NOT NULL
);

ALTER TABLE PhoneModels
ADD 
PRIMARY KEY (ID)
GO

ALTER TABLE Consultant
ADD 
PRIMARY KEY (ID)
GO

ALTER TABLE OrderPhone
ADD 
PRIMARY KEY (ID)
GO

ALTER TABLE PhoneModels
ADD
FOREIGN KEY (ID) REFERENCES OrderPhone(ModelID)
ON DELETE CASCADE
GO 

ALTER TABLE PhoneModels
ADD 
FOREIGN KEY (Brand) REFERENCES OrderPhone(ModelID)
ON DELETE CASCADE
GO 

ALTER TABLE OrderPhone
ADD 
FOREIGN KEY (ID) REFERENCES Consultant(ID)
ON DELETE CASCADE
GO 

---- Standard syntax  

INSERT PhoneModels
(	Brand,
	Model_description,
	Price,
	Brand_vendor_phone
)
VALUES('Apple', 'iPhone12', '10000', '123-456-77')
GO

INSERT PhoneModels
(	Brand,
	Model_description,
	Price,
	Brand_vendor_phone
)
VALUES('Samsung', 'Galaxy S21', '10000', '234-445-99')
GO

INSERT PhoneModels
(	Brand,
	Model_description,
	Price,
	Brand_vendor_phone
)
VALUES('Samsung', 'A51', '3000', '234-445-99')
GO

INSERT PhoneModels
(	Brand,
	Model_description,
	Price,
	Brand_vendor_phone
)
VALUES('Xiaomi', 'Mi7', '9000', '999-888-77')
GO

INSERT Consultant
(	
	First_name,
	Last_name,
	Expert_brand,
	Contact_phone
)
VALUES('Viktoriia', 'Parkhomenko', 'Apple', '999-888-77')
GO

INSERT Consultant
(	
    First_name,
	Last_name,
	Expert_brand,
	Contact_phone
)
VALUES('Karina', 'Kolpakova', 'Xiaomi', '994-887-77')
GO

INSERT Consultant
(	
	First_name,
	Last_name,
	Expert_brand,
	Contact_phone
)
VALUES('Vlad', 'Kolpakov', 'Apple', '999-886-79')
GO

INSERT OrderPhone
(	
	Date_operation,
	Price
)
VALUES('10/06/2022', '10000')
GO

INSERT OrderPhone
(	
	Date_operation,
	Price
)
VALUES('11/06/2022', '90000')
GO

INSERT OrderPhone
(	
	Date_operation,
	Price
)
VALUES('12/06/2022', '80000')
GO