USE [master]
GO
/****** Object:  Database [Компания]    Script Date: 19.05.2024 13:39:09 ******/
CREATE DATABASE [Компания]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Компания', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Компания.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Компания_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Компания_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Компания] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Компания].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Компания] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Компания] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Компания] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Компания] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Компания] SET ARITHABORT OFF 
GO
ALTER DATABASE [Компания] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Компания] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Компания] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Компания] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Компания] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Компания] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Компания] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Компания] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Компания] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Компания] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Компания] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Компания] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Компания] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Компания] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Компания] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Компания] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Компания] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Компания] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Компания] SET  MULTI_USER 
GO
ALTER DATABASE [Компания] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Компания] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Компания] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Компания] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Компания] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Компания] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Компания] SET QUERY_STORE = OFF
GO
USE [Компания]
GO
/****** Object:  Table [dbo].[Агенты]    Script Date: 19.05.2024 13:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Агенты](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Тип] [int] NOT NULL,
	[Наименование] [nvarchar](max) NOT NULL,
	[Электронная_почта] [nvarchar](max) NOT NULL,
	[Телефон] [nvarchar](max) NOT NULL,
	[ID_Логотип] [int] NULL,
	[Юридический_адрес] [nvarchar](max) NOT NULL,
	[Приоритет] [nvarchar](max) NOT NULL,
	[Директор] [nvarchar](max) NOT NULL,
	[ИНН] [nvarchar](max) NOT NULL,
	[КПП] [int] NOT NULL,
 CONSTRAINT [PK_Агенты] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Агенты_и_продукция]    Script Date: 19.05.2024 13:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Агенты_и_продукция](
	[ID_Продукция] [int] NOT NULL,
	[ID_Агенты] [int] NOT NULL,
	[Дата_реализации] [nvarchar](max) NOT NULL,
	[Количество_продукции] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Логотипы]    Script Date: 19.05.2024 13:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Логотипы](
	[ID] [int] NOT NULL,
	[Номер_логотипа] [nvarchar](max) NULL,
 CONSTRAINT [PK_Логотипы] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продукция]    Script Date: 19.05.2024 13:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продукция](
	[ID] [int] NOT NULL,
	[Наименование] [nvarchar](max) NOT NULL,
	[Тип] [nvarchar](max) NOT NULL,
	[Артикул] [int] NOT NULL,
	[Количество_человек_для_производства] [int] NOT NULL,
	[Номер_цеха_производства] [int] NOT NULL,
	[Минимальная_цена_для_агента] [money] NOT NULL,
 CONSTRAINT [PK_Продукция] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Типы]    Script Date: 19.05.2024 13:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Типы](
	[ID] [int] NOT NULL,
	[Наименование_типа] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Типы] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Агенты]  WITH CHECK ADD  CONSTRAINT [FK_Агенты_Логотипы] FOREIGN KEY([ID_Логотип])
REFERENCES [dbo].[Логотипы] ([ID])
GO
ALTER TABLE [dbo].[Агенты] CHECK CONSTRAINT [FK_Агенты_Логотипы]
GO
ALTER TABLE [dbo].[Агенты]  WITH CHECK ADD  CONSTRAINT [FK_Агенты_Типы] FOREIGN KEY([ID_Тип])
REFERENCES [dbo].[Типы] ([ID])
GO
ALTER TABLE [dbo].[Агенты] CHECK CONSTRAINT [FK_Агенты_Типы]
GO
ALTER TABLE [dbo].[Агенты_и_продукция]  WITH CHECK ADD  CONSTRAINT [FK_Агенты_и_продукция_Агенты] FOREIGN KEY([ID_Агенты])
REFERENCES [dbo].[Агенты] ([ID])
GO
ALTER TABLE [dbo].[Агенты_и_продукция] CHECK CONSTRAINT [FK_Агенты_и_продукция_Агенты]
GO
ALTER TABLE [dbo].[Агенты_и_продукция]  WITH CHECK ADD  CONSTRAINT [FK_Агенты_и_продукция_Продукция] FOREIGN KEY([ID_Продукция])
REFERENCES [dbo].[Продукция] ([ID])
GO
ALTER TABLE [dbo].[Агенты_и_продукция] CHECK CONSTRAINT [FK_Агенты_и_продукция_Продукция]
GO
USE [master]
GO
ALTER DATABASE [Компания] SET  READ_WRITE 
GO
