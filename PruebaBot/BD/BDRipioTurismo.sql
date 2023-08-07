USE [master]
GO
/****** Object:  Database [BDRipioTurismo]    Script Date: 31/7/2023 12:07:58 ******/
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
/****** Object:  User [Ripio]    Script Date: 31/7/2023 12:07:59 ******/
CREATE USER [Ripio] FOR LOGIN [Ripio] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 31/7/2023 12:07:59 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Ripio]
GO
/****** Object:  Table [dbo].[Actividades]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[ActividadesXTour]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[Ciudades]    Script Date: 31/7/2023 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudades](
	[idCiudad] [int] IDENTITY(1,1) NOT NULL,
	[idPais] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Ciudades] PRIMARY KEY CLUSTERED 
(
	[idCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hoteles]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[HotelxTour]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[Paises]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[Reseñas]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[Tour]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[TourXCiudades]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[TourXUsuario]    Script Date: 31/7/2023 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourXUsuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTour] [int] NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_TourXUsuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[Vuelos]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[VuelosxTour]    Script Date: 31/7/2023 12:07:59 ******/
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
SET IDENTITY_INSERT [dbo].[Actividades] ON 

INSERT [dbo].[Actividades] ([idActividad], [Descripcion], [idCiudad], [Duracion]) VALUES (3, N'Welcome to the cidade maravilhosa welcome to Rio de Janeiro. Transfer to the hotel', 3, 1)
INSERT [dbo].[Actividades] ([idActividad], [Descripcion], [idCiudad], [Duracion]) VALUES (4, N'Half day city tour visiting Copacabana & Ipanema Beaches & the Sugar Loaf', 3, 2)
INSERT [dbo].[Actividades] ([idActividad], [Descripcion], [idCiudad], [Duracion]) VALUES (5, N'Half day tour to visit Corcovado & Christ the Redeemer and Tijuca Forest', 4, 3)
INSERT [dbo].[Actividades] ([idActividad], [Descripcion], [idCiudad], [Duracion]) VALUES (7, N'Arrival to Ezeiza Int Airport & check in your hotel', 2, 1)
INSERT [dbo].[Actividades] ([idActividad], [Descripcion], [idCiudad], [Duracion]) VALUES (8, N'Half day city tour & evening Dinner Tango Show', 2, 2)
INSERT [dbo].[Actividades] ([idActividad], [Descripcion], [idCiudad], [Duracion]) VALUES (9, N'Full day Estancia Day , enjoying gauchos and typical "asado crillo"', 2, 3)
SET IDENTITY_INSERT [dbo].[Actividades] OFF
GO
SET IDENTITY_INSERT [dbo].[ActividadesXTour] ON 

INSERT [dbo].[ActividadesXTour] ([id], [idTour], [idActividad], [Fecha], [Hora]) VALUES (1, 15, 3, CAST(N'1990-02-02' AS Date), CAST(N'12:21:23' AS Time))
INSERT [dbo].[ActividadesXTour] ([id], [idTour], [idActividad], [Fecha], [Hora]) VALUES (2, 15, 4, CAST(N'1990-02-03' AS Date), CAST(N'12:21:23' AS Time))
INSERT [dbo].[ActividadesXTour] ([id], [idTour], [idActividad], [Fecha], [Hora]) VALUES (3, 15, 5, CAST(N'1900-02-04' AS Date), CAST(N'12:23:23' AS Time))
INSERT [dbo].[ActividadesXTour] ([id], [idTour], [idActividad], [Fecha], [Hora]) VALUES (4, 16, 7, CAST(N'1900-02-05' AS Date), CAST(N'12:12:26' AS Time))
INSERT [dbo].[ActividadesXTour] ([id], [idTour], [idActividad], [Fecha], [Hora]) VALUES (5, 16, 8, CAST(N'1900-02-06' AS Date), CAST(N'09:53:21' AS Time))
INSERT [dbo].[ActividadesXTour] ([id], [idTour], [idActividad], [Fecha], [Hora]) VALUES (6, 16, 9, CAST(N'1900-02-06' AS Date), CAST(N'07:22:12' AS Time))
SET IDENTITY_INSERT [dbo].[ActividadesXTour] OFF
GO
SET IDENTITY_INSERT [dbo].[Ciudades] ON 

