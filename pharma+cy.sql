USE [master]
GO
/****** Object:  Database [OnlinePharmacy]    Script Date: 10/17/2019 10:47:50 AM ******/
CREATE DATABASE [OnlinePharmacy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlinePharmacy', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OnlinePharmacy.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlinePharmacy_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OnlinePharmacy_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlinePharmacy] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlinePharmacy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlinePharmacy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlinePharmacy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlinePharmacy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlinePharmacy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlinePharmacy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlinePharmacy] SET  MULTI_USER 
GO
ALTER DATABASE [OnlinePharmacy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlinePharmacy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlinePharmacy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlinePharmacy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OnlinePharmacy] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlinePharmacy', N'ON'
GO
USE [OnlinePharmacy]
GO
/****** Object:  Table [dbo].[City]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[City_ID] [int] IDENTITY(1,1) NOT NULL,
	[City_Name] [varchar](90) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[City_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Collections]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collections](
	[Collections_ID] [int] IDENTITY(1,1) NOT NULL,
	[Collections_Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Collections_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CollectionsLocation]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CollectionsLocation](
	[Location_ID] [int] NOT NULL,
	[Collections_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CommunityLeader]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommunityLeader](
	[CommunityLeader_ID] [int] IDENTITY(1,1) NOT NULL,
	[CommunityLeader_Name] [varchar](30) NOT NULL,
	[CommunityLeader_Surname] [varchar](30) NOT NULL,
	[CommunityLeader_PhoneNumber] [numeric](10, 0) NOT NULL,
	[CommunityLeader_Race] [varchar](20) NOT NULL,
	[Village_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommunityLeader_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CommunityLeaderCollections]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunityLeaderCollections](
	[CommunityLeader_ID] [int] NOT NULL,
	[Collections_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consultation]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultation](
	[Consultation_ID] [int] IDENTITY(1,1) NOT NULL,
	[Consultation_Date] [date] NOT NULL,
	[MedicalPracticioner_ID] [int] NOT NULL,
	[Patient_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Consultation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Country_ID] [int] IDENTITY(1,1) NOT NULL,
	[Country_Name] [varchar](90) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Country_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctor](
	[Doctor_ID] [int] IDENTITY(1,1) NOT NULL,
	[Doctor_Name] [varchar](30) NOT NULL,
	[Doctor_Surname] [varchar](30) NOT NULL,
	[Doctor_Email] [varchar](320) NOT NULL,
	[Doctor_PhoneNumber] [numeric](10, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Doctor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gender](
	[Gender_ID] [int] IDENTITY(1,1) NOT NULL,
	[Gender_Type] [varchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Gender_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LeaderType]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LeaderType](
	[LeaderType_ID] [int] IDENTITY(1,1) NOT NULL,
	[LeaderType_Position] [varchar](90) NULL,
	[CommunityLeader_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LeaderType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Location_ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationType_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Location_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LocationType]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocationType](
	[LocationType_ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationType_Description] [varchar](90) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[Login_ID] [int] IDENTITY(1,1) NOT NULL,
	[Login_Username] [varchar](50) NOT NULL,
	[Login_Password] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Login_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MedicalPractitioner]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MedicalPractitioner](
	[MedicalPractitioner_ID] [int] IDENTITY(1,1) NOT NULL,
	[Doctor_ID] [int] NULL,
	[Nurse_ID] [int] NOT NULL,
	[MedicalPractitioner_Name] [varchar](30) NOT NULL,
	[MedicalPractitioner_Surname] [varchar](30) NOT NULL,
	[MedicalPractitioner_Title] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicalPractitioner_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MedicalRecord]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecord](
	[MedicalRecord_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicalRecord_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medication]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medication](
	[Medication_ID] [int] IDENTITY(1,1) NOT NULL,
	[Medication_Type] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Medication_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[medicationLocation]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medicationLocation](
	[Location_ID] [int] NOT NULL,
	[Medication_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nurse]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nurse](
	[Nurse_ID] [int] IDENTITY(1,1) NOT NULL,
	[Nurse_Name] [varchar](30) NOT NULL,
	[Nurse_Surname] [varchar](30) NOT NULL,
	[Nurse_Email] [varchar](320) NOT NULL,
	[Nurse_PhoneNumber] [numeric](10, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nurse_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[Patient_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_Name] [varchar](30) NOT NULL,
	[Patient_Surname] [varchar](30) NOT NULL,
	[Patient_PhoneNumber] [numeric](10, 0) NOT NULL,
	[Patient_IDNumber] [varchar](13) NOT NULL,
	[Patient_Race] [varchar](20) NOT NULL,
	[Gender_ID] [int] NULL,
	[City_ID] [int] NULL,
	[Village_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Patient_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[Prescription_ID] [int] IDENTITY(1,1) NOT NULL,
	[Prescription_Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Prescription_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrescriptionLine]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrescriptionLine](
	[PrescriptionLine_ID] [int] IDENTITY(1,1) NOT NULL,
	[PrescriptionLine_Quantity] [varchar](100) NOT NULL,
	[Prescription_ID] [int] NOT NULL,
	[Medication_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PrescriptionLine_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Region]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Region](
	[Region_ID] [int] IDENTITY(1,1) NOT NULL,
	[Region_Name] [varchar](90) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Region_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suburb]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suburb](
	[Suburb_ID] [int] IDENTITY(1,1) NOT NULL,
	[Suburb_Name] [varchar](90) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Suburb_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Village]    Script Date: 10/17/2019 10:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Village](
	[Village_ID] [int] IDENTITY(1,1) NOT NULL,
	[Village_Name] [varchar](90) NULL,
PRIMARY KEY CLUSTERED 
(
	[Village_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CollectionsLocation]  WITH CHECK ADD FOREIGN KEY([Collections_ID])
REFERENCES [dbo].[Collections] ([Collections_ID])
GO
ALTER TABLE [dbo].[CollectionsLocation]  WITH CHECK ADD FOREIGN KEY([Location_ID])
REFERENCES [dbo].[Location] ([Location_ID])
GO
ALTER TABLE [dbo].[CommunityLeader]  WITH CHECK ADD FOREIGN KEY([Village_ID])
REFERENCES [dbo].[Village] ([Village_ID])
GO
ALTER TABLE [dbo].[CommunityLeaderCollections]  WITH CHECK ADD FOREIGN KEY([Collections_ID])
REFERENCES [dbo].[Collections] ([Collections_ID])
GO
ALTER TABLE [dbo].[CommunityLeaderCollections]  WITH CHECK ADD FOREIGN KEY([CommunityLeader_ID])
REFERENCES [dbo].[CommunityLeader] ([CommunityLeader_ID])
GO
ALTER TABLE [dbo].[Consultation]  WITH CHECK ADD FOREIGN KEY([MedicalPracticioner_ID])
REFERENCES [dbo].[MedicalPractitioner] ([MedicalPractitioner_ID])
GO
ALTER TABLE [dbo].[Consultation]  WITH CHECK ADD FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
GO
ALTER TABLE [dbo].[LeaderType]  WITH CHECK ADD FOREIGN KEY([CommunityLeader_ID])
REFERENCES [dbo].[CommunityLeader] ([CommunityLeader_ID])
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD FOREIGN KEY([LocationType_ID])
REFERENCES [dbo].[LocationType] ([LocationType_ID])
GO
ALTER TABLE [dbo].[MedicalPractitioner]  WITH CHECK ADD FOREIGN KEY([Doctor_ID])
REFERENCES [dbo].[Doctor] ([Doctor_ID])
GO
ALTER TABLE [dbo].[MedicalPractitioner]  WITH CHECK ADD FOREIGN KEY([Nurse_ID])
REFERENCES [dbo].[Nurse] ([Nurse_ID])
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
GO
ALTER TABLE [dbo].[medicationLocation]  WITH CHECK ADD FOREIGN KEY([Location_ID])
REFERENCES [dbo].[Location] ([Location_ID])
GO
ALTER TABLE [dbo].[medicationLocation]  WITH CHECK ADD FOREIGN KEY([Medication_ID])
REFERENCES [dbo].[Medication] ([Medication_ID])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([City_ID])
REFERENCES [dbo].[City] ([City_ID])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([Gender_ID])
REFERENCES [dbo].[Gender] ([Gender_ID])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([Village_ID])
REFERENCES [dbo].[Village] ([Village_ID])
GO
ALTER TABLE [dbo].[PrescriptionLine]  WITH CHECK ADD FOREIGN KEY([Medication_ID])
REFERENCES [dbo].[Medication] ([Medication_ID])
GO
ALTER TABLE [dbo].[PrescriptionLine]  WITH CHECK ADD FOREIGN KEY([Prescription_ID])
REFERENCES [dbo].[Prescription] ([Prescription_ID])
GO
USE [master]
GO
ALTER DATABASE [OnlinePharmacy] SET  READ_WRITE 
GO
