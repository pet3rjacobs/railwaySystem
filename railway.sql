USE [master]
GO
/****** Object:  Database [railway]    Script Date: 2019/09/25 00:20:54 ******/
CREATE DATABASE [railway]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'railway', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\railway.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'railway_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\railway_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [railway] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [railway].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [railway] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [railway] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [railway] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [railway] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [railway] SET ARITHABORT OFF 
GO
ALTER DATABASE [railway] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [railway] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [railway] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [railway] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [railway] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [railway] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [railway] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [railway] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [railway] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [railway] SET  DISABLE_BROKER 
GO
ALTER DATABASE [railway] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [railway] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [railway] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [railway] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [railway] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [railway] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [railway] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [railway] SET RECOVERY FULL 
GO
ALTER DATABASE [railway] SET  MULTI_USER 
GO
ALTER DATABASE [railway] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [railway] SET DB_CHAINING OFF 
GO
ALTER DATABASE [railway] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [railway] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [railway] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'railway', N'ON'
GO
ALTER DATABASE [railway] SET QUERY_STORE = OFF
GO
USE [railway]
GO
/****** Object:  Table [dbo].[BOOKING]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOKING](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[CoachType] [nvarchar](10) NULL,
	[SeatNumber] [nvarchar](5) NULL,
	[ScheduleID] [int] NULL,
	[FromStation] [int] NULL,
	[ToStation] [int] NULL,
	[PassengerName] [nvarchar](50) NULL,
	[IsActive] [nvarchar](5) NULL,
 CONSTRAINT [PK_BOOKING] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCHEDULE]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCHEDULE](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[StationID] [int] NULL,
	[TrainID] [int] NULL,
	[TimeIn] [time](7) NULL,
	[TimeOut] [time](7) NULL,
	[SequenceNumber] [int] NULL,
	[IsActive] [nvarchar](5) NULL,
	[Destination] [int] NULL,
 CONSTRAINT [PK_SCHEDULE] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATION]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATION](
	[StationID] [int] IDENTITY(1,1) NOT NULL,
	[StationName] [nvarchar](50) NULL,
	[IsActive] [nvarchar](5) NULL,
 CONSTRAINT [PK_STATION] PRIMARY KEY CLUSTERED 
(
	[StationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATION_TRACK]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATION_TRACK](
	[StationID] [int] NOT NULL,
	[TrackID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRACK]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRACK](
	[TrackID] [int] IDENTITY(1,1) NOT NULL,
	[TrackType] [nvarchar](50) NULL,
	[IsActive] [nvarchar](5) NULL,
 CONSTRAINT [PK_TRACK] PRIMARY KEY CLUSTERED 
(
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRAIN]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRAIN](
	[TrainID] [int] IDENTITY(1,1) NOT NULL,
	[TrainName] [nvarchar](50) NULL,
	[TotalSeats] [int] NULL,
	[IsActive] [nvarchar](5) NULL,
 CONSTRAINT [PK_TRAIN] PRIMARY KEY CLUSTERED 
(
	[TrainID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBooking]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteBooking]
	@BookingID int
AS 
BEGIN TRY
	BEGIN TRANSACTION
		UPDATE BOOKING
			SET IsActive = 'No'
		WHERE BookingID = @BookingID
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION
END CATCH
RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteTrain]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteTrain]
	--Parameters
	@TrainID int
AS
BEGIN TRY
	--Set IsActive to No
	DECLARE @IsActive nvarchar(5);
	SET @IsActive = 'No'

	BEGIN TRANSACTION
		--Set IsActive field to inactive
		UPDATE TRAIN
			SET IsActive = @IsActive
		WHERE TrainID = @TrainID
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION
END CATCH
RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertBooking]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertBooking]
	--Parameters
	@CoachType nvarchar(10),
	@SeatNumber int,
	@ScheduleID int,
	@FromStation int,
	@ToStation int,
	@PassengerName nvarchar(50)
AS
BEGIN TRY
	--Set IsActive to Yes
	DECLARE @IsActive nvarchar(5);
	SET @IsActive = 'Yes'
	--Get todays date
	DECLARE @Date date
	SET @Date = CONVERT(date, GETDATE(), 111)

	BEGIN TRANSACTION
		--Insert into booking table
		INSERT INTO BOOKING (Date,CoachType,SeatNumber,ScheduleID,FromStation,ToStation,PassengerName,IsActive)
		VALUES (@Date,@CoachType,@SeatNumber,@ScheduleID,@FromStation,@ToStation,@PassengerName,@IsActive)
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION
END CATCH
RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSchedule]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertSchedule]
	--Parameters
	@StationID int,
	@TrainID int,
	@TimeIn time,
	@TimeOut time,
	@SequenceNumber int
AS
BEGIN TRY
	--Set IsActive to Yes
	DECLARE @IsActive nvarchar(5);
	SET @IsActive = 'Yes'

	BEGIN TRANSACTION
		--Insert into schedule table
		INSERT INTO SCHEDULE (StationID,TrainID,TimeIn,TimeOut,SequenceNumber,IsActive)
		VALUES (@StationID,@TrainID,@TimeIn,@TimeOut,@SequenceNumber,@IsActive)
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION
END CATCH
RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertStation]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertStation]
	--Parameters
	@StationName nvarchar(50)
AS
BEGIN TRY
	--Set IsActive to Yes
	DECLARE @IsActive nvarchar(5);
	SET @IsActive = 'Yes'

	BEGIN TRANSACTION
		--Insert into station table
		INSERT INTO STATION (StationName,IsActive)
		VALUES (@StationName,@IsActive)
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION
END CATCH
RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertTrain]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertTrain]
	--Parameters
	@TrainName nvarchar(50),
	@TotalSeats int
AS
BEGIN TRY
	--Set IsActive to Yes
	DECLARE @IsActive nvarchar(5);
	SET @IsActive = 'Yes'

	BEGIN TRANSACTION
		--Insert into station table
		INSERT INTO TRAIN (TrainName,TotalSeats,IsActive)
		VALUES (@TrainName,@TotalSeats,@IsActive)
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION
END CATCH
RETURN

GO
/****** Object:  StoredProcedure [dbo].[sp_SelectScheduleForStation]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_SelectScheduleForStation]
	--Parameters
	@FromStation int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT sc.ScheduleID AS [Schedule],st.StationName AS [From Station], sc.TrainID AS [Train], sc.TimeOut AS [Departure], sc.SequenceNumber AS [Sequence]
	FROM SCHEDULE sc, STATION st
	WHERE st.StationID = sc.StationID
	AND sc.StationID = @FromStation
	AND sc.TimeOut IS NOT NULL
END


GO
/****** Object:  StoredProcedure [dbo].[sp_SelectTodaysBookings]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_SelectTodaysBookings]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Get todays date
	DECLARE @Date date
	SET @Date = CONVERT(date, GETDATE(), 111)

	SELECT b.BookingID AS [Booking ID], b.PassengerName AS [Passenger Name], b.Date AS [Date], st.StationName AS [From Station], b.ToStation AS [Destination]
	FROM BOOKING b,STATION st,SCHEDULE sc
	WHERE b.ScheduleID = sc.ScheduleID
		AND sc.StationID = st.StationID
		AND b.Date = @Date
		AND b.IsActive = 'Yes'
END


GO
/****** Object:  StoredProcedure [dbo].[sp_SelectTrainSchedules]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_SelectTrainSchedules]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT sc.ScheduleID AS [Schedule], st.StationName AS [From Station], sc.TrainID AS [Train], sc.TimeOut AS [Departure], sc.SequenceNumber AS [Sequence]
	FROM SCHEDULE sc, STATION st
	WHERE sc.StationID = st.StationID
END


GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBooking]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateBooking]
	@BookingID int,
	@ToStation int
AS 
BEGIN TRY
	BEGIN TRANSACTION
		UPDATE BOOKING
			SET ToStation = @ToStation
		WHERE BookingID = @BookingID
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION
END CATCH
RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateStation]    Script Date: 2019/09/25 00:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateStation]
	@StationID int,
	@StationName nvarchar(50)
AS 
BEGIN TRY
	BEGIN TRANSACTION
		UPDATE STATION
			SET StationName = @StationName
		WHERE StationID = @StationID
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION
END CATCH
RETURN
GO
USE [master]
GO
ALTER DATABASE [railway] SET  READ_WRITE 
GO
