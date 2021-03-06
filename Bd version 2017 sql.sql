USE [master]
GO
/****** Object:  Database [ventas]    Script Date: 19/04/2020 8:01:21 ******/
CREATE DATABASE [ventas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ventas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ventas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ventas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ventas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ventas] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ventas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ventas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ventas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ventas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ventas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ventas] SET ARITHABORT OFF 
GO
ALTER DATABASE [ventas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ventas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ventas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ventas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ventas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ventas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ventas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ventas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ventas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ventas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ventas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ventas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ventas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ventas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ventas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ventas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ventas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ventas] SET RECOVERY FULL 
GO
ALTER DATABASE [ventas] SET  MULTI_USER 
GO
ALTER DATABASE [ventas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ventas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ventas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ventas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ventas] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ventas', N'ON'
GO
ALTER DATABASE [ventas] SET QUERY_STORE = OFF
GO
USE [ventas]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[idCategoria] [nvarchar](5) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__categori__8A3D240C1538A73E] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idCliente] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apPaterno] [varchar](30) NOT NULL,
	[apMaterno] [varchar](30) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[telefono] [varchar](30) NOT NULL,
	[dni] [numeric](8, 0) NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalleVenta]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleVenta](
	[idDetalle] [int] IDENTITY(1,1) NOT NULL,
	[numFactura] [numeric](18, 0) NOT NULL,
	[idVenta] [numeric](18, 0) NOT NULL,
	[subTotal] [real] NOT NULL,
	[idProducto] [nvarchar](5) NOT NULL,
	[descuento] [money] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_detalleVenta] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC,
	[numFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[numFactura] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[IVA] [real] NOT NULL,
	[total] [real] NOT NULL,
	[numPago] [int] NOT NULL,
	[descuento] [money] NULL,
 CONSTRAINT [PK__factura__C989668BFDF3359B] PRIMARY KEY CLUSTERED 
(
	[numFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modoPago]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modoPago](
	[numPago] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](25) NOT NULL,
	[otroDetalles] [nvarchar](50) NULL,
 CONSTRAINT [PK__modoPago__56E7C501338E87C8] PRIMARY KEY CLUSTERED 
(
	[numPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modulo]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulo](
	[Id_modulo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operaciones]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operaciones](
	[id_operaciones] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[id_modulo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_operaciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[idProducto] [nvarchar](5) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[precioUnitario] [money] NOT NULL,
	[idCategoria] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK__producto__07F4A132F0C57D04] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol_operaciones]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol_operaciones](
	[id_rol_operaciones] [int] IDENTITY(1,1) NOT NULL,
	[id_rol] [int] NULL,
	[id_operacion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rol_operaciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](200) NULL,
	[fecha] [nvarchar](20) NULL,
	[id_rol] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendedor]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendedor](
	[idVendedor] [nvarchar](5) NOT NULL,
	[nombre] [nvarchar](30) NOT NULL,
	[apPaterno] [nvarchar](30) NOT NULL,
	[apMaterno] [nvarchar](30) NOT NULL,
	[dni] [nvarchar](8) NOT NULL,
	[telefono] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__vendedor__A6693F936F5918BB] PRIMARY KEY CLUSTERED 
