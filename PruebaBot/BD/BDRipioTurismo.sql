USE [master]
GO
/****** Object:  Database [BDRipioTurismo]    Script Date: 29/5/2023 12:12:51 ******/
CREATE DATABASE [BDRipioTurismo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDRipioTurismo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDRipioTurismo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDRipioTurismo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDRipioTurismo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BDRipioTurismo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDRipioTurismo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDRipioTurismo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDRipioTurismo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDRipioTurismo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDRipioTurismo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDRipioTurismo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET RECOVERY FULL 
GO
ALTER DATABASE [BDRipioTurismo] SET  MULTI_USER 
GO
ALTER DATABASE [BDRipioTurismo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDRipioTurismo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDRipioTurismo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDRipioTurismo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDRipioTurismo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDRipioTurismo', N'ON'
GO
ALTER DATABASE [BDRipioTurismo] SET QUERY_STORE = OFF
GO
USE [BDRipioTurismo]
GO
/****** Object:  User [alumno]    Script Date: 29/5/2023 12:12:51 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Actividades]    Script Date: 29/5/2023 12:12:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividades](
	[idActividad] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[idCiudad] [int] NOT NULL,
	[Duracion] [int] NULL,
 CONSTRAINT [PK_Actividades] PRIMARY KEY CLUSTERED 
(
	[idActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActividadesXTour]    Script Date: 29/5/2023 12:12:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadesXTour](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTour] [int] NULL,
	[idActividad] [int] NULL,
	[Fecha] [date] NULL,
	[Hora] [time](7) NULL,
 CONSTRAINT [PK_ActividadesXTour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudades]    Script Date: 29/5/2023 12:12:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudades](
	[idCiudad] [int] IDENTITY(1,1) NOT NULL,
	[idPais] [int] NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Ciudades] PRIMARY KEY CLUSTERED 
(
	[idCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hoteles]    Script Date: 29/5/2023 12:12:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hoteles](
	[idHotel] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Ubicacion] [varchar](max) NULL,
	[Rating] [nchar](5) NULL,
	[Descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_Hoteles] PRIMARY KEY CLUSTERED 
(
	[idHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelxTour]    Script Date: 29/5/2023 12:12:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelxTour](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTour] [int] NULL,
	[idHotel] [int] NULL,
	[FechaDesde] [date] NULL,
	[FechaHasta] [date] NULL,
 CONSTRAINT [PK_HotelxTour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 29/5/2023 12:12:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[idPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reseñas]    Script Date: 29/5/2023 12:12:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reseñas](
	[idReseña] [int] NOT NULL,
	[descripcion] [varchar](max) NULL,
	[idUsuario] [int] NULL,
	[idTour] [int] NULL,
 CONSTRAINT [PK_Reseñas] PRIMARY KEY CLUSTERED 
(
	[idReseña] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 29/5/2023 12:12:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[idTour] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[Duracion] [int] NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[idTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourXCiudades]    Script Date: 29/5/2023 12:12:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourXCiudades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTour] [int] NOT NULL,
	[idCiudad] [int] NOT NULL,
 CONSTRAINT [PK_TourXCiudades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 29/5/2023 12:12:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [varchar](100) NOT NULL,
	[NumPasaporte] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelos]    Script Date: 29/5/2023 12:12:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelos](
	[idVuelo] [int] IDENTITY(1,1) NOT NULL,
	[codigoVuelo] [varchar](8) NULL,
	[aerolinea] [varchar](25) NULL,
 CONSTRAINT [PK_Vuelos] PRIMARY KEY CLUSTERED 
(
	[idVuelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VuelosxTour]    Script Date: 29/5/2023 12:12:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VuelosxTour](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTour] [int] NOT NULL,
	[idVuelo] [int] NOT NULL,
	[Fecha] [date] NULL,
 CONSTRAINT [PK_VuelosxTour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ciudades] ON 

INSERT [dbo].[Ciudades] ([idCiudad], [idPais], [Descripcion], [Nombre]) VALUES (2, 1, N'abc', N'Buenos Aires')
SET IDENTITY_INSERT [dbo].[Ciudades] OFF
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 

INSERT [dbo].[Paises] ([idPais], [Nombre]) VALUES (1, N'Argentina')
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([idTour], [Descripcion], [Duracion]) VALUES (15, N'as', 1)
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
SET IDENTITY_INSERT [dbo].[TourXCiudades] ON 

INSERT [dbo].[TourXCiudades] ([id], [idTour], [idCiudad]) VALUES (7, 15, 2)
SET IDENTITY_INSERT [dbo].[TourXCiudades] OFF
GO
SET IDENTITY_INSERT [dbo].[Vuelos] ON 

INSERT [dbo].[Vuelos] ([idVuelo], [codigoVuelo], [aerolinea]) VALUES (1, N'AR1364', N'Aerolineas Argentinas')
INSERT [dbo].[Vuelos] ([idVuelo], [codigoVuelo], [aerolinea]) VALUES (2, N'H2 -5570', N'Sky Airline')
INSERT [dbo].[Vuelos] ([idVuelo], [codigoVuelo], [aerolinea]) VALUES (3, N'AR1478', N'Aerolineas Argentinas')
SET IDENTITY_INSERT [dbo].[Vuelos] OFF
GO
ALTER TABLE [dbo].[ActividadesXTour]  WITH CHECK ADD  CONSTRAINT [FK_ActividadesXTour_Actividades] FOREIGN KEY([idActividad])
REFERENCES [dbo].[Actividades] ([idActividad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActividadesXTour] CHECK CONSTRAINT [FK_ActividadesXTour_Actividades]
GO
ALTER TABLE [dbo].[ActividadesXTour]  WITH CHECK ADD  CONSTRAINT [FK_ActividadesXTour_Tour] FOREIGN KEY([idTour])
REFERENCES [dbo].[Tour] ([idTour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActividadesXTour] CHECK CONSTRAINT [FK_ActividadesXTour_Tour]
GO
ALTER TABLE [dbo].[Ciudades]  WITH CHECK ADD  CONSTRAINT [FK_Ciudades_Paises] FOREIGN KEY([idPais])
REFERENCES [dbo].[Paises] ([idPais])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ciudades] CHECK CONSTRAINT [FK_Ciudades_Paises]
GO
ALTER TABLE [dbo].[HotelxTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelxTour_Hoteles] FOREIGN KEY([idHotel])
REFERENCES [dbo].[Hoteles] ([idHotel])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HotelxTour] CHECK CONSTRAINT [FK_HotelxTour_Hoteles]
GO
ALTER TABLE [dbo].[HotelxTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelxTour_Tour] FOREIGN KEY([idTour])
REFERENCES [dbo].[Tour] ([idTour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HotelxTour] CHECK CONSTRAINT [FK_HotelxTour_Tour]
GO
ALTER TABLE [dbo].[Reseñas]  WITH CHECK ADD  CONSTRAINT [FK_Reseñas_Tour] FOREIGN KEY([idTour])
REFERENCES [dbo].[Tour] ([idTour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reseñas] CHECK CONSTRAINT [FK_Reseñas_Tour]
GO
ALTER TABLE [dbo].[Reseñas]  WITH CHECK ADD  CONSTRAINT [FK_Reseñas_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reseñas] CHECK CONSTRAINT [FK_Reseñas_Usuario]
GO
ALTER TABLE [dbo].[TourXCiudades]  WITH CHECK ADD  CONSTRAINT [FK_TourXCiudades_Ciudades] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudades] ([idCiudad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TourXCiudades] CHECK CONSTRAINT [FK_TourXCiudades_Ciudades]
GO
ALTER TABLE [dbo].[TourXCiudades]  WITH CHECK ADD  CONSTRAINT [FK_TourXCiudades_Tour1] FOREIGN KEY([idTour])
REFERENCES [dbo].[Tour] ([idTour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TourXCiudades] CHECK CONSTRAINT [FK_TourXCiudades_Tour1]
GO
ALTER TABLE [dbo].[VuelosxTour]  WITH CHECK ADD  CONSTRAINT [FK_VuelosxTour_Tour] FOREIGN KEY([idTour])
REFERENCES [dbo].[Tour] ([idTour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VuelosxTour] CHECK CONSTRAINT [FK_VuelosxTour_Tour]
GO
ALTER TABLE [dbo].[VuelosxTour]  WITH CHECK ADD  CONSTRAINT [FK_VuelosxTour_Vuelos] FOREIGN KEY([idVuelo])
REFERENCES [dbo].[Vuelos] ([idVuelo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VuelosxTour] CHECK CONSTRAINT [FK_VuelosxTour_Vuelos]
GO
USE [master]
GO
ALTER DATABASE [BDRipioTurismo] SET  READ_WRITE 
GO
