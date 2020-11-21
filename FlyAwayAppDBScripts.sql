
--ROLES TABLE--
CREATE TABLE Roles (
    RoleId  TINYINT   IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    RoleName VARCHAR (20) NOT NULL UNIQUE,

);

--INSERTION OF ROLES TABLE
SET IDENTITY_INSERT Roles ON
INSERT INTO Roles (RoleId, RoleName) VALUES (1, 'Admin')
INSERT INTO Roles (RoleId, RoleName) VALUES (2, 'User')
SET IDENTITY_INSERT Roles OFF


SELECT * from Roles

GO




--USERS TABLE--
CREATE TABLE Users(
FirstName VARCHAR(50) NOT NULL CONSTRAINT firstname_check CHECK(FirstName NOT LIKE '%[^A-Z]%') ,
LastName VARCHAR(50) NOT NULL CONSTRAINT lastname_check CHECK(LastName NOT LIKE '%[^A-Z]%'),
EmailId VARCHAR(70) NOT NULL PRIMARY KEY CONSTRAINT email_constraint CHECK(EmailId LIKE '%_@__%.__%'),
UserPassword VARCHAR(50) NOT NULL CONSTRAINT checkpassword_constraint CHECK(LEN(UserPassword)>=8 AND LEN(UserPassword)<=16),
Gender CHAR(1) NOT NULL CONSTRAINT gender_constraint CHECK(Gender in ('F','M')),
PhoneNo  NUMERIC(10) NOT NULL CONSTRAINT PhoneNo_constraint CHECK(PhoneNo NOT LIKE '0%' AND LEN(PhoneNo)=10),
DateOfBirth DATE NOT NULL  CHECK (DateOfBirth<getdate()),
UserAddress VARCHAR(200) NOT NULL,
RoleId TINYINT REFERENCES Roles(RoleId) 
)



--INSERTION FOR  USER TABLE
INSERT INTO Users( EmailId,UserPassword,RoleId,Gender, DateOfBirth,UserAddress,FirstName,LastName,PhoneNo) VALUES('Franken@gmail.com','BSBEV@1234',1,'F','1976-08-26','Fauntleroy Circus','Franken','Dan',9648483889)
INSERT INTO Users( EmailId,UserPassword,RoleId,Gender, DateOfBirth,UserAddress,FirstName,LastName,PhoneNo) VALUES('Henriot@gmail.com','CACTU@1234',2,'F','1971-09-04','Cerrito 333','Henriot','Hamram',9085474867)
INSERT INTO Users( EmailId,UserPassword,RoleId,Gender, DateOfBirth,UserAddress,FirstName,LastName,PhoneNo) VALUES('Hernadez@gmail.com','CHOPS@1234',1,'M','1981-09-18','Hauptstr. 29','Hernadez','Ham',9085474800)
INSERT INTO Users( EmailId,UserPassword,RoleId,Gender, DateOfBirth,UserAddress,FirstName,LastName,PhoneNo) VALUES('Jablonski@gmail.com','COMMI@1234',1,'M','1989-07-21','Av. dos Lus�adas, 23','Jablonski','Jab',9085474810)
INSERT INTO Users( EmailId,UserPassword,RoleId,Gender, DateOfBirth,UserAddress,FirstName,LastName,PhoneNo) VALUES('Josephs@gmail.com','CONSH@1234',2,'F','1963-11-09','Berkeley Gardens 12  Brewery','Josephs','Jos',9085474900)
INSERT INTO Users( EmailId,UserPassword,RoleId,Gender, DateOfBirth,UserAddress,FirstName,LastName,PhoneNo) VALUES('Anzio_Don@infosys.com','don@1234',1,'M','1991-02-24','Rockledge, US','Anzio','Don',9015474800)
INSERT INTO Users( EmailId,UserPassword,RoleId,Gender, DateOfBirth,UserAddress,FirstName,LastName,PhoneNo) VALUES('Karttunen@gmail.com','DRACD@1234',2,'M','1963-06-27','Walserweg 21','Karttunen','Hamier',9085174800)
INSERT INTO Users(EmailId,UserPassword,RoleId,Gender,DateOfBirth,UserAddress,FirstName,LastName,PhoneNo) VALUES('Nanditasahu@gmail.com','Nandita@123',2,'F','1997-11-03','India Jharkhand','Nandita','Sahu',7667405302)