INSERT [dbo].[Ciudades] ([idCiudad], [idPais], [Nombre]) VALUES (2, 1, N'Buenos Aires')
INSERT [dbo].[Ciudades] ([idCiudad], [idPais], [Nombre]) VALUES (3, 2, N'Rio de janeiro')
INSERT [dbo].[Ciudades] ([idCiudad], [idPais], [Nombre]) VALUES (4, 1, N'iguazu Falls')
SET IDENTITY_INSERT [dbo].[Ciudades] OFF
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 

INSERT [dbo].[Paises] ([idPais], [Nombre]) VALUES (1, N'Argentina')
INSERT [dbo].[Paises] ([idPais], [Nombre]) VALUES (2, N'Brasil')
INSERT [dbo].[Paises] ([idPais], [Nombre]) VALUES (3, N'Peru')
INSERT [dbo].[Paises] ([idPais], [Nombre]) VALUES (4, N'Uruguay')
INSERT [dbo].[Paises] ([idPais], [Nombre]) VALUES (5, N'Chile')
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([idTour], [Descripcion], [Duracion]) VALUES (15, N'A perfect tour for travelers looking to visit the two capital cities and the incredible Iguazu Falls. It`s a 9-night program, but can be short if you need or add an overnight at the end. Starting in Rio de Janeiro (but also can run in reverse starting in Buenos Aires), the program includes the visit to the incredible Corcovado Mount and the Christ the Redeemer on top, considered one of the new 7 wonders of the world. You also visit the Sugar Loaf, to see imposing views of Guanabara Bay and the beaches surrounding it. Travel to the beaches, and discover Copacabana and Ipanema , learn more about the Carnival culture visiting the Sambodromo, see the Maracana Stadium, and more. Then, we will take a flight directly to Iguazu Falls, to visit this Unesco World Heritage and new 7-wonders of nature! We will go to the Brazilian and the Argentinian side. Be ready to take hundreds of photos of this unique place on earth. Finally, we will take a new flight directly to Buenos Aires, to visit this “European style” city in South America (it´s a travel in time, to the beginnings of the XX century), and enjoy the Tango, the exquisite gastronomy (take a look and taste the beef, the mate, the empanadas, and the Malbec wine!). Discover some interesting places that all our travelers like: Caminito in La Boca, San Telmo, 9 de Julio Avenue, the Obelisk, Colon Theatre, Recoleta, Palermo, Puerto Madero and more! Taste the exquisite Argentinian Beef before return back to home!

Read more about these three destinations in our Travel Guide for Buenos Aires, Iguazu Falls and Rio de Janeiro.  Book today this amazing tour and enjoy Rio de Janeiro, Iguazu Falls and Buenos Aires with RipioTurismo!', 10)
INSERT [dbo].[Tour] ([idTour], [Descripcion], [Duracion]) VALUES (16, N'A 9-night program to combine three highlights of Argentina!
Our 9-night program combines three important destinations in Argentina. Of course, Buenos Aires which is the capital city and one of the most important cities in South America and the world. Buenos Aires welcome you with great gastronomy, history, warm people and all the magic of Tango. The other two destinations are amazing and unique. First, we will fly to Iguazu, to enjoy one of the magic of nature, the incredible Iguazu Falls. They`re one of the new 7-wonders of nature and a must-see in Argentina. Finally, we will arrive to El Calafate in Patagonia, to visit the unique Perito Moreno Glacier and many other glaciers in the area of Los Glaciares National Park. If you have only 9 nights, our 151 tour is one of the suggested programs to visit Argentina.', 10)
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
SET IDENTITY_INSERT [dbo].[TourXCiudades] ON 

INSERT [dbo].[TourXCiudades] ([id], [idTour], [idCiudad]) VALUES (7, 15, 2)
INSERT [dbo].[TourXCiudades] ([id], [idTour], [idCiudad]) VALUES (11, 15, 3)
INSERT [dbo].[TourXCiudades] ([id], [idTour], [idCiudad]) VALUES (12, 15, 4)
SET IDENTITY_INSERT [dbo].[TourXCiudades] OFF
GO
SET IDENTITY_INSERT [dbo].[TourXUsuario] ON 

INSERT [dbo].[TourXUsuario] ([id], [idTour], [idUsuario]) VALUES (1, 15, 1)
INSERT [dbo].[TourXUsuario] ([id], [idTour], [idUsuario]) VALUES (2, 16, 4)
SET IDENTITY_INSERT [dbo].[TourXUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [NombreCompleto], [NumPasaporte]) VALUES (1, N'Agustin Fulco', N'ABCAD0212')
INSERT [dbo].[Usuario] ([idUsuario], [NombreCompleto], [NumPasaporte]) VALUES (4, N'Tiago Ezequiel Glusman', N'AKL012401')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Vuelos] ON 

INSERT [dbo].[Vuelos] ([idVuelo], [codigoVuelo], [aerolinea]) VALUES (1, N'AR1364', N'Aerolineas Argentinas')
INSERT [dbo].[Vuelos] ([idVuelo], [codigoVuelo], [aerolinea]) VALUES (2, N'H2 -5570', N'Sky Airline')
INSERT [dbo].[Vuelos] ([idVuelo], [codigoVuelo], [aerolinea]) VALUES (3, N'AR1478', N'Aerolineas Argentinas')
SET IDENTITY_INSERT [dbo].[Vuelos] OFF
GO
SET IDENTITY_INSERT [dbo].[VuelosxTour] ON 

INSERT [dbo].[VuelosxTour] ([id], [idTour], [idVuelo], [Fecha]) VALUES (1, 15, 1, CAST(N'1921-02-15' AS Date))
INSERT [dbo].[VuelosxTour] ([id], [idTour], [idVuelo], [Fecha]) VALUES (2, 15, 2, CAST(N'1921-04-20' AS Date))
SET IDENTITY_INSERT [dbo].[VuelosxTour] OFF
GO
ALTER TABLE [dbo].[Actividades]  WITH CHECK ADD  CONSTRAINT [FK_Actividades_Ciudades] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudades] ([idCiudad])
GO
ALTER TABLE [dbo].[Actividades] CHECK CONSTRAINT [FK_Actividades_Ciudades]
GO
ALTER TABLE [dbo].[ActividadesXTour]  WITH CHECK ADD  CONSTRAINT [FK_ActividadesXTour_Actividades1] FOREIGN KEY([idActividad])
REFERENCES [dbo].[Actividades] ([idActividad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActividadesXTour] CHECK CONSTRAINT [FK_ActividadesXTour_Actividades1]
GO
ALTER TABLE [dbo].[ActividadesXTour]  WITH CHECK ADD  CONSTRAINT [FK_ActividadesXTour_Tour1] FOREIGN KEY([idTour])
REFERENCES [dbo].[Tour] ([idTour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActividadesXTour] CHECK CONSTRAINT [FK_ActividadesXTour_Tour1]
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
ALTER TABLE [dbo].[TourXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TourXUsuario_Tour] FOREIGN KEY([idTour])
REFERENCES [dbo].[Tour] ([idTour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TourXUsuario] CHECK CONSTRAINT [FK_TourXUsuario_Tour]
GO
ALTER TABLE [dbo].[TourXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TourXUsuario_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TourXUsuario] CHECK CONSTRAINT [FK_TourXUsuario_Usuario]
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
USE [master]
GO
/****** Object:  Database [BDRipioTurismo]    Script Date: 31/7/2023 12:07:58 ******/
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
/****** Object:  User [Ripio]    Script Date: 31/7/2023 12:07:59 ******/
CREATE USER [Ripio] FOR LOGIN [Ripio] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 31/7/2023 12:07:59 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Ripio]
GO
/****** Object:  Table [dbo].[Actividades]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[ActividadesXTour]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[Ciudades]    Script Date: 31/7/2023 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudades](
	[idCiudad] [int] IDENTITY(1,1) NOT NULL,
	[idPais] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Ciudades] PRIMARY KEY CLUSTERED 
(
	[idCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hoteles]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[HotelxTour]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[Paises]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[Reseñas]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[Tour]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[TourXCiudades]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[TourXUsuario]    Script Date: 31/7/2023 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourXUsuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTour] [int] NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_TourXUsuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[Vuelos]    Script Date: 31/7/2023 12:07:59 ******/
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
/****** Object:  Table [dbo].[VuelosxTour]    Script Date: 31/7/2023 12:07:59 ******/
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
SET IDENTITY_INSERT [dbo].[Actividades] ON 

INSERT [dbo].[Actividades] ([idActividad], [Descripcion], [idCiudad], [Duracion]) VALUES (3, N'Welcome to the cidade maravilhosa welcome to Rio de Janeiro. Transfer to the hotel', 3, 1)
INSERT [dbo].[Actividades] ([idActividad], [Descripcion], [idCiudad], [Duracion]) VALUES (4, N'Half day city tour visiting Copacabana & Ipanema Beaches & the Sugar Loaf', 3, 2)
INSERT [dbo].[Actividades] ([idActividad], [Descripcion], [idCiudad], [Duracion]) VALUES (5, N'Half day tour to visit Corcovado & Christ the Redeemer and Tijuca Forest', 4, 3)
INSERT [dbo].[Actividades] ([idActividad], [Descripcion], [idCiudad], [Duracion]) VALUES (7, N'Arrival to Ezeiza Int Airport & check in your hotel', 2, 1)
INSERT [dbo].[Actividades] ([idActividad], [Descripcion], [idCiudad], [Duracion]) VALUES (8, N'Half day city tour & evening Dinner Tango Show', 2, 2)
INSERT [dbo].[Actividades] ([idActividad], [Descripcion], [idCiudad], [Duracion]) VALUES (9, N'Full day Estancia Day , enjoying gauchos and typical "asado crillo"', 2, 3)
SET IDENTITY_INSERT [dbo].[Actividades] OFF
GO
SET IDENTITY_INSERT [dbo].[ActividadesXTour] ON 

INSERT [dbo].[ActividadesXTour] ([id], [idTour], [idActividad], [Fecha], [Hora]) VALUES (1, 15, 3, CAST(N'1990-02-02' AS Date), CAST(N'12:21:23' AS Time))
INSERT [dbo].[ActividadesXTour] ([id], [idTour], [idActividad], [Fecha], [Hora]) VALUES (2, 15, 4, CAST(N'1990-02-03' AS Date), CAST(N'12:21:23' AS Time))
INSERT [dbo].[ActividadesXTour] ([id], [idTour], [idActividad], [Fecha], [Hora]) VALUES (3, 15, 5, CAST(N'1900-02-04' AS Date), CAST(N'12:23:23' AS Time))
INSERT [dbo].[ActividadesXTour] ([id], [idTour], [idActividad], [Fecha], [Hora]) VALUES (4, 16, 7, CAST(N'1900-02-05' AS Date), CAST(N'12:12:26' AS Time))
INSERT [dbo].[ActividadesXTour] ([id], [idTour], [idActividad], [Fecha], [Hora]) VALUES (5, 16, 8, CAST(N'1900-02-06' AS Date), CAST(N'09:53:21' AS Time))
INSERT [dbo].[ActividadesXTour] ([id], [idTour], [idActividad], [Fecha], [Hora]) VALUES (6, 16, 9, CAST(N'1900-02-06' AS Date), CAST(N'07:22:12' AS Time))
SET IDENTITY_INSERT [dbo].[ActividadesXTour] OFF
GO
SET IDENTITY_INSERT [dbo].[Ciudades] ON 

INSERT [dbo].[Ciudades] ([idCiudad], [idPais], [Nombre]) VALUES (2, 1, N'Buenos Aires')
INSERT [dbo].[Ciudades] ([idCiudad], [idPais], [Nombre]) VALUES (3, 2, N'Rio de janeiro')
INSERT [dbo].[Ciudades] ([idCiudad], [idPais], [Nombre]) VALUES (4, 1, N'iguazu Falls')
SET IDENTITY_INSERT [dbo].[Ciudades] OFF
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 

INSERT [dbo].[Paises] ([idPais], [Nombre]) VALUES (1, N'Argentina')
INSERT [dbo].[Paises] ([idPais], [Nombre]) VALUES (2, N'Brasil')
INSERT [dbo].[Paises] ([idPais], [Nombre]) VALUES (3, N'Peru')
INSERT [dbo].[Paises] ([idPais], [Nombre]) VALUES (4, N'Uruguay')
INSERT [dbo].[Paises] ([idPais], [Nombre]) VALUES (5, N'Chile')
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([idTour], [Descripcion], [Duracion]) VALUES (15, N'A perfect tour for travelers looking to visit the two capital cities and the incredible Iguazu Falls. It`s a 9-night program, but can be short if you need or add an overnight at the end. Starting in Rio de Janeiro (but also can run in reverse starting in Buenos Aires), the program includes the visit to the incredible Corcovado Mount and the Christ the Redeemer on top, considered one of the new 7 wonders of the world. You also visit the Sugar Loaf, to see imposing views of Guanabara Bay and the beaches surrounding it. Travel to the beaches, and discover Copacabana and Ipanema , learn more about the Carnival culture visiting the Sambodromo, see the Maracana Stadium, and more. Then, we will take a flight directly to Iguazu Falls, to visit this Unesco World Heritage and new 7-wonders of nature! We will go to the Brazilian and the Argentinian side. Be ready to take hundreds of photos of this unique place on earth. Finally, we will take a new flight directly to Buenos Aires, to visit this “European style” city in South America (it´s a travel in time, to the beginnings of the XX century), and enjoy the Tango, the exquisite gastronomy (take a look and taste the beef, the mate, the empanadas, and the Malbec wine!). Discover some interesting places that all our travelers like: Caminito in La Boca, San Telmo, 9 de Julio Avenue, the Obelisk, Colon Theatre, Recoleta, Palermo, Puerto Madero and more! Taste the exquisite Argentinian Beef before return back to home!

Read more about these three destinations in our Travel Guide for Buenos Aires, Iguazu Falls and Rio de Janeiro.  Book today this amazing tour and enjoy Rio de Janeiro, Iguazu Falls and Buenos Aires with RipioTurismo!', 10)
INSERT [dbo].[Tour] ([idTour], [Descripcion], [Duracion]) VALUES (16, N'A 9-night program to combine three highlights of Argentina!
Our 9-night program combines three important destinations in Argentina. Of course, Buenos Aires which is the capital city and one of the most important cities in South America and the world. Buenos Aires welcome you with great gastronomy, history, warm people and all the magic of Tango. The other two destinations are amazing and unique. First, we will fly to Iguazu, to enjoy one of the magic of nature, the incredible Iguazu Falls. They`re one of the new 7-wonders of nature and a must-see in Argentina. Finally, we will arrive to El Calafate in Patagonia, to visit the unique Perito Moreno Glacier and many other glaciers in the area of Los Glaciares National Park. If you have only 9 nights, our 151 tour is one of the suggested programs to visit Argentina.', 10)
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
SET IDENTITY_INSERT [dbo].[TourXCiudades] ON 

INSERT [dbo].[TourXCiudades] ([id], [idTour], [idCiudad]) VALUES (7, 15, 2)
INSERT [dbo].[TourXCiudades] ([id], [idTour], [idCiudad]) VALUES (11, 15, 3)
INSERT [dbo].[TourXCiudades] ([id], [idTour], [idCiudad]) VALUES (12, 15, 4)
SET IDENTITY_INSERT [dbo].[TourXCiudades] OFF
GO
SET IDENTITY_INSERT [dbo].[TourXUsuario] ON 

INSERT [dbo].[TourXUsuario] ([id], [idTour], [idUsuario]) VALUES (1, 15, 1)
INSERT [dbo].[TourXUsuario] ([id], [idTour], [idUsuario]) VALUES (2, 16, 4)
SET IDENTITY_INSERT [dbo].[TourXUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [NombreCompleto], [NumPasaporte]) VALUES (1, N'Agustin Fulco', N'ABCAD0212')
INSERT [dbo].[Usuario] ([idUsuario], [NombreCompleto], [NumPasaporte]) VALUES (4, N'Tiago Ezequiel Glusman', N'AKL012401')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Vuelos] ON 

INSERT [dbo].[Vuelos] ([idVuelo], [codigoVuelo], [aerolinea]) VALUES (1, N'AR1364', N'Aerolineas Argentinas')
INSERT [dbo].[Vuelos] ([idVuelo], [codigoVuelo], [aerolinea]) VALUES (2, N'H2 -5570', N'Sky Airline')
INSERT [dbo].[Vuelos] ([idVuelo], [codigoVuelo], [aerolinea]) VALUES (3, N'AR1478', N'Aerolineas Argentinas')
SET IDENTITY_INSERT [dbo].[Vuelos] OFF
GO
SET IDENTITY_INSERT [dbo].[VuelosxTour] ON 

INSERT [dbo].[VuelosxTour] ([id], [idTour], [idVuelo], [Fecha]) VALUES (1, 15, 1, CAST(N'1921-02-15' AS Date))
INSERT [dbo].[VuelosxTour] ([id], [idTour], [idVuelo], [Fecha]) VALUES (2, 15, 2, CAST(N'1921-04-20' AS Date))
SET IDENTITY_INSERT [dbo].[VuelosxTour] OFF
GO
ALTER TABLE [dbo].[Actividades]  WITH CHECK ADD  CONSTRAINT [FK_Actividades_Ciudades] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudades] ([idCiudad])
GO
ALTER TABLE [dbo].[Actividades] CHECK CONSTRAINT [FK_Actividades_Ciudades]
GO
ALTER TABLE [dbo].[ActividadesXTour]  WITH CHECK ADD  CONSTRAINT [FK_ActividadesXTour_Actividades1] FOREIGN KEY([idActividad])
REFERENCES [dbo].[Actividades] ([idActividad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActividadesXTour] CHECK CONSTRAINT [FK_ActividadesXTour_Actividades1]
GO
ALTER TABLE [dbo].[ActividadesXTour]  WITH CHECK ADD  CONSTRAINT [FK_ActividadesXTour_Tour1] FOREIGN KEY([idTour])
REFERENCES [dbo].[Tour] ([idTour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActividadesXTour] CHECK CONSTRAINT [FK_ActividadesXTour_Tour1]
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
ALTER TABLE [dbo].[TourXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TourXUsuario_Tour] FOREIGN KEY([idTour])
REFERENCES [dbo].[Tour] ([idTour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TourXUsuario] CHECK CONSTRAINT [FK_TourXUsuario_Tour]
GO
ALTER TABLE [dbo].[TourXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TourXUsuario_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TourXUsuario] CHECK CONSTRAINT [FK_TourXUsuario_Usuario]
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
