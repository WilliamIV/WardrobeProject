USE [master]
GO
/****** Object:  Database [Wardrobe]    Script Date: 10/21/2016 9:44:33 AM ******/
CREATE DATABASE [Wardrobe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wardrobe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Wardrobe.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Wardrobe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Wardrobe_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Wardrobe] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wardrobe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wardrobe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wardrobe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wardrobe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wardrobe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wardrobe] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wardrobe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Wardrobe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wardrobe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wardrobe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wardrobe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wardrobe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wardrobe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wardrobe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wardrobe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wardrobe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Wardrobe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wardrobe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wardrobe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wardrobe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wardrobe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wardrobe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wardrobe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wardrobe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Wardrobe] SET  MULTI_USER 
GO
ALTER DATABASE [Wardrobe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wardrobe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wardrobe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wardrobe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Wardrobe] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Wardrobe]
GO
/****** Object:  Table [dbo].[BottomsTable]    Script Date: 10/21/2016 9:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BottomsTable](
	[BottomsID] [int] IDENTITY(1,1) NOT NULL,
	[NameBottom] [nvarchar](150) NOT NULL,
	[Type] [nvarchar](150) NOT NULL,
	[Color] [nvarchar](150) NOT NULL,
	[Season] [nvarchar](150) NULL,
	[Occasion] [nvarchar](150) NULL,
	[Photo] [nvarchar](150) NULL,
 CONSTRAINT [PK_BottomsTable] PRIMARY KEY CLUSTERED 
(
	[BottomsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClosetTable]    Script Date: 10/21/2016 9:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClosetTable](
	[ClosetID] [int] IDENTITY(1,1) NOT NULL,
	[TopsID] [int] NOT NULL,
	[BottomsID] [int] NOT NULL,
	[ShoesID] [int] NOT NULL,
	[HatsID] [int] NOT NULL,
 CONSTRAINT [PK_ClosetTable] PRIMARY KEY CLUSTERED 
(
	[ClosetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HatsTable]    Script Date: 10/21/2016 9:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HatsTable](
	[HatsID] [int] IDENTITY(1,1) NOT NULL,
	[NameHats] [nvarchar](150) NOT NULL,
	[Type] [nvarchar](150) NOT NULL,
	[Color] [nvarchar](150) NOT NULL,
	[Season] [nvarchar](150) NULL,
	[Occasion] [nvarchar](150) NULL,
	[Photo] [nvarchar](150) NULL,
 CONSTRAINT [PK_HatsTable] PRIMARY KEY CLUSTERED 
(
	[HatsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShoesTable]    Script Date: 10/21/2016 9:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoesTable](
	[ShoesID] [int] IDENTITY(1,1) NOT NULL,
	[NameShoes] [nvarchar](150) NOT NULL,
	[Type] [nvarchar](150) NOT NULL,
	[Color] [nvarchar](150) NOT NULL,
	[Season] [nvarchar](150) NULL,
	[Occasion] [nvarchar](150) NULL,
	[Photo] [nvarchar](150) NULL,
 CONSTRAINT [PK_ShoesTable] PRIMARY KEY CLUSTERED 
(
	[ShoesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TopsTable]    Script Date: 10/21/2016 9:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopsTable](
	[TopsID] [int] IDENTITY(1,1) NOT NULL,
	[NameTop] [nvarchar](150) NOT NULL,
	[Type] [nvarchar](150) NOT NULL,
	[Color] [nvarchar](150) NOT NULL,
	[Season] [nvarchar](150) NULL,
	[Occasion] [nvarchar](150) NULL,
	[Photo] [nvarchar](150) NULL,
 CONSTRAINT [PK_TopsTable] PRIMARY KEY CLUSTERED 
(
	[TopsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BottomsTable] ON 

INSERT [dbo].[BottomsTable] ([BottomsID], [NameBottom], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (1, N'Jeans', N'Long pants', N'Blue', N'Fall', N'Casual', N'~/Photos/Jeans.jpg')
INSERT [dbo].[BottomsTable] ([BottomsID], [NameBottom], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (2, N'Nike Shorts', N'Workout', N'Green', N'Summer', N'Workout', N'~/Photos/GreenShorts.jpg')
INSERT [dbo].[BottomsTable] ([BottomsID], [NameBottom], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (3, N'Fancy Pants', N'Dress Pants', N'Black', N'Year Round', N'Formal', N'~/Photos/BlackDressPants.jpg')
INSERT [dbo].[BottomsTable] ([BottomsID], [NameBottom], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (4, N'Chill Pants', N'Sweatpants', N'Grey', N'Fall', N'Casual', N'~/Photos/GreySweatPants.jpg')
SET IDENTITY_INSERT [dbo].[BottomsTable] OFF
SET IDENTITY_INSERT [dbo].[ClosetTable] ON 

INSERT [dbo].[ClosetTable] ([ClosetID], [TopsID], [BottomsID], [ShoesID], [HatsID]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[ClosetTable] ([ClosetID], [TopsID], [BottomsID], [ShoesID], [HatsID]) VALUES (2, 4, 2, 4, 3)
SET IDENTITY_INSERT [dbo].[ClosetTable] OFF
SET IDENTITY_INSERT [dbo].[HatsTable] ON 

INSERT [dbo].[HatsTable] ([HatsID], [NameHats], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (1, N'Cubs Throw Back', N'Baseball hat', N'Blue/Red/White', N'Year Round', N'Casual', N'~/Photos/CubsHat.jpg')
INSERT [dbo].[HatsTable] ([HatsID], [NameHats], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (2, N'Indians', N'Baseball hat', N'Red', N'Summer', N'Casual', N'~/Photos/IndiansHat.jpg')
INSERT [dbo].[HatsTable] ([HatsID], [NameHats], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (3, N'Blackhawks', N'Baseball hat', N'Black', N'Summer', N'Casual', N'~/Photos/Blackhawks.jpg')
INSERT [dbo].[HatsTable] ([HatsID], [NameHats], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (4, N'Patagonia', N'Baseball hat', N'Blue', N'Summer', N'Casual', N'~/Photos/PatagoniaHat.jpg')
SET IDENTITY_INSERT [dbo].[HatsTable] OFF
SET IDENTITY_INSERT [dbo].[ShoesTable] ON 

INSERT [dbo].[ShoesTable] ([ShoesID], [NameShoes], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (1, N'Puma', N'Soccer Shoes', N'Black/White', N'Summer', N'Playing Soccer', N'~/Photos/PumaBlack.jpg')
INSERT [dbo].[ShoesTable] ([ShoesID], [NameShoes], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (2, N'Dress Shoes', N'Wing-tips', N'Brown', N'Year Round', N'Formal', N'~/Photos/WingtipsBrown.jpg')
INSERT [dbo].[ShoesTable] ([ShoesID], [NameShoes], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (3, N'Sandals', N'Flip-flops', N'Brown', N'Summer', N'Casual', N'~/Photos/SandalsReef.jpg')
INSERT [dbo].[ShoesTable] ([ShoesID], [NameShoes], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (4, N'Nike shoes', N'Running', N'Blue', N'Summer', N'Workout', N'~/Photos/RunningShoes.jpg')
SET IDENTITY_INSERT [dbo].[ShoesTable] OFF
SET IDENTITY_INSERT [dbo].[TopsTable] ON 

INSERT [dbo].[TopsTable] ([TopsID], [NameTop], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (1, N'Ralph Lauren', N'Polo', N'Black', N'Year Round', N'Dressy', N'~/Photos/Polo.jpg')
INSERT [dbo].[TopsTable] ([TopsID], [NameTop], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (2, N'Avengers', N'Tshirt', N'Blue', N'Summer', N'Casual', N'~/Photos/Avengers.jpg')
INSERT [dbo].[TopsTable] ([TopsID], [NameTop], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (3, N'NordStroms Dress Shirt', N'Dress Shirt', N'White', N'Year Round', N'Formal', N'~/Photos/WhiteDressShirt.jpeg')
INSERT [dbo].[TopsTable] ([TopsID], [NameTop], [Type], [Color], [Season], [Occasion], [Photo]) VALUES (4, N'Hoodie', N'Sweatshirt', N'Green', N'Fall', N'Casual', N'~/Photos/GreenHoodie.jpg')
SET IDENTITY_INSERT [dbo].[TopsTable] OFF
ALTER TABLE [dbo].[ClosetTable]  WITH CHECK ADD  CONSTRAINT [FK_ClosetTable_BottomsTable] FOREIGN KEY([BottomsID])
REFERENCES [dbo].[BottomsTable] ([BottomsID])
GO
ALTER TABLE [dbo].[ClosetTable] CHECK CONSTRAINT [FK_ClosetTable_BottomsTable]
GO
ALTER TABLE [dbo].[ClosetTable]  WITH CHECK ADD  CONSTRAINT [FK_ClosetTable_HatsTable] FOREIGN KEY([HatsID])
REFERENCES [dbo].[HatsTable] ([HatsID])
GO
ALTER TABLE [dbo].[ClosetTable] CHECK CONSTRAINT [FK_ClosetTable_HatsTable]
GO
ALTER TABLE [dbo].[ClosetTable]  WITH CHECK ADD  CONSTRAINT [FK_ClosetTable_ShoesTable] FOREIGN KEY([ShoesID])
REFERENCES [dbo].[ShoesTable] ([ShoesID])
GO
ALTER TABLE [dbo].[ClosetTable] CHECK CONSTRAINT [FK_ClosetTable_ShoesTable]
GO
ALTER TABLE [dbo].[ClosetTable]  WITH CHECK ADD  CONSTRAINT [FK_ClosetTable_TopsTable] FOREIGN KEY([TopsID])
REFERENCES [dbo].[TopsTable] ([TopsID])
GO
ALTER TABLE [dbo].[ClosetTable] CHECK CONSTRAINT [FK_ClosetTable_TopsTable]
GO
USE [master]
GO
ALTER DATABASE [Wardrobe] SET  READ_WRITE 
GO