(
	[idVendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[idVenta] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[total] [real] NOT NULL,
	[idCliente] [numeric](18, 0) NOT NULL,
	[idVendedor] [nvarchar](5) NOT NULL,
	[fecha] [date] NOT NULL,
	[IVA] [money] NOT NULL,
 CONSTRAINT [PK__pedido__A9F619B72DC663B9] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[categoria] ([idCategoria], [nombre], [descripcion]) VALUES (N'1', N'Dispositivos', N'Ninguna')
GO
INSERT [dbo].[categoria] ([idCategoria], [nombre], [descripcion]) VALUES (N'2', N'Desarrolo Web', N'Programas creados para sitios web')
GO
INSERT [dbo].[categoria] ([idCategoria], [nombre], [descripcion]) VALUES (N'3', N'Desarrollo de Sotware', N'Programas creados para multiplataformas')
GO
INSERT [dbo].[categoria] ([idCategoria], [nombre], [descripcion]) VALUES (N'4', N'Anlista de Sistema', N'Analiza sistemas multiplaformas')
GO
INSERT [dbo].[categoria] ([idCategoria], [nombre], [descripcion]) VALUES (N'5', N'Analista de BD', N'Analiza BD')
GO
INSERT [dbo].[categoria] ([idCategoria], [nombre], [descripcion]) VALUES (N'6', N'Diseño', N'Diseño')
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 
GO
INSERT [dbo].[cliente] ([idCliente], [nombre], [apPaterno], [apMaterno], [direccion], [telefono], [dni]) VALUES (CAST(1 AS Numeric(18, 0)), N'Oscar', N'Castro', N'Zapata', N'Managua', N'88888888', CAST(1 AS Numeric(8, 0)))
GO
INSERT [dbo].[cliente] ([idCliente], [nombre], [apPaterno], [apMaterno], [direccion], [telefono], [dni]) VALUES (CAST(2 AS Numeric(18, 0)), N'Lucho', N'Gomez', N'Perez', N'Managua', N'48579656', CAST(3 AS Numeric(8, 0)))
GO
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[detalleVenta] ON 
GO
INSERT [dbo].[detalleVenta] ([idDetalle], [numFactura], [idVenta], [subTotal], [idProducto], [descuento], [cantidad]) VALUES (2, CAST(2 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), 100, N'1', 0.0000, 1)
GO
INSERT [dbo].[detalleVenta] ([idDetalle], [numFactura], [idVenta], [subTotal], [idProducto], [descuento], [cantidad]) VALUES (3, CAST(2 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), 90, N'1', 10.0000, 1)
GO
INSERT [dbo].[detalleVenta] ([idDetalle], [numFactura], [idVenta], [subTotal], [idProducto], [descuento], [cantidad]) VALUES (4, CAST(3 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), 180, N'1', 20.0000, 2)
GO
INSERT [dbo].[detalleVenta] ([idDetalle], [numFactura], [idVenta], [subTotal], [idProducto], [descuento], [cantidad]) VALUES (5, CAST(4 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), 180, N'1', 20.0000, 2)
GO
INSERT [dbo].[detalleVenta] ([idDetalle], [numFactura], [idVenta], [subTotal], [idProducto], [descuento], [cantidad]) VALUES (6, CAST(4 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), 270, N'1', 30.0000, 3)
GO
INSERT [dbo].[detalleVenta] ([idDetalle], [numFactura], [idVenta], [subTotal], [idProducto], [descuento], [cantidad]) VALUES (7, CAST(5 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), 230, N'1', 10.0000, 2)
GO
INSERT [dbo].[detalleVenta] ([idDetalle], [numFactura], [idVenta], [subTotal], [idProducto], [descuento], [cantidad]) VALUES (8, CAST(7 AS Numeric(18, 0)), CAST(12 AS Numeric(18, 0)), 120, N'1', 0.0000, 1)
GO
SET IDENTITY_INSERT [dbo].[detalleVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[factura] ON 
GO
INSERT [dbo].[factura] ([numFactura], [fecha], [IVA], [total], [numPago], [descuento]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(N'2020-04-01' AS Date), 18, 190, 1, NULL)
GO
INSERT [dbo].[factura] ([numFactura], [fecha], [IVA], [total], [numPago], [descuento]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(N'2020-04-01' AS Date), 18, 180, 1, NULL)
GO
INSERT [dbo].[factura] ([numFactura], [fecha], [IVA], [total], [numPago], [descuento]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(N'2020-04-01' AS Date), 18, 450, 1, NULL)
GO
INSERT [dbo].[factura] ([numFactura], [fecha], [IVA], [total], [numPago], [descuento]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(N'2020-04-01' AS Date), 18, 230, 2, NULL)
GO
INSERT [dbo].[factura] ([numFactura], [fecha], [IVA], [total], [numPago], [descuento]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(N'2020-04-19' AS Date), 18, 0, 1, NULL)
GO
INSERT [dbo].[factura] ([numFactura], [fecha], [IVA], [total], [numPago], [descuento]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(N'2020-04-19' AS Date), 18, 120, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[factura] OFF
GO
SET IDENTITY_INSERT [dbo].[modoPago] ON 
GO
INSERT [dbo].[modoPago] ([numPago], [nombre], [otroDetalles]) VALUES (1, N'Tarjeta', N'Tarjeta')
GO
INSERT [dbo].[modoPago] ([numPago], [nombre], [otroDetalles]) VALUES (2, N'Credito', N'Credito')
GO
SET IDENTITY_INSERT [dbo].[modoPago] OFF
GO
SET IDENTITY_INSERT [dbo].[modulo] ON 
GO
INSERT [dbo].[modulo] ([Id_modulo], [nombre]) VALUES (1, N'central')
GO
SET IDENTITY_INSERT [dbo].[modulo] OFF
GO
SET IDENTITY_INSERT [dbo].[operaciones] ON 
GO
INSERT [dbo].[operaciones] ([id_operaciones], [nombre], [id_modulo]) VALUES (1, N'venta', 1)
GO
SET IDENTITY_INSERT [dbo].[operaciones] OFF
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'1', N'Teclado', 120.0000, N'1')
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'10', N'Teclado', 35.0000, N'1')
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'11', N'Analisis BD', 290.0000, N'5')
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'12', N'Analisis BD', 400.0000, N'5')
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'13', N'Aanalisis BD', 500.0000, N'5')
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'2', N'Sistema venta', 500.0000, N'3')
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'3', N'Sistema Web', 400.0000, N'2')
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'4', N'Diseño', 200.0000, N'6')
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'5', N'Diseño', 180.0000, N'6')
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'6', N'Analisis Sistema', 500.0000, N'4')
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'7', N'Aplicacion Web', 570.0000, N'2')
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'8', N'Mause', 20.0000, N'1')
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'9', N'Tablet', 190.0000, N'1')
GO
SET IDENTITY_INSERT [dbo].[rol] ON 
GO
INSERT [dbo].[rol] ([id_rol], [nombre]) VALUES (1, N'administrador')
GO
INSERT [dbo].[rol] ([id_rol], [nombre]) VALUES (2, N'ventas')
GO
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
SET IDENTITY_INSERT [dbo].[rol_operaciones] ON 
GO
INSERT [dbo].[rol_operaciones] ([id_rol_operaciones], [id_rol], [id_operacion]) VALUES (1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[rol_operaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 
GO
INSERT [dbo].[usuario] ([id_usuario], [nombre], [email], [password], [fecha], [id_rol]) VALUES (1, N'admin', N'admin@gmail.com', N'admin123', N'09/02/20', 1)
GO
INSERT [dbo].[usuario] ([id_usuario], [nombre], [email], [password], [fecha], [id_rol]) VALUES (2, N'ventas', N'ventas@gmail.com', N'ventas123', N'09/02/20', 2)
GO
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
INSERT [dbo].[vendedor] ([idVendedor], [nombre], [apPaterno], [apMaterno], [dni], [telefono]) VALUES (N'1', N'Ana', N'Sanchez', N'Perez', N'00000001', N'87966415')
GO
INSERT [dbo].[vendedor] ([idVendedor], [nombre], [apPaterno], [apMaterno], [dni], [telefono]) VALUES (N'3', N'Cristhel', N'Castro', N'Davila', N'888-221', N'8523697')
GO
SET IDENTITY_INSERT [dbo].[venta] ON 
GO
INSERT [dbo].[venta] ([idVenta], [total], [idCliente], [idVendedor], [fecha], [IVA]) VALUES (CAST(7 AS Numeric(18, 0)), 190, CAST(1 AS Numeric(18, 0)), N'1', CAST(N'2020-04-01' AS Date), 18.0000)
GO
INSERT [dbo].[venta] ([idVenta], [total], [idCliente], [idVendedor], [fecha], [IVA]) VALUES (CAST(8 AS Numeric(18, 0)), 180, CAST(1 AS Numeric(18, 0)), N'1', CAST(N'2020-04-01' AS Date), 18.0000)
GO
INSERT [dbo].[venta] ([idVenta], [total], [idCliente], [idVendedor], [fecha], [IVA]) VALUES (CAST(9 AS Numeric(18, 0)), 450, CAST(1 AS Numeric(18, 0)), N'1', CAST(N'2020-04-01' AS Date), 18.0000)
GO
INSERT [dbo].[venta] ([idVenta], [total], [idCliente], [idVendedor], [fecha], [IVA]) VALUES (CAST(10 AS Numeric(18, 0)), 230, CAST(2 AS Numeric(18, 0)), N'1', CAST(N'2020-04-01' AS Date), 18.0000)
GO
INSERT [dbo].[venta] ([idVenta], [total], [idCliente], [idVendedor], [fecha], [IVA]) VALUES (CAST(11 AS Numeric(18, 0)), 0, CAST(2 AS Numeric(18, 0)), N'1', CAST(N'2020-04-19' AS Date), 18.0000)
GO
INSERT [dbo].[venta] ([idVenta], [total], [idCliente], [idVendedor], [fecha], [IVA]) VALUES (CAST(12 AS Numeric(18, 0)), 120, CAST(2 AS Numeric(18, 0)), N'1', CAST(N'2020-04-19' AS Date), 18.0000)
GO
SET IDENTITY_INSERT [dbo].[venta] OFF
GO
/****** Object:  Index [UQ__cliente__D87608A7A106E868]    Script Date: 19/04/2020 8:01:21 ******/
ALTER TABLE [dbo].[cliente] ADD UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[detalleVenta]  WITH CHECK ADD  CONSTRAINT [FK__detalleFa__idPed__239E4DCF] FOREIGN KEY([idVenta])
REFERENCES [dbo].[venta] ([idVenta])
GO
ALTER TABLE [dbo].[detalleVenta] CHECK CONSTRAINT [FK__detalleFa__idPed__239E4DCF]
GO
ALTER TABLE [dbo].[detalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_detalleFactura_factura] FOREIGN KEY([numFactura])
REFERENCES [dbo].[factura] ([numFactura])
GO
ALTER TABLE [dbo].[detalleVenta] CHECK CONSTRAINT [FK_detalleFactura_factura]
GO
ALTER TABLE [dbo].[detalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_detalleFactura_producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[detalleVenta] CHECK CONSTRAINT [FK_detalleFactura_producto]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_modoPago] FOREIGN KEY([numPago])
REFERENCES [dbo].[modoPago] ([numPago])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_modoPago]
GO
ALTER TABLE [dbo].[operaciones]  WITH CHECK ADD FOREIGN KEY([id_modulo])
REFERENCES [dbo].[modulo] ([Id_modulo])
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK__producto__idCate__164452B1] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK__producto__idCate__164452B1]
GO
ALTER TABLE [dbo].[rol_operaciones]  WITH CHECK ADD FOREIGN KEY([id_operacion])
REFERENCES [dbo].[operaciones] ([id_operaciones])
GO
ALTER TABLE [dbo].[rol_operaciones]  WITH CHECK ADD FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id_rol])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id_rol])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[cliente] ([idCliente])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_cliente]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_vendedor] FOREIGN KEY([idVendedor])
REFERENCES [dbo].[vendedor] ([idVendedor])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_vendedor]
GO
/****** Object:  StoredProcedure [dbo].[reporte_factura]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[reporte_factura] 
@idPedido nvarchar(5)
as
select

pd.idPedido,
pr.nombre as Descripcion, pr.precioUnitario as 'Precio Venta',
pd.cantidad as Cantidad,pd.descuento as Descuento,
(cl.nombre+' '+cl.apPaterno) as Cliente,
(ve.nombre+' '+ve.apPaterno)as Vendedor,
ca.nombre as Categoria,
mp.nombre as 'Modo Pago'

from pedido pd inner join detalleFactura df
on pd.idPedido=df.idPedido
inner join cliente cl
on cl.idCliente=pd.idCliente
inner join producto pr
on pr.idProducto=pd.idProducto
inner join categoria ca
on ca.idCategoria=pr.idCategoria
inner join vendedor ve
on ve.idVendedor=pd.idVendedor
inner join factura fa
on fa.numFactura=df.numFactura
inner join modoPago mp
on mp.numPago=fa.numPago
where pd.idPedido=@idPedido

GO
/****** Object:  StoredProcedure [dbo].[sp_lista_clientes]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_lista_clientes]
@pageIndex int=1,
@pageSize int=10,
@pageCount int=0 out
as
set @pageCount=(select count(1) from cliente)/@pageSize
select*from (select row_number()over (order by idCliente)RowId,* from cliente)cliente where idCliente between(@pageSize*(@pageIndex-1)+1)and(@pageIndex*@pageSize)

GO
/****** Object:  StoredProcedure [dbo].[sp_producto_categoria]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_producto_categoria]
@idCategoria varchar(5)
as
select*from producto p inner join categoria c
on p.idCategoria=c.idCategoria
where c.idCategoria=@idCategoria
GO
/****** Object:  StoredProcedure [dbo].[sp_reporte_venta]    Script Date: 19/04/2020 8:01:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_reporte_venta]
@idVenta numeric(18,0)
as 
select
v.idVenta,
(ve.nombre+' '+ve.apPaterno+' '+ve.apMaterno)as Trabajador,
(cl.nombre+' '+cl.apPaterno+' '+cl.apMaterno)as Cliente,
cl.direccion,cl.dni,cl.telefono,
v.fecha,v.total,v.IVA,dv.descuento,
pr.nombre,pr.precioUnitario,
dv.cantidad,dv.numFactura,dv.subTotal,
(dv.cantidad*pr.precioUnitario-dv.descuento)as total_parcial

from detalleVenta dv inner join producto pr
on dv.idProducto=pr.idProducto
inner join venta v
on dv.idVenta=v.idVenta
inner join vendedor ve
on ve.idVendedor=v.idVendedor
inner join cliente cl
on cl.idCliente=v.idCliente
where v.idVenta=@idVenta
GO
USE [master]
GO
ALTER DATABASE [ventas] SET  READ_WRITE 
GO
