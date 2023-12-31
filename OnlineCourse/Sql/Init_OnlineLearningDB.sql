USE [master]
GO
/****** Object:  Database [OnlineLearn]    Script Date: 7/5/2023 9:43:18 AM ******/
CREATE DATABASE [OnlineLearn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineLearn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OnlineLearn.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineLearn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OnlineLearn_log.ldf' , SIZE = 4224KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OnlineLearn] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineLearn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineLearn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineLearn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineLearn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineLearn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineLearn] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineLearn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineLearn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineLearn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineLearn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineLearn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineLearn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineLearn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineLearn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineLearn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineLearn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineLearn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineLearn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineLearn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineLearn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineLearn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineLearn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineLearn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineLearn] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineLearn] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineLearn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineLearn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineLearn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineLearn] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OnlineLearn] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineLearn] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OnlineLearn] SET QUERY_STORE = OFF
GO
USE [OnlineLearn]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CommentMsg] [nvarchar](max) NULL,
	[CommentDate] [datetime] NULL,
	[ProductID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[ParentID] [bigint] NULL,
	[Rate] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseDocument]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseDocument](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[Title] [varchar](200) NULL,
	[DateUpdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseVideo]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseVideo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[Title] [varchar](200) NULL,
	[DateUpdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Code] [varchar](10) NULL,
	[QuestionList] [varchar](200) NULL,
	[AnswerList] [varchar](200) NULL,
	[ProductID] [bigint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[TotalScore] [smallint] NULL,
	[Time] [smallint] NULL,
	[TotalQuestion] [smallint] NULL,
	[Type] [varchar](1) NULL,
	[Status] [bit] NULL,
	[QuestionEssay] [nvarchar](max) NULL,
	[UserList] [nvarchar](3000) NULL,
	[ScoreList] [varchar](200) NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NULL,
	[Detail] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](10) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludeVAT] [bit] NULL,
	[Quantity] [int] NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[ViewCount] [int] NULL,
	[LinkVideo] [varchar](50) NULL,
	[ListType] [varchar](250) NULL,
	[ListFile] [nvarchar](3000) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](3000) NULL,
	[Content] [nvarchar](max) NULL,
	[Answer] [nvarchar](4000) NULL,
	[Type] [varchar](1) NULL,
	[ProductID] [bigint] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[UserID] [bigint] NOT NULL,
	[ExamID] [bigint] NOT NULL,
	[ResultQuiz] [varchar](300) NULL,
	[ResultEssay] [nvarchar](max) NULL,
	[StartDateQuiz] [varchar](300) NULL,
	[StartTimeQuiz] [varchar](20) NULL,
	[FinishTimeQuiz] [varchar](20) NULL,
	[StartDateEssay] [datetime] NULL,
	[StartTimeEssay] [varchar](20) NULL,
	[FinishTimeEssay] [varchar](20) NULL,
	[Status] [bit] NULL,
	[Score] [varchar](10) NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NULL,
	[Describe] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Per]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Per](
	[idPer] [int] NOT NULL,
	[idRole] [int] NOT NULL,
	[Describe] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPer] ASC,
	[idRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](350) NULL,
	[Email] [nvarchar](150) NULL,
	[Phone] [varchar](20) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
	[ProductList] [varchar](250) NULL,
	[LinkImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role](
	[idUser] [int] NOT NULL,
	[idRole] [int] NOT NULL,
	[Describe] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC,
	[idRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishProduct]    Script Date: 7/5/2023 9:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishProduct](
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[IsBought] [bit] NULL,
	[DateBought] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
USE [master]
GO
ALTER DATABASE [OnlineLearn] SET  READ_WRITE 
GO
