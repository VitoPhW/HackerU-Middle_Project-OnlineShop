USE [master]
GO
/****** Object:  Database [OnlineShopV2]    Script Date: 20/12/2021 22:17:06 ******/
CREATE DATABASE [OnlineShopV2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShopV2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OnlineShopV2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShopV2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OnlineShopV2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OnlineShopV2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShopV2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShopV2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShopV2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShopV2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShopV2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShopV2] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShopV2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShopV2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShopV2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShopV2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShopV2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShopV2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShopV2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShopV2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShopV2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShopV2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShopV2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShopV2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShopV2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShopV2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShopV2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShopV2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShopV2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShopV2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineShopV2] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShopV2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShopV2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShopV2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShopV2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShopV2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineShopV2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OnlineShopV2] SET QUERY_STORE = OFF
GO
USE [OnlineShopV2]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20/12/2021 22:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 20/12/2021 22:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](40) NOT NULL,
	[CategoryDescription] [nvarchar](300) NULL,
	[ImageURL] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 20/12/2021 22:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [real] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 20/12/2021 22:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 20/12/2021 22:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NULL,
	[ProductDescription] [nvarchar](300) NULL,
	[CategoryID] [int] NULL,
	[UnitPrice] [real] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 20/12/2021 22:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](40) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[TypeName] [nvarchar](10) NULL,
	[BirthDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 20/12/2021 22:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[TypeName] [nvarchar](10) NOT NULL,
	[TypeDescription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211125174024_addUsers', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211125174346_addUserTypes', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211125174500_addOrders', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211125174530_addProducts', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211125174605_addCategories', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211125174652_addOrderDetails', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211127194148_ChangeKeyOfUserTypesTable', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211127200553_UsersRemoveBirthDate', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211127200652_UsersAddCorrectedBirthDate', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211127201145_UsersCorrectBirthDate', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211130181645_OrderDetailsRemoveUnitPrice', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211130183716_ProductsAddImageURL', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211130183944_ProductsChangeToImage', N'5.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211208100101_UserFirstNameNotRequired', N'5.0.12')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [ImageURL]) VALUES (1, N'All Items', N'All Items', N'https://lh3.googleusercontent.com/pw/AM-JKLWXfRxP30Adw8_F61XAZd-CQQl9JkRiC6r-gm0VPv7qdz47f9lWI1-jDIGqw2mOzsE6SyegegyvDf67go-nMl0H5NfP4enaAVqKX1nJfIMtYjKkoCm5xwyALMaVK7BPkbzxwM3PRixje9UEwFHxAcapCw=w426-h757-no?authuser=4')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [ImageURL]) VALUES (2, N'Hats W', N'Hats for women', N'https://images.pexels.com/photos/5257495/pexels-photo-5257495.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [ImageURL]) VALUES (3, N'Covid Mask', N'Covid masks', N'https://images.pexels.com/photos/5340241/pexels-photo-5340241.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [ImageURL]) VALUES (4, N'Skirts W', N'Skirts for women', N'https://images.pexels.com/photos/6160421/pexels-photo-6160421.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (1, 2, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (1, 4, 4, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (1, 5, 6, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (1, 8, 3, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (2, 3, 4, 0.25)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (2, 4, 2, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (4, 2, 9, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (4, 3, 4, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (4, 4, 5, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (4, 5, 4, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (4, 7, 4, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (4, 8, 4, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (4, 14, 4, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (4, 15, 2, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (4, 16, 2, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (4, 17, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (7, 16, 3, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (8, 15, 3, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10, 5, 2, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10, 7, 3, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (10, 8, 4, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11, 5, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11, 7, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (11, 14, 3, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (12, 7, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (12, 14, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (13, 5, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (14, 5, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (14, 7, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (14, 14, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (15, 7, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (16, 5, 7, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (16, 7, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (16, 8, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (17, 7, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (18, 5, 11, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (19, 7, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (19, 8, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (19, 15, 3, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (27, 15, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (1, 7, CAST(N'2021-11-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (2, 4, CAST(N'2021-12-31T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (3, 7, CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (4, 7, CAST(N'2021-11-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (5, 4, CAST(N'2021-12-31T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (6, 7, CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (7, 7, CAST(N'2021-12-17T11:41:44.4285739' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (8, 7, CAST(N'2021-12-17T11:44:14.5695564' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (9, 7, CAST(N'2021-12-17T14:17:46.9687741' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (10, 7, CAST(N'2021-12-17T14:19:47.5133322' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (11, 9, CAST(N'2021-12-17T14:34:39.7368483' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (12, 9, CAST(N'2021-12-17T16:07:52.3999072' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (13, 9, CAST(N'2021-12-17T16:08:53.4529515' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (14, 9, CAST(N'2021-12-17T16:11:24.5862704' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (15, 9, CAST(N'2021-12-17T16:11:45.4263288' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (16, 9, CAST(N'2021-12-17T16:16:43.9895139' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (17, 9, CAST(N'2021-12-17T16:17:12.7462255' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (18, 9, CAST(N'2021-12-17T16:18:29.3622617' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (19, 9, CAST(N'2021-12-17T16:51:42.0088830' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (20, 4, CAST(N'2021-12-18T21:48:41.2861305' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (21, 4, CAST(N'2021-12-18T21:49:27.7412583' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (22, 4, CAST(N'2021-12-18T21:59:36.7636371' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (23, 4, CAST(N'2021-12-18T22:01:45.4879765' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (24, 4, CAST(N'2021-12-18T22:13:11.9436925' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (25, 4, CAST(N'2021-12-18T22:15:46.2458257' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (26, 4, CAST(N'2021-12-18T22:16:42.0007011' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate]) VALUES (27, 4, CAST(N'2021-12-18T22:18:01.2994392' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CategoryID], [UnitPrice], [UnitsInStock], [Image]) VALUES (2, N'Fancy Skirt Red W S', N'Fancy Skirt Red W Small', 4, 400, 200, N'https://images.pexels.com/photos/6160421/pexels-photo-6160421.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CategoryID], [UnitPrice], [UnitsInStock], [Image]) VALUES (3, N'Hat Alegro Camel W S', N'Hat Alegro Camel W Small', 2, 350, 50, N'https://images.pexels.com/photos/2126438/pexels-photo-2126438.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CategoryID], [UnitPrice], [UnitsInStock], [Image]) VALUES (4, N'Mask Winnie the pooh L', N'Mask Winnie the Pooh Large', 3, 40, 89, N'https://lh3.googleusercontent.com/pw/AM-JKLVTF9QAwOQpIGgq1E0nMVOn4gN5y-C8mX_XOqWjufkJ-SzSNex_fkCfhzV_h3nqnvZXIH0wwlGumvWh6qBh0Bstw3ajFg52RAWRp1NEtF3Qromypx3BIuNamNTiohchnY_ZSNmsraM8EePjKbGaHdAiKQ=w426-h757-no?authuser=4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CategoryID], [UnitPrice], [UnitsInStock], [Image]) VALUES (5, N'Mask Lamas Orange L', N'Mask Lamas Orange Large', 3, 40, 5, N'https://lh3.googleusercontent.com/pw/AM-JKLXCK5KiyfdRZXQqCu9uWDw0sC3dEAmuerpzZqEa7idX2NM1PUl3t7WVdcBlAMe1PSg2f-8XyPVtJymBOCaR0Hq95eR9k9pLKG5bFDmwDBjuZjdNcBd0-8ki6rChACtZ07jhfZsUlwebUX7bbQh2Eb0zPg=w426-h757-no?authuser=4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CategoryID], [UnitPrice], [UnitsInStock], [Image]) VALUES (7, N'Mask Pink L', N'Mask Pink Large', 3, 40, 6, N'https://lh3.googleusercontent.com/pw/AM-JKLWFEGnmypVtCRDrctfkqKKRJOYUKsCHhDbVBC4qidMLyioZqYBLfCXWVnjZkW1HQL0vkMuCg0iIvqvPxN8yJqjUPvctQhshY5eZqCC9PwCrKgK8HvO4IKohCtsPgT4J4EqV6Z5orqVy1SbyEFl7pDfcBw=w426-h757-no?authuser=4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CategoryID], [UnitPrice], [UnitsInStock], [Image]) VALUES (8, N'Mask Black L', N'Mask Black Large', 3, 40, 10, N'https://lh3.googleusercontent.com/pw/AM-JKLXP8Ah8PdMKkTnasCod57AWd7bg_Hs9DekwI5oHwGfXJh-qC0GIeAox2hlm-A6BoR8iIxY0hXPAulMpvlT8pgSxjLnqt-4lBA9NtyF3e2pSTTmTPQac0uTrxRVruUW-M1m8S21JZlpkHVEauoiIyKZENw=w426-h757-no?authuser=4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CategoryID], [UnitPrice], [UnitsInStock], [Image]) VALUES (14, N'Mask Cheetah L', N'Mask Cheetah Large', 3, 40, 2, N'https://lh3.googleusercontent.com/pw/AM-JKLXMGDZWEYPJHeLsMEAhdz9m4_xHY61v6BFeJUPXKR2KRfq9pMCRvtOpNXOdvrIlqjMjBZ8a0Ae2oHYiSIG3rnweDXBnCs1-aFShiZPpQn_83uNbrnAhmoI345E5DFZ_8ldJrr_equlzXNBcILmBRfN-jg=w426-h757-no?authuser=4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CategoryID], [UnitPrice], [UnitsInStock], [Image]) VALUES (15, N'Mask Rainbow L', N'Mask Rainbow Large', 3, 40, 1, N'https://lh3.googleusercontent.com/pw/AM-JKLV9RHdS8zcWE4ZkSegFJELoaiHoTzItNir58Vo9oIKnnGUjep7hxkwopcGYVPIbvBSI0y-bMyImGkWVCPiT4qngTJ2duBK4SZtqY6WS7T6XHfeuFJh11WkzatUHpy0phN3XzH1CSv7vuXvkKAKuRe5OWg=w426-h757-no?authuser=4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CategoryID], [UnitPrice], [UnitsInStock], [Image]) VALUES (16, N'Mask Clouds L', N'Mask Clouds Large', 3, 40, 3, N'https://lh3.googleusercontent.com/pw/AM-JKLXN_eRRNGOZdTqixV6z4Mt9l8Lt03t9Mf_Tjsocjt3YjxW934wIcby0ZRu3Q6kzF9jXuHGsUsdMIPiRpq_zey5iTfh2V2Lr_pmXkbq-7giQkQ6gbfUbnG7jww-Q0YyQWbO08xx6HxfdZN0v9Vp1kE5amQ=w426-h757-no?authuser=4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CategoryID], [UnitPrice], [UnitsInStock], [Image]) VALUES (17, N'Mask Night Sky Blue-White L', N'Mask Night Sky Blue-White Large', 3, 40, 10, N'https://lh3.googleusercontent.com/pw/AM-JKLWF2GAUw5xv64foDvUkW_-D4e5je8e7mNaOXTwVS7hMQXM73SU9vYjN4nlqSeD5qy7Zu-Li72zOuWAFB96WVzox4nsLDlekJnmm5tAPRonaC8KsEgPGUTeI2RgYfd7mqLdZ9De0uaHdyOj7-dcNHUbp1g=w426-h757-no?authuser=4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CategoryID], [UnitPrice], [UnitsInStock], [Image]) VALUES (22, N'Mask Ice Cream L', N'Mask Ice Cream Large', 3, 40, 23, N'https://lh3.googleusercontent.com/pw/AM-JKLUXjOzAOpe2899Hj2LF6OFVICQwNi5DzgCPZ01RIzk_sp5vOn7hdY3gFRCbzS8nXzajK2XnzkAvRVovOe_X-mg0HjmTGdkWnC2TwrnDP2IznKtMwe7VANiQz90c8lqlTn8hgFuZxbPIh8IkEguxNtYYCA=w528-h937-no?authuser=4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CategoryID], [UnitPrice], [UnitsInStock], [Image]) VALUES (23, N'Mask Night Sky Gray L', N'Mask Night Sky Gray Large', 3, 40, 44, N'https://lh3.googleusercontent.com/pw/AM-JKLUMvCzLG4iTLEAIduDQ32nIcD7zYQ-J_QL73KD35VRzzM91JvP3qyGnuLjapkOppnJriRPpxusjYjx9w9zG8KJifkbJ6caaH5M58li-KZfG1H1GxIHf7My0U_I_YB87KurnVTeKOSI5Q3wnsDUzpv2v5w=w426-h757-no?authuser=4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CategoryID], [UnitPrice], [UnitsInStock], [Image]) VALUES (24, N'Mask Leafs Gray L', N'Mask Leafs Gray L', 3, 40, 78, N'https://lh3.googleusercontent.com/pw/AM-JKLVkBXSOhYyA1QqxZIoQSt5RFc1WXt_Q4-Gv50gPPj80_3rTLAzK8As5iuWp8Alvy7giXilueWJlcLG_1St6J-SjNllfwNAsFAyVAOCcMX9WJb3zcsBXtO1H8yV-wyl5Sb-kbTUQlX_ALKw8AmdAv2C3HA=w426-h757-no?authuser=4')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [TypeName], [BirthDate]) VALUES (4, N'Victor', N'Philipchuk', N'vitoph@gmail.com', N'A12345', N'052-5288666', N'Admin', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [TypeName], [BirthDate]) VALUES (5, N'Assis', N'Tantion', N'ATantion@gmail.com', N'A54321', N'054-1234324', N'Assistant', CAST(N'2000-01-02T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [TypeName], [BirthDate]) VALUES (6, N'Israel', N'Israelov', N'IISraelov@gmail.com', N'123456', N'054-5454545', N'Customer', CAST(N'2020-02-02T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [TypeName], [BirthDate]) VALUES (7, N'FModified2', N'LModified1', N'EmailModified1', N'1234', N'123456789', N'Customer', CAST(N'2009-02-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [TypeName], [BirthDate]) VALUES (9, N'FUpdated1', N'LUpdated1', N'Email2@gmail.com', N'', N'054-2134325', N'Customer', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [TypeName], [BirthDate]) VALUES (11, N'FCreated1', N'LCreated1', N'Email1@gmail.com', N'', N'054-1231231', N'Assistant', CAST(N'1901-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserTypes] ([TypeName], [TypeDescription]) VALUES (N'Admin', N'User with highest access rights. Can create users, cahnge price, modify inventory and all assistant can.')
INSERT [dbo].[UserTypes] ([TypeName], [TypeDescription]) VALUES (N'Assistant', N'Can: see customers history, perform orders, update products quantity.')
INSERT [dbo].[UserTypes] ([TypeName], [TypeDescription]) VALUES (N'Customer', N'Can: perform orders, see the personal orders history.')
INSERT [dbo].[UserTypes] ([TypeName], [TypeDescription]) VALUES (N'Guest', N'Unregistered customer.')
GO
/****** Object:  Index [IX_OrderDetails_ProductID]    Script Date: 20/12/2021 22:17:06 ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductID] ON [dbo].[OrderDetails]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserID]    Script Date: 20/12/2021 22:17:06 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserID] ON [dbo].[Orders]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryID]    Script Date: 20/12/2021 22:17:06 ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryID] ON [dbo].[Products]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_TypeName]    Script Date: 20/12/2021 22:17:06 ******/
CREATE NONCLUSTERED INDEX [IX_Users_TypeName] ON [dbo].[Users]
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes_TypeName] FOREIGN KEY([TypeName])
REFERENCES [dbo].[UserTypes] ([TypeName])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes_TypeName]
GO
USE [master]
GO
ALTER DATABASE [OnlineShopV2] SET  READ_WRITE 
GO
