USE [dbventas]
GO
/****** Object:  StoredProcedure [dbo].[insertar_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[insertar_venta]
GO
/****** Object:  StoredProcedure [dbo].[insertar_producto]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[insertar_producto]
GO
/****** Object:  StoredProcedure [dbo].[insertar_detalle_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[insertar_detalle_venta]
GO
/****** Object:  StoredProcedure [dbo].[insertar_cliente]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[insertar_cliente]
GO
/****** Object:  StoredProcedure [dbo].[insertar_categoria]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[insertar_categoria]
GO
/****** Object:  StoredProcedure [dbo].[eliminar_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[eliminar_venta]
GO
/****** Object:  StoredProcedure [dbo].[eliminar_producto]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[eliminar_producto]
GO
/****** Object:  StoredProcedure [dbo].[eliminar_detalle_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[eliminar_detalle_venta]
GO
/****** Object:  StoredProcedure [dbo].[eliminar_cliente]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[eliminar_cliente]
GO
/****** Object:  StoredProcedure [dbo].[eliminar_categoria]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[eliminar_categoria]
GO
/****** Object:  StoredProcedure [dbo].[editar_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[editar_venta]
GO
/****** Object:  StoredProcedure [dbo].[editar_producto]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[editar_producto]
GO
/****** Object:  StoredProcedure [dbo].[editar_detalle_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[editar_detalle_venta]
GO
/****** Object:  StoredProcedure [dbo].[editar_cliente]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[editar_cliente]
GO
/****** Object:  StoredProcedure [dbo].[editar_categoria]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[editar_categoria]
GO
/****** Object:  StoredProcedure [dbo].[disminuir_stock]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[disminuir_stock]
GO
/****** Object:  StoredProcedure [dbo].[consultar_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[consultar_venta]
GO
/****** Object:  StoredProcedure [dbo].[consultar_producto]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[consultar_producto]
GO
/****** Object:  StoredProcedure [dbo].[consultar_detalle_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[consultar_detalle_venta]
GO
/****** Object:  StoredProcedure [dbo].[consultar_cliente]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[consultar_cliente]
GO
/****** Object:  StoredProcedure [dbo].[consultar_categoria]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[consultar_categoria]
GO
/****** Object:  StoredProcedure [dbo].[aumentar_stock]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP PROCEDURE [dbo].[aumentar_stock]
GO
ALTER TABLE [dbo].[venta] DROP CONSTRAINT [FK_venta_cliente]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_categoria]
GO
ALTER TABLE [dbo].[detalle_venta] DROP CONSTRAINT [FK_detalle_venta_venta]
GO
ALTER TABLE [dbo].[detalle_venta] DROP CONSTRAINT [FK_detalle_venta_Producto]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP TABLE [dbo].[venta]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP TABLE [dbo].[Producto]
GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP TABLE [dbo].[detalle_venta]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP TABLE [dbo].[cliente]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 26/04/2023 8:01:18 a. m. ******/
DROP TABLE [dbo].[categoria]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre_categoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cliente]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[direccion] [varchar](150) NOT NULL,
	[telefono] [varchar](40) NOT NULL,
	[numdocumento] [varchar](40) NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_venta](
	[iddetalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NOT NULL,
	[idproducto] [int] NOT NULL,
	[cantidad] [decimal](18, 2) NOT NULL,
	[precio_unitario] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_detalle_venta] PRIMARY KEY CLUSTERED 
(
	[iddetalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idproducto] [int] IDENTITY(1,1) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](255) NOT NULL,
	[stock] [decimal](18, 2) NOT NULL,
	[precio_compra] [decimal](18, 2) NOT NULL,
	[precio_venta] [decimal](18, 2) NOT NULL,
	[fecha_vencimiento] [date] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[fecha_venta] [date] NOT NULL,
	[tipo_documento] [varchar](50) NOT NULL,
	[num_documento] [varchar](50) NOT NULL,
 CONSTRAINT [PK_venta] PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[categoria] ON 

INSERT [dbo].[categoria] ([idcategoria], [nombre_categoria]) VALUES (7, N'Camisetas')
INSERT [dbo].[categoria] ([idcategoria], [nombre_categoria]) VALUES (8, N'Collares')
INSERT [dbo].[categoria] ([idcategoria], [nombre_categoria]) VALUES (9, N'Dulses de paquete')
INSERT [dbo].[categoria] ([idcategoria], [nombre_categoria]) VALUES (10, N'Carros de coleccion')
INSERT [dbo].[categoria] ([idcategoria], [nombre_categoria]) VALUES (11, N'Zapatos ')
INSERT [dbo].[categoria] ([idcategoria], [nombre_categoria]) VALUES (12, N'Reloj')
INSERT [dbo].[categoria] ([idcategoria], [nombre_categoria]) VALUES (13, N'Gorras')
INSERT [dbo].[categoria] ([idcategoria], [nombre_categoria]) VALUES (14, N'Anteojos')
INSERT [dbo].[categoria] ([idcategoria], [nombre_categoria]) VALUES (15, N'Muñeco coleccionable')
INSERT [dbo].[categoria] ([idcategoria], [nombre_categoria]) VALUES (16, N'Figura gigante')
INSERT [dbo].[categoria] ([idcategoria], [nombre_categoria]) VALUES (17, N'Goma acidas')
INSERT [dbo].[categoria] ([idcategoria], [nombre_categoria]) VALUES (18, N'Juego de sabana')
SET IDENTITY_INSERT [dbo].[categoria] OFF
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([idcliente], [nombre], [apellidos], [direccion], [telefono], [numdocumento]) VALUES (5, N'Oscar Javier', N'Gonzalez Castiblanco', N'Calle 14 # 5c-45 Bogota', N'3120239039', N'9540304')
INSERT [dbo].[cliente] ([idcliente], [nombre], [apellidos], [direccion], [telefono], [numdocumento]) VALUES (6, N'Laura Yanet', N'Dias Mendoza', N'Avenida caracas 54-34 Bogota', N'3126547756', N'1053746776')
INSERT [dbo].[cliente] ([idcliente], [nombre], [apellidos], [direccion], [telefono], [numdocumento]) VALUES (7, N'Elsa Maria', N'Lopez Diaz', N'165 #32-65 Bogota', N'3102998383', N'23534654')
INSERT [dbo].[cliente] ([idcliente], [nombre], [apellidos], [direccion], [telefono], [numdocumento]) VALUES (8, N'Mariano ', N'Meneses Castillo', N'calle 44 #-45-54 Tunja', N'3162562267', N'7211435')
INSERT [dbo].[cliente] ([idcliente], [nombre], [apellidos], [direccion], [telefono], [numdocumento]) VALUES (9, N'Sonia Patricia', N'Hernandez Gonzalez', N'carrera 34 #45-22 Sogamoso', N'3115436509', N'106545452')
INSERT [dbo].[cliente] ([idcliente], [nombre], [apellidos], [direccion], [telefono], [numdocumento]) VALUES (10, N'Julian Andres', N'Torres Puerto', N'calle 67#12-75 apto 504 Bogota', N'3123893321', N'2342737842')
INSERT [dbo].[cliente] ([idcliente], [nombre], [apellidos], [direccion], [telefono], [numdocumento]) VALUES (12, N'Jeimy Andrea', N'Portillos Mora', N'av caracas 54-43 Bogota', N'3127362238', N'73276423')
INSERT [dbo].[cliente] ([idcliente], [nombre], [apellidos], [direccion], [telefono], [numdocumento]) VALUES (13, N'Sebastian', N'Reyes Soto', N'Calle 176#22-57 Bogota', N'3102233405', N'9537464')
SET IDENTITY_INSERT [dbo].[cliente] OFF
SET IDENTITY_INSERT [dbo].[detalle_venta] ON 

INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idproducto], [cantidad], [precio_unitario]) VALUES (3, 6, 5, CAST(3.00 AS Decimal(18, 2)), CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idproducto], [cantidad], [precio_unitario]) VALUES (4, 6, 4, CAST(2.00 AS Decimal(18, 2)), CAST(650000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idproducto], [cantidad], [precio_unitario]) VALUES (5, 6, 6, CAST(3.00 AS Decimal(18, 2)), CAST(10500.00 AS Decimal(18, 2)))
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idproducto], [cantidad], [precio_unitario]) VALUES (6, 7, 7, CAST(2.00 AS Decimal(18, 2)), CAST(76000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idproducto], [cantidad], [precio_unitario]) VALUES (7, 7, 8, CAST(1.00 AS Decimal(18, 2)), CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idproducto], [cantidad], [precio_unitario]) VALUES (8, 7, 4, CAST(5.00 AS Decimal(18, 2)), CAST(650000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idproducto], [cantidad], [precio_unitario]) VALUES (9, 8, 6, CAST(11.00 AS Decimal(18, 2)), CAST(10500.00 AS Decimal(18, 2)))
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idproducto], [cantidad], [precio_unitario]) VALUES (13, 9, 7, CAST(3.00 AS Decimal(18, 2)), CAST(76000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idproducto], [cantidad], [precio_unitario]) VALUES (14, 9, 5, CAST(2.00 AS Decimal(18, 2)), CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idproducto], [cantidad], [precio_unitario]) VALUES (15, 9, 4, CAST(1.00 AS Decimal(18, 2)), CAST(650000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idproducto], [cantidad], [precio_unitario]) VALUES (16, 9, 6, CAST(11.00 AS Decimal(18, 2)), CAST(10500.00 AS Decimal(18, 2)))
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idproducto], [cantidad], [precio_unitario]) VALUES (17, 9, 5, CAST(2.00 AS Decimal(18, 2)), CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idproducto], [cantidad], [precio_unitario]) VALUES (18, 9, 5, CAST(1.00 AS Decimal(18, 2)), CAST(70000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[detalle_venta] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([idproducto], [idcategoria], [nombre], [descripcion], [stock], [precio_compra], [precio_venta], [fecha_vencimiento]) VALUES (4, 16, N'Batman tamaño gigante', N'Figura tamaño gigante, con caja y accesorios intercambiables', CAST(26.00 AS Decimal(18, 2)), CAST(400000.00 AS Decimal(18, 2)), CAST(650000.00 AS Decimal(18, 2)), CAST(N'2023-04-26' AS Date))
INSERT [dbo].[Producto] ([idproducto], [idcategoria], [nombre], [descripcion], [stock], [precio_compra], [precio_venta], [fecha_vencimiento]) VALUES (5, 7, N'Harley queen', N'Camiseta tallas M y L', CAST(2.00 AS Decimal(18, 2)), CAST(35000.00 AS Decimal(18, 2)), CAST(70000.00 AS Decimal(18, 2)), CAST(N'2023-04-04' AS Date))
INSERT [dbo].[Producto] ([idproducto], [idcategoria], [nombre], [descripcion], [stock], [precio_compra], [precio_venta], [fecha_vencimiento]) VALUES (6, 9, N'gomas acidas Kiko', N'Gomas acidas 24 unidades con stickers', CAST(55.00 AS Decimal(18, 2)), CAST(5400.00 AS Decimal(18, 2)), CAST(10500.00 AS Decimal(18, 2)), CAST(N'2023-02-08' AS Date))
INSERT [dbo].[Producto] ([idproducto], [idcategoria], [nombre], [descripcion], [stock], [precio_compra], [precio_venta], [fecha_vencimiento]) VALUES (7, 7, N'Superman Hombre de acero', N'Camiseta con figura de superman tallas xl, m, y s', CAST(55.00 AS Decimal(18, 2)), CAST(40500.00 AS Decimal(18, 2)), CAST(76000.00 AS Decimal(18, 2)), CAST(N'2023-04-11' AS Date))
INSERT [dbo].[Producto] ([idproducto], [idcategoria], [nombre], [descripcion], [stock], [precio_compra], [precio_venta], [fecha_vencimiento]) VALUES (8, 13, N'Mario bros', N' Gorra color rojo con letra de m en la parte frontal y tamaño pequeño', CAST(9.00 AS Decimal(18, 2)), CAST(23000.00 AS Decimal(18, 2)), CAST(35000.00 AS Decimal(18, 2)), CAST(N'2023-04-16' AS Date))
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[venta] ON 

INSERT [dbo].[venta] ([idventa], [idcliente], [fecha_venta], [tipo_documento], [num_documento]) VALUES (6, 8, CAST(N'2023-04-26' AS Date), N'Factura digital', N'36364343489')
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha_venta], [tipo_documento], [num_documento]) VALUES (7, 9, CAST(N'2023-04-26' AS Date), N'Factura digital', N'77700049')
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha_venta], [tipo_documento], [num_documento]) VALUES (8, 6, CAST(N'2023-04-26' AS Date), N'Factura fisica', N'73474888')
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha_venta], [tipo_documento], [num_documento]) VALUES (9, 13, CAST(N'2023-04-26' AS Date), N'Factura fisica', N'27364270000')
SET IDENTITY_INSERT [dbo].[venta] OFF
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD  CONSTRAINT [FK_detalle_venta_Producto] FOREIGN KEY([idproducto])
REFERENCES [dbo].[Producto] ([idproducto])
GO
ALTER TABLE [dbo].[detalle_venta] CHECK CONSTRAINT [FK_detalle_venta_Producto]
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD  CONSTRAINT [FK_detalle_venta_venta] FOREIGN KEY([idventa])
REFERENCES [dbo].[venta] ([idventa])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detalle_venta] CHECK CONSTRAINT [FK_detalle_venta_venta]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_categoria] FOREIGN KEY([idcategoria])
REFERENCES [dbo].[categoria] ([idcategoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_categoria]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_cliente] FOREIGN KEY([idcliente])
REFERENCES [dbo].[cliente] ([idcliente])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_cliente]
GO
/****** Object:  StoredProcedure [dbo].[aumentar_stock]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[aumentar_stock]
@idproducto as integer,
@cantidad as decimal (18,2)

as 
update producto set stock=stock+@cantidad where idproducto =@idproducto

GO
/****** Object:  StoredProcedure [dbo].[consultar_categoria]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[consultar_categoria]

as 
select * from categoria order by idcategoria desc

GO
/****** Object:  StoredProcedure [dbo].[consultar_cliente]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[consultar_cliente]
as 
select * from cliente order by idcliente desc

GO
/****** Object:  StoredProcedure [dbo].[consultar_detalle_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[consultar_detalle_venta]
as 
SELECT        dbo.detalle_venta.iddetalle_venta, dbo.detalle_venta.idventa, dbo.detalle_venta.idproducto, dbo.Producto.nombre, dbo.detalle_venta.cantidad, dbo.detalle_venta.precio_unitario
FROM            dbo.detalle_venta INNER JOIN
                         dbo.Producto ON dbo.detalle_venta.idproducto = dbo.Producto.idproducto order by iddetalle_venta desc

GO
/****** Object:  StoredProcedure [dbo].[consultar_producto]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[consultar_producto]
as 
select Producto.idproducto,Producto.idcategoria, categoria.nombre_categoria,
Producto.nombre, Producto.descripcion , Producto.stock , producto.precio_compra, Producto.precio_venta, Producto.fecha_vencimiento    
from producto inner join categoria on Producto.idcategoria =categoria.idcategoria 
order by Producto.idproducto   desc

GO
/****** Object:  StoredProcedure [dbo].[consultar_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[consultar_venta]
as 
SELECT        dbo.venta.idventa, dbo.venta.idcliente, dbo.cliente.apellidos, dbo.cliente.numdocumento, dbo.venta.fecha_venta, dbo.venta.tipo_documento, dbo.venta.num_documento
FROM            dbo.cliente INNER JOIN
                         dbo.venta ON dbo.cliente.idcliente = dbo.venta.idcliente
						 order by dbo.venta.idventa  desc
GO
/****** Object:  StoredProcedure [dbo].[disminuir_stock]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[disminuir_stock]
@idproducto as integer,
@cantidad as decimal (18,2)

as 
update producto set stock=stock-@cantidad where idproducto =@idproducto

GO
/****** Object:  StoredProcedure [dbo].[editar_categoria]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[editar_categoria]
@idcategoria integer,
@nombre_categoria varchar(50)

as 
update categoria set nombre_categoria =@nombre_categoria 
where idcategoria =@idcategoria

GO
/****** Object:  StoredProcedure [dbo].[editar_cliente]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_cliente]
@idcliente integer,
@nombres varchar(50),
@apellidos varchar(50),
@direccion varchar(150) ,
@telefono varchar (40),
@numdocumento varchar(40) 
as 

update cliente set nombre=@nombres, 
apellidos=@apellidos,
direccion=@direccion,
telefono=@telefono, 
numdocumento=@numdocumento
where idcliente=@idcliente

GO
/****** Object:  StoredProcedure [dbo].[editar_detalle_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_detalle_venta]
@iddetalle_venta as integer ,
@idventa as integer ,
@idproducto as integer ,
@cantidad as decimal (18,2),
@precio_unitario as decimal (18,2)
as
update detalle_venta set idventa=@idventa,
idproducto=@idproducto,
cantidad=@cantidad,
precio_unitario=@precio_unitario
where iddetalle_venta  =@iddetalle_venta 

GO
/****** Object:  StoredProcedure [dbo].[editar_producto]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_producto]
@idproducto integer ,
@idcategoria integer ,
@nombre varchar(50),
@descripcion varchar(255),
@stock  decimal(18, 2) ,
@precio_compra decimal(18, 2) ,
@precio_venta decimal(18, 2) ,
@fecha_vencimiento date 

as 
update producto set idcategoria  =@idcategoria , nombre =@nombre , descripcion =@descripcion ,
stock =@stock ,precio_compra =@precio_compra , precio_venta=@precio_venta , fecha_vencimiento=@fecha_vencimiento   
where idproducto  =@idproducto 

GO
/****** Object:  StoredProcedure [dbo].[editar_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_venta]
@idventa as integer ,
@idcliente as integer ,
@fecha_venta as date,
@tipo_documento as varchar(50),
@num_documento as varchar(50)

as 
update venta set idcliente  =@idcliente , fecha_venta =@fecha_venta , tipo_documento =@tipo_documento ,
num_documento =@num_documento    
where idventa  =@idventa 

GO
/****** Object:  StoredProcedure [dbo].[eliminar_categoria]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_categoria]
@idcategoria integer

as 
delete from categoria where idcategoria =@idcategoria

GO
/****** Object:  StoredProcedure [dbo].[eliminar_cliente]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_cliente]
@idcliente integer

as 

delete from cliente 
where idcliente=@idcliente

GO
/****** Object:  StoredProcedure [dbo].[eliminar_detalle_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_detalle_venta]
@iddetalle_venta as integer 
 as
delete from detalle_venta where iddetalle_venta = @iddetalle_venta 

GO
/****** Object:  StoredProcedure [dbo].[eliminar_producto]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[eliminar_producto]
@idproducto integer

as 
delete from Producto where idproducto =@idproducto

GO
/****** Object:  StoredProcedure [dbo].[eliminar_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[eliminar_venta]
@idventa as integer 
 as
delete from venta where idventa = @idventa 

GO
/****** Object:  StoredProcedure [dbo].[insertar_categoria]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_categoria]
@nombre_categoria varchar(50)

as 
insert into categoria (nombre_categoria ) values (@nombre_categoria)

GO
/****** Object:  StoredProcedure [dbo].[insertar_cliente]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_cliente]
@nombres varchar(50),
@apellidos varchar(50),
@direccion varchar(150) ,
@telefono varchar (40),
@numdocumento varchar(40) 
as 

insert into cliente(nombre, apellidos, direccion, telefono, numdocumento   )
values (@nombres,@apellidos ,@direccion  ,@telefono ,@numdocumento) 

GO
/****** Object:  StoredProcedure [dbo].[insertar_detalle_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_detalle_venta]
@idventa as integer ,
@idproducto as integer ,
@cantidad as decimal (18,2),
@precio_unitario as decimal (18,2)
as
insert into detalle_venta (idventa,idproducto,cantidad,precio_unitario)
values  (@idventa,@idproducto,@cantidad,@precio_unitario)

GO
/****** Object:  StoredProcedure [dbo].[insertar_producto]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[insertar_producto]
@idcategoria integer ,
@nombre varchar(50),
@descripcion varchar(255),
@stock  decimal(18, 2) ,
@precio_compra decimal(18, 2) ,
@precio_venta decimal(18, 2) ,
@fecha_vencimiento date 
as 
insert into producto (idcategoria  ,
nombre ,
descripcion ,
stock  ,
precio_compra  ,
precio_venta  ,
fecha_vencimiento)

 values (@idcategoria ,
@nombre ,
@descripcion,
@stock  ,
@precio_compra ,
@precio_venta ,
@fecha_vencimiento )

GO
/****** Object:  StoredProcedure [dbo].[insertar_venta]    Script Date: 26/04/2023 8:01:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_venta]
@idcliente as integer ,
@fecha_venta as date,
@tipo_documento as varchar(50),
@num_documento as varchar(50)
as
insert into venta (idcliente,fecha_venta,tipo_documento,num_documento)
values  (@idcliente,@fecha_venta,@tipo_documento,@num_documento)
GO