SELECT * FROM Users



GO



--CATEGORY TABLE--
CREATE TABLE Category(
 [CategoryId]   TINYINT    IDENTITY (1, 1) PRIMARY KEY,
 [CategoryName] VARCHAR(20) NOT NULL UNIQUE

);


--INSERTION FOR CATEGORY TABLE
INSERT INTO Category VALUES('Adventure')
INSERT INTO Category VALUES('Nature')
INSERT INTO Category VALUES('Religious')
INSERT INTO Category VALUES('Village')
INSERT INTO Category VALUES('Wildlife')

SELECT * FROM Category

GO




--PACKAGES TABLE--
CREATE TABLE Packages(
PackageId TINYINT IDENTITY(1,1)  PRIMARY KEY,
PackageName VARCHAR(50)  NOT NULL,
PackageDescription VARCHAR(200)  NOT NULL,
PackageCategoryId TINYINT REFERENCES Category([CategoryId]),
ImageName VARCHAR(100)  NOT NULL,
Destination VARCHAR(20) NOT NULL CONSTRAINT destination_constraint CHECK(Destination IN ('Domestic','International'))
);




--INSERTION FOR PACKAGES TABLE

INSERT INTO Packages VALUES('Andaman & Nicobar','A set of island in the Bay of Bengal, known for its natural wildlife. Excellent place for water adventures',2,'Andaman','Domestic')
INSERT INTO Packages VALUES('North-east India', 'Known as the chicken head of India. A variety of natural life and the local environment make it an awesome place.',3,'NorthEastIndia','Domestic')
INSERT INTO Packages VALUES('Europe', 'The fun of all life happens here. From streets to the monuments every things happens here and it fun loving',1,'Europe','International')
INSERT INTO Packages VALUES('Costa Rica', 'Some say repelling and some say abselling.. its both the same thing and involves dangling,or majestically bouncing down a rock face. You will experience a survivor theme while water-rappelling at Costa Rica.',1,'Costa Rica','International')
INSERT INTO Packages VALUES('Australia', 'Explore the beautiful destination of Australia with this incredible holiday,The Fitzroy Gardens in Melbourne will be refreshing.',2,'Australia','International')
INSERT INTO Packages VALUES('Haridwar', 'A spiritual holiday in the sacred city of Haridwar is a good way to relieve yourself from the modern fast paced life',3,'Haridwar','Domestic')
INSERT INTO Packages VALUES('South India Village Tour', 'The South India Village Tour brings to visit the beautiful sunset and the city life of Cochin and peace by sailing in a houseboat in Kumarakom.',4,'South India Village Tour','Domestic')
INSERT INTO Packages VALUES('Rural Rajasthan', 'Rajasthan is a state with many elements and most importantly being its culture and heritage which has been well preserved in the rural areas of Rajasthan.',4,'Rural Rajasthan','Domestic')
INSERT INTO Packages VALUES('Serengeti', 'The Serengeti also holds rich forest and swampland, and is home to a number of national parks and preserves in Tanzania. This is the place for the safari of a lifetime.',5,'Serengeti','International')
INSERT INTO Packages VALUES('Jim corbett National Park', 'Northern Indian wildlife sanctuary with Ramganga Reservoir, Bengal tigers, leopards & elephants',5,'Jim corbett National Park','Domestic')



SELECT * FROM Packages


GO




