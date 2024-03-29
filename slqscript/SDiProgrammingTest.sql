USE [SDiProgrammingTest]
GO
/****** Object:  StoredProcedure [dbo].[SavePerson]    Script Date: 1/16/2019 6:48:29 PM ******/
DROP PROCEDURE [dbo].[SavePerson]
GO
/****** Object:  StoredProcedure [dbo].[SaveGPA]    Script Date: 1/16/2019 6:48:29 PM ******/
DROP PROCEDURE [dbo].[SaveGPA]
GO
/****** Object:  StoredProcedure [dbo].[CreatePersonGPA]    Script Date: 1/16/2019 6:48:29 PM ******/
DROP PROCEDURE [dbo].[CreatePersonGPA]
GO
ALTER TABLE [dbo].[GPA] DROP CONSTRAINT [FK_GPA_Person]
GO
ALTER TABLE [dbo].[Person] DROP CONSTRAINT [DF_Person_Enabled]
GO
ALTER TABLE [dbo].[Person] DROP CONSTRAINT [DF_Person_DateCreated]
GO
ALTER TABLE [dbo].[GPA] DROP CONSTRAINT [DF_GPA_Enabled]
GO
ALTER TABLE [dbo].[GPA] DROP CONSTRAINT [DF_GPA_DateCreated]
GO
/****** Object:  View [dbo].[vPersonGPA]    Script Date: 1/16/2019 6:48:29 PM ******/
DROP VIEW [dbo].[vPersonGPA]
GO
/****** Object:  Table [dbo].[GPA]    Script Date: 1/16/2019 6:48:29 PM ******/
DROP TABLE [dbo].[GPA]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 1/16/2019 6:48:29 PM ******/
DROP TABLE [dbo].[Person]
GO
USE [master]
GO
/****** Object:  Database [SDiProgrammingTest]    Script Date: 1/16/2019 6:48:29 PM ******/
DROP DATABASE [SDiProgrammingTest]
GO
/****** Object:  Database [SDiProgrammingTest]    Script Date: 1/16/2019 6:48:29 PM ******/
CREATE DATABASE [SDiProgrammingTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SDiProgrammingTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SDiProgrammingTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SDiProgrammingTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SDiProgrammingTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SDiProgrammingTest] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SDiProgrammingTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SDiProgrammingTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SDiProgrammingTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SDiProgrammingTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SDiProgrammingTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SDiProgrammingTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET RECOVERY FULL 
GO
ALTER DATABASE [SDiProgrammingTest] SET  MULTI_USER 
GO
ALTER DATABASE [SDiProgrammingTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SDiProgrammingTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SDiProgrammingTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SDiProgrammingTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SDiProgrammingTest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SDiProgrammingTest', N'ON'
GO
ALTER DATABASE [SDiProgrammingTest] SET QUERY_STORE = OFF
GO
USE [SDiProgrammingTest]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SDiProgrammingTest]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 1/16/2019 6:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](25) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GPA]    Script Date: 1/16/2019 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPA](
	[GPAID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[GPATotal] [float] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_GPA] PRIMARY KEY CLUSTERED 
(
	[GPAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vPersonGPA]    Script Date: 1/16/2019 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[vPersonGPA]
AS
SELECT      dg.GPAID, dp.PersonID, dp.FirstName, dp.LastName, dp.DateOfBirth, 
			dg.GPATotal AS GPA, dg.DateCreated, dg.Enabled

FROM		dbo.GPA as dg INNER JOIN
			dbo.Person AS dp ON dp.PersonID = dg.PersonID AND dp.Enabled = 1
			 
			
GO
ALTER TABLE [dbo].[GPA] ADD  CONSTRAINT [DF_GPA_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[GPA] ADD  CONSTRAINT [DF_GPA_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[GPA]  WITH CHECK ADD  CONSTRAINT [FK_GPA_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[GPA] CHECK CONSTRAINT [FK_GPA_Person]
GO
/****** Object:  StoredProcedure [dbo].[CreatePersonGPA]    Script Date: 1/16/2019 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[CreatePersonGPA]
    @firstName NVARCHAR(25)
	,@lastName NVARCHAR(25)
	,@dateOfBirth DATETIME2(7)
	,@gpaTotal FLOAT
	,@personID INT
	,@gpaID INT OUT
AS
BEGIN

    SET NOCOUNT ON;

    BEGIN TRY
		DECLARE @RC INT

        IF @personID Is Null OR @personID < 1 
            SET @personID = -1

        BEGIN TRAN
             BEGIN
				EXECUTE @RC = [dbo].[SavePerson]
					@firstName
					,@lastName
					,@dateOfBirth
					,1
					,@personID OUTPUT
            END

           IF NOT @personID IS NULL AND LEN(@personID) > 0 BEGIN
                SET @gpaID = -1
                EXECUTE @RC = [dbo].[SaveGPA]
					@personID
					,@gpaTotal
					,1
					,@gpaID OUTPUT
            END
            
        COMMIT TRAN

    END TRY
    BEGIN CATCH
        IF XACT_STATE() = 1 AND @@trancount > 0 ROLLBACK TRANSACTION
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SaveGPA]    Script Date: 1/16/2019 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:      <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[SaveGPA]
	@personID INT
   ,@gpaTotal FLOAT
   ,@enabled BIT
   ,@gpaID INT OUT
AS
BEGIN

    

    SET NOCOUNT ON;

    BEGIN TRY

        IF @gpaID Is Null OR @gpaID < 1
            SET @gpaID = -1

       
        BEGIN TRAN

            IF @gpaID > -1 BEGIN
			--** update if any values are different **
                UPDATE [dbo].[GPA]
                    SET GPATotal = ISNULL(@gpaTotal, GPATotal)
                        ,[Enabled] = ISNULL(@enabled, [Enabled])
                        ,DateModified = GETUTCDATE()
                    WHERE Enabled = 1
					  AND GPAID = @gpaID
                      AND ( GPATotal <> ISNULL(@gpaTotal,GPATotal)
                      OR [Enabled] <> ISNULL(@enabled,[Enabled]))



            END
			
            ELSE IF @gpaID = -1 BEGIN

                INSERT INTO [dbo].[GPA]
                           ([PersonID]
                           ,[GPATotal]
                           )
                     VALUES
                           (@personID 
                           ,@gpaTotal
						   )

                SET @gpaID = SCOPE_IDENTITY()
            END

           
        COMMIT TRAN

      

    END TRY
    BEGIN CATCH
        IF XACT_STATE() = 1 AND @@trancount > 0 ROLLBACK TRANSACTION;
    END CATCH
END





GO
/****** Object:  StoredProcedure [dbo].[SavePerson]    Script Date: 1/16/2019 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[SavePerson]
	@firstName NVARCHAR(25)
   ,@lastName NVARCHAR(25)
   ,@dateOfBirth DATETIME2(7)
   ,@enabled BIT
   ,@personID INT OUT
AS
BEGIN

    --*** for right now we are not checking if the person exist ***

    SET NOCOUNT ON;

    BEGIN TRY

        IF @personID Is Null OR @personID < 1
            SET @personID = -1

       
        BEGIN TRAN

            IF @personID > -1 BEGIN

                UPDATE [dbo].[Person]
                    SET FirstName = ISNULL(@firstName, FirstName)
						,LastName = ISNULL(@lastName, LastName)
						,DateOfBirth = ISNULL(@dateOfBirth, DateOfBirth)
                        ,[Enabled] = ISNULL(@enabled, [Enabled])
                        ,DateModified = GETUTCDATE()
                    WHERE Enabled = 1
                      AND PersonID = @personID
                      AND ( FirstName <> ISNULL(@firstName,FirstName)
                      OR LastName <> ISNULL(@lastName,LastName)
                      OR DateOfBirth <> ISNULL(@dateOfBirth, DateOfBirth))



            END
			
            ELSE IF @personID = -1 BEGIN

                INSERT INTO [dbo].[Person]
                           ([FirstName]
                           ,[LastName]
						   ,[DateOfBirth]
                           )
                     VALUES
                           (@firstName
                           ,@lastName 
                           ,@dateOfBirth
						   )

                SET @personID = SCOPE_IDENTITY()
            END

           
        COMMIT TRAN

      

    END TRY
    BEGIN CATCH
        IF XACT_STATE() = 1 AND @@trancount > 0 ROLLBACK TRANSACTION;
    END CATCH
END





GO
USE [master]
GO
ALTER DATABASE [SDiProgrammingTest] SET  READ_WRITE 
GO