--PACKAGEDETAILS TABLE--
CREATE TABLE PackageDetails(
PackageId TINYINT  NOT NULL references Packages(PackageId),
SerialPackageDetailsId bigint  PRIMARY KEY identity(1,1),
PlacesToVisit VARCHAR(200)  NOT NULL,
PlacesDescription VARCHAR(200)  NOT NULL,
DaysAndNight VARCHAR(20)  NOT NULL,
Price BIGINT  NOT NULL CHECK(Price>0),
Accomodation VARCHAR(50) NOT NULL CONSTRAINT check_accomodation CHECK (Accomodation IN ('Available','Not Available'))
);



--INSERTION FOR PACKAGEDETAILS TABLE

INSERT INTO PackageDetails(PackageId,PlacesToVisit,PlacesDescription,DaysAndNight,Price,Accomodation) VALUES(1,'Paris,Rome,Amsterdam,Barcelona','The fun of all life happens here. From streets to the monuments every things happens here and it fun loving','5/6',138000,'Available')
INSERT INTO PackageDetails(PackageId,PlacesToVisit,PlacesDescription,DaysAndNight,Price,Accomodation) VALUES(1,'Puerto Viejo,Cahuita,Manuel Antonio,Poas Volcano','Some say repelling and some say abselling.. its both the same thing and involves dangling,or majestically bouncing down a rock face.','7/8',120000,'Available')
INSERT INTO PackageDetails(PackageId,PlacesToVisit,PlacesDescription,DaysAndNight,Price,Accomodation) VALUES(2,'Swaraj Dweep,Andaman Island,Port Blair,Neill Island','A set of island in the Bay of Bengal, known for its natural wildlife. Excellent place for water adventures','5/6',60000,'Available')
INSERT INTO PackageDetails (PackageId,PlacesToVisit,PlacesDescription,DaysAndNight,Price,Accomodation)VALUES(2,'Melbourne,Sydney,Fraser Island,Great Barrier Reef','Explore the beautiful destination of Australia with this incredible holiday,The Fitzroy Gardens in Melbourne will be refreshing.','9/10',160000,'Available')
INSERT INTO PackageDetails (PackageId,PlacesToVisit,PlacesDescription,DaysAndNight,Price,Accomodation)VALUES(3,'Assam,Nagaland,Sikkim,Manipur','Known as the chicken head of India. A variety of natural life and the local environment make it an awesome place.','4/5',38000,'Available')
INSERT INTO PackageDetails (PackageId,PlacesToVisit,PlacesDescription,DaysAndNight,Price,Accomodation)VALUES(3,'Har Ki Pauri,Chandi Devi Temple,Chilla Wildlife Sanctuary,Mansa Devi Temple','A spiritual holiday in the sacred city of Haridwar is a good way to relieve yourself from the modern fast paced life','4/5',40000,'Available')
INSERT INTO PackageDetails (PackageId,PlacesToVisit,PlacesDescription,DaysAndNight,Price,Accomodation)VALUES(5,'Wayanad,Coorg,Cochin,Kovalam','The South India Village Tour brings to visit the beautiful sunset and the city life of Cochin and peace by sailing in a houseboat in Kumarakom.','6/7',50000,'Available')
INSERT INTO PackageDetails (PackageId,PlacesToVisit,PlacesDescription,DaysAndNight,Price,Accomodation)VALUES(5,'Bishnoi Village,Khuri Village,Bijaipur Village,Khimsar Village','Rajasthan is a state with many elements and most importantly being its culture and heritage which has been well preserved in the rural areas of Rajasthan.','10/11',85000,'Available')
INSERT INTO PackageDetails (PackageId,PlacesToVisit,PlacesDescription,DaysAndNight,Price,Accomodation)VALUES(6,'Grumeti Game reserve,Retima Hippo pool,Mbalageti serengeti','The Serengeti also holds rich forest and swampland, and is home to a number of national parks and preserves in Tanzania. This is the place for the safari of a lifetime.','5/6',55000,'Available')
INSERT INTO PackageDetails (PackageId,PlacesToVisit,PlacesDescription,DaysAndNight,Price,Accomodation)VALUES(6,'The pugmark safari,Nature Wanderers,Corbett Falls,Hanuman Dham','Northern Indian wildlife sanctuary with Ramganga Reservoir, Bengal tigers, leopards & elephants','4/5',48000,'Available')



SELECT * FROM PackageDetails


GO


--BOOKINGDETAILS TABLE--
CREATE TABLE BookingDetails(
BookingId INT IDENTITY(10,1) PRIMARY KEY,
EmailId VARCHAR(70) NOT NULL REFERENCES Users(EmailId),
SerialPackageDetailsId BIGINT NOT NULL REFERENCES PackageDetails(SerialPackageDetailsId),
PhoneNo NUMERIC (10) NOT NULL CONSTRAINT phoneno_constraint CHECK(PhoneNo NOT LIKE '0%' AND LEN(PhoneNo)=10),
UserAddress VARCHAR (200) NOT NULL,
DateOfTravel DATE NOT NULL CONSTRAINT DateOfTravel_constraint CHECK(DateOfTravel>GETDATE()),
Adults INT NOT NULL CHECK(Adults>0),
Children INT DEFAULT 0,
Price NUMERIC(9) NOT NULL,
Status VARCHAR(15) NOT NULL CONSTRAINT status_constraint CHECK(Status IN ('Booked','Confirmed'))
)

--INSERTION FOR BOOKINGDETAILS--
INSERT INTO BookingDetails(EmailId,SerialPackageDetailsId,PhoneNo,UserAddress,DateOfTravel,Adults,Children,price,Status)VALUES
('abhishek@gmail.com',1,4567892356,'jharkhand','2020-12-03',2,0,276000,'Booked')
INSERT INTO BookingDetails(EmailId,SerialPackageDetailsId,PhoneNo,UserAddress,DateOfTravel,Adults,Children,price,Status)VALUES
('Nanditasahu@gmail.com',3,7667405302,'India Jharkhand','2020-12-11',2,1,300000,'Booked')


SELECT * FROM BookingDetails


GO


--PAYMENTDETAILS TABLE--
CREATE TABLE PaymentDetails(
PaymentId INT IDENTITY(1,1) PRIMARY KEY,
BookingId INT REFERENCES BookingDetails(BookingId),
EmailId VARCHAR(70) REFERENCES Users(EmailId),
Amount DECIMAL(10,2) NOT NULL
)


--INSERTION FOR PAYMENTDETAILS
INSERT INTO PaymentDetails(BookingId,EmailId,Amount)VALUES(10,'abhishek@gmail.com',276000)
INSERT INTO PaymentDetails(BookingId,EmailId,Amount)VALUES(15,'goursha@gmail.com',560000)

SELECT * FROM PaymentDetails


GO




--PROCEDURES--

--1.PROCEDURE FOR REGISTERATION--
CREATE PROCEDURE usp_AddCustomer
(
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@EmailId VARCHAR(70),
	@UserPassword VARCHAR(50),
	@Gender CHAR(1),
	@PhoneNo VARCHAR(10),
	@DateOfBirth DATE,
	@UserAddress VARCHAR(200),
	@RoleId TINYINT
	
)
AS
BEGIN
	DECLARE @retval INT
	BEGIN TRY
		 IF (@FirstName IS NULL)
			SET @retval = -1
		ELSE IF(@LastName IS NULL)
		    SET  @retval = -2
		ELSE IF(@EmailId IS NULL)
		    SET @retval=-3
        ELSE IF(@UserPassword IS NULL)
		   SET @retval=-4
		ELSE IF(@Gender Is NULL) 
		    SET @retval=-5
		ELSE IF(@DateOfBirth Is NULL) 
		    SET @retval=-6
		ELSE IF(@PhoneNo Is NULL) 
		    SET @retval=-7
        ELSE IF(@UserAddress Is NULL) 
		    SET @retval=-8
		ELSE IF ((@FirstName LIKE '%[^A-Z]%'))   
            SET @retval = -9
		ELSE IF ((@FirstName  LIKE '% %'))
		    SET @retval=-10
         
		ELSE IF ((@LastName  LIKE '%[^A-Z]%'))    
            SET @retval = -11
		ELSE IF ((@LastName  LIKE '% %')) 
		    SET @retval=-12
	
		ELSE IF (LEN(@EmailId)<4)
			SET @retval = -13
		ELSE IF (LEN(@EmailId)>50 )
		    SET @retval=-14
		ELSE IF (LEN(@UserPassword)<8) 
			SET @retval = -15
		ELSE IF ( LEN(@UserPassword)>16 )
		    SET @retval=-16
		ELSE IF (@Gender NOT IN ('M','F') )
			SET @retval = -17
		ELSE IF ((@PhoneNo  LIKE '0%'))  
			SET @retval = -18
        ELSE IF (LEN(@PhoneNo)<>10)
		    SET @retval=-19
		ELSE IF (@DateOfBirth>=CAST(GETDATE() AS DATE))
			SET @retval = -20
		

		
			
		
		ELSE
			BEGIN
				INSERT INTO Users (FirstName,LastName,EmailId,UserPassword,Gender,PhoneNo,DateOfBirth,UserAddress,RoleId)VALUES 
				(@FirstName,@LastName, @Emailid,@UserPassword,@Gender, @PhoneNo, @DateOfBirth, @UserAddress,@RoleId)
				SET @retval = 1
			END
		RETURN @retval 
	END TRY
	BEGIN CATCH
		SET @retval = -99
		RETURN @retval 
	END CATCH
END

GO



--2.PROCEDURE FOR ADDING_BOOKING_DETAILS--

CREATE PROCEDURE usp_AddBookPackage
(
@SerialPackageDetailsId BIGINT,
@EmailId VARCHAR(70),
@PhoneNo NUMERIC (10),
@UserAddress VARCHAR (200),
@DateOfTravel DATE,
@Adults INT,
@Children INT
)
AS
BEGIN
   DECLARE @ReturnValue INT,@BookingId INT,@Temp NUMERIC(9),@Price NUMERIC(9)
   BEGIN TRY
         IF((@EmailId IS NULL ))    
             SET @ReturnValue=-1
		ELSE IF ( @PhoneNo IS NULL)
		     SET @ReturnValue=-2
		ELSE IF (@UserAddress IS NULL)
		     SET @ReturnValue=-3
		ELSE IF (@DateOfTravel IS NULL)
		     SET @ReturnValue=-4
        ELSE IF(LEN(@EmailId)<4)  
             SET @ReturnValue=-5
	    ELSE IF (LEN(@EmailId)>50)
		     SET @ReturnValue=-6
        ELSE IF((@PhoneNo  LIKE '0%' ))
             SET @ReturnValue=-7
		ELSE IF ( LEN(@PhoneNo)<>10)
		     SET @ReturnValue =-8
        ELSE IF(@Adults<1)
             SET @ReturnValue=-9
        ELSE
            BEGIN
              
                

                SELECT @Temp=price FROM PackageDetails WHERE SerialPackageDetailsId=@SerialPackageDetailsId

                SET @Price=@Temp*(@Adults+0.5*@Children)

                INSERT INTO BookingDetails(EmailId,SerialPackageDetailsId,PhoneNo,UserAddress,DateOfTravel,
                Adults,Children,Price,Status) VALUES(@EmailId,@SerialPackageDetailsId,@PhoneNo,@UserAddress,@DateOfTravel,
                @Adults,@Children,@Price,'Booked')

				SET @BookingId=IDENT_CURRENT('BookingDetails')

                SET @ReturnValue=@BookingId
            END
        RETURN @ReturnValue
   END TRY
   BEGIN CATCH
       SET @ReturnValue=-99
       RETURN @ReturnValue
   END CATCH
END

GO


--3.PROCEDURE FOR ADDING_PAYMENT_DETAILS--

CREATE PROCEDURE usp_AddPaymentDetails
(
   @BookingId INT,
   @EmailId VARCHAR(70)
  
 )
 AS
 BEGIN
    DECLARE @ReturnValue INT,@Amount DECIMAL 
   BEGIN TRY
      BEGIN
        SELECT @Amount=Price FROM BookingDetails WHERE BookingId= @BookingId;
        INSERT INTO PaymentDetails(BookingId,EmailId,Amount) VALUES (@BookingId,@EmailId,@Amount);
        UPDATE BookingDetails
          SET Status='Confirmed'WHERE BookingId=@BookingId;
        SET @ReturnValue=1;
      END
      RETURN @ReturnValue;
   END TRY
      
   BEGIN CATCH
      SET @ReturnValue=-99;
      RETURN @ReturnValue;
   END CATCH

 END


 GO

 --SCALAR  FUNCTION--

 --1.CREATE SCALAR FUNCTION FOR VALIDATING USER DURING LOGIN--
 

 CREATE FUNCTION ufn_ValidateUserCredentials
(
                @EmailId VARCHAR(50),
                @UserPassword VARCHAR(15)
)
RETURNS INT
AS
BEGIN
DECLARE @RoleId INT,@ReturnValue INT=0
                                
                               IF EXISTS (SELECT * FROM Users WHERE EmailId=@EmailId AND UserPassword=@UserPassword)
                                BEGIN
                                select @RoleId= RoleId  FROM Users WHERE EmailId=@EmailId AND UserPassword=@UserPassword
                                IF(@RoleId=1)
                                   SET @ReturnValue=1
                                ELSE IF(@RoleId=2)
                                    SET @ReturnValue=2
                                ELSE
                                   SET @ReturnValue=0
                               END
                                
                                RETURN @ReturnValue
END

GO


--TABLE VALUED FUNCTIONS--

--1.CREATE FUNCTION FOR GETTING CATEGORIES--

CREATE FUNCTION ufn_GetCategories()
RETURNS TABLE 
AS
	RETURN (SELECT * FROM Category)
GO


--2.CREATE FUNCTION FOR GETTING PACKAGES--

CREATE FUNCTION ufn_ViewAllPackages()
RETURNS TABLE
AS
RETURN
	SELECT * FROM Packages

GO



--3.CREATE FUNCTION FOR GETTING PACKAGES DEPENDING UPON CATEGORYID--

CREATE FUNCTION ufn_ViewPackageByCategory(@categoryId TINYINT)
RETURNS TABLE
AS
RETURN 
	SELECT * FROM Packages WHERE PackageCategoryId=@categoryID

GO

--4.CREATE FUNCTION FOR COUNTING PACKAGES DEPENDING UPON CATEGORYID--

CREATE FUNCTION ufn_PackageByPackageCategoryId()
RETURNS TABLE
AS
   RETURN (SELECT CategoryName AS 'PackageCategoryId',COUNT(PackageCategoryId) AS 'Number Of Packages' from Packages INNER JOIN Category ON Category.CategoryId=Packages.PackageCategoryId GROUP BY CategoryName)

GO


--5.CREATE FUNCTION FOR COUNTING BOOKINGS DEPENDING UPON PACKAGENAME--

CREATE FUNCTION ufn_BookingBasedOnPackageName()
RETURNS TABLE
AS
   RETURN (SELECT PackageName AS 'Bookings based on PackageName',COUNT(BookingId) AS 'Number of Bookings' FROM Packages INNER JOIN PackageDetails ON Packages.PackageId=PackageDetails.PackageId INNER JOIN BookingDetails ON 
BookingDetails.SerialPackageDetailsId=PackageDetails.SerialPackageDetailsId GROUP BY PackageName)

GO


--6.CREATE FUNCTION COUNTING BOOKINGS ON GIVEN MONTH--

CREATE FUNCTION ufn_GetBookingOnGivenMonth(@Month INT,@Year INT)
RETURNS TABLE
AS 
RETURN
(
SELECT SerialPackageDetailsId,COUNT(*) AS 'NumberOfBookings'  FROM BookingDetails
WHERE DATEPART(MONTH,DateOfTravel)=@Month
AND DATEPART(YEAR,DateOfTravel)=@Year
GROUP BY SerialPackageDetailsId
)

GO