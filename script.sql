USE [QuanLyBanHang]
GO
/****** Object:  StoredProcedure [dbo].[PR_HienThi_KH_TheoMa]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PR_HienThi_KH_TheoMa]
@MaKH varchar(10)
as
begin 
select * from Khach_Hang where MaKH=@MaKH
end
GO
/****** Object:  StoredProcedure [dbo].[PR_HIENTHI_TAIKHOAN_ALL]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_HIENTHI_TAIKHOAN_ALL]
AS
BEGIN
SELECT *FROM Phan_Quyen	
END
GO
/****** Object:  StoredProcedure [dbo].[PR_HOADON_HIENTHI_MA_MAX]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_HOADON_HIENTHI_MA_MAX]
AS
BEGIN
SELECT TOP 1 MaPhieu FROM  Hoa_Don ORDER BY MaPhieu DESC
END
GO
/****** Object:  StoredProcedure [dbo].[PR_HOADON_HIENTHITATCA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_HOADON_HIENTHITATCA]
AS
BEGIN
SELECT *FROM  Hoa_Don 
END
GO
/****** Object:  StoredProcedure [dbo].[PR_HOADON_IN]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[PR_HOADON_IN]
 @MAPHIEU VARCHAR(10)
 AS
 BEGIN
  SELECT A.MaPhieu,B.TenMH,B.GiaBan,A.SoLuong,ThanhTien FROM Hoa_Don_ChiTiet A,Mat_Hang B WHERE A.MaPhieu=@MAPHIEU AND A.MaMH=B.MaMH
 END

GO
/****** Object:  StoredProcedure [dbo].[PR_HOADON_THEM]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PR_HOADON_THEM]
@MAPHIEU VARCHAR(10),
@NGAYNHAP DATETIME
AS
BEGIN
	 INSERT Hoa_Don(MaPhieu,NgayNhap)  VALUES(@MAPHIEU,@NGAYNHAP )
END

GO
/****** Object:  StoredProcedure [dbo].[PR_HOADON_XOA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_HOADON_XOA]
@MAPHIEU VARCHAR(10)
AS
BEGIN
DELETE FROM Hoa_Don WHERE MaPhieu=@MAPHIEU
END
GO
/****** Object:  StoredProcedure [dbo].[PR_HOADONCHITET_XOA_MH_KH]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_HOADONCHITET_XOA_MH_KH]
@MAPHIEU VARCHAR(10),
@MAMH VARCHAR(10)
AS
BEGIN
DELETE FROM Hoa_Don_ChiTiet WHERE MaMH=@MAMH AND MaPhieu=MaPhieu
END
GO
/****** Object:  StoredProcedure [dbo].[PR_HOADONCHITIET_SUA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PR_HOADONCHITIET_SUA]
@MAPHIEU varchar(10)
,@MAMH VARCHAR(10),
@MANV VARCHAR(10),
@SOLUONG FLOAT,

@MALOAITIEN VARCHAR(10)
AS
BEGIN
	 update Hoa_Don_ChiTiet
	 set @MAMH=@MANV,SoLuong=@SOLUONG,MaLoaiTien=@MALOAITIEN
		where MaPhieu=@MAPHIEU and MaMH=@MAMH
END

GO
/****** Object:  StoredProcedure [dbo].[PR_HOADONCHITIET_THEM]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PR_HOADONCHITIET_THEM]
@MAPHIEU VARCHAR(10),
@MAMH VARCHAR(10),
@MANV VARCHAR(10),
@SOLUONG FLOAT,

@MALOAITIEN VARCHAR(10)
AS
BEGIN
	 INSERT Hoa_Don_ChiTiet(MaPhieu,MaMH,MaNV,SoLuong,MaLoaiTien)  VALUES(@MAPHIEU,@MAMH,@MANV,@SOLUONG,@MALOAITIEN)
END

GO
/****** Object:  StoredProcedure [dbo].[PR_HOADONCHITIET_XEMCHITIET]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PR_HOADONCHITIET_XEMCHITIET]
 @MAPHIEU NVARCHAR (10)
 AS
 BEGIN
 SELECT* FROM Hoa_Don_ChiTiet WHERE MaPhieu=@MAPHIEU
 END
GO
/****** Object:  StoredProcedure [dbo].[PR_KH_SUA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PR_KH_SUA]
@MaKH varchar(10),
@HoTen nvarchar(50),
@DiaChi nvarchar(50),
@DienThoai varchar(20)
as
begin
update Khach_Hang
set 

HoTen=@HoTen,
DiaChi=@DiaChi,
DienThoai=@DienThoai
WHERE MaKH=@MaKH
end
GO
/****** Object:  StoredProcedure [dbo].[PR_KH_Them]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PR_KH_Them]
@MaKH varchar(10),
@HoTen nvarchar(50),
@DiaChi nvarchar(50),
@DienThoai varchar(20)
as
begin
insert Khach_Hang values (@MaKH,@HoTen,@DiaChi,@DienThoai)
end

GO
/****** Object:  StoredProcedure [dbo].[PR_KH_XOA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PR_KH_XOA]
@MAKH VARCHAR(10) 
AS
BEGIN	
	DELETE Khach_Hang WHERE MaKH=@MAKH
END
GO
/****** Object:  StoredProcedure [dbo].[PR_KHACHHANG_HIENTHITATCA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PR_KHACHHANG_HIENTHITATCA]
as
begin
select *from Khach_Hang
end
GO
/****** Object:  StoredProcedure [dbo].[PR_LayMaKH_TheoHoTen]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PR_LayMaKH_TheoHoTen]
@HoTen nvarchar(50)
as
begin
select MaKH from Khach_Hang where HoTen=@HoTen
end
GO
/****** Object:  StoredProcedure [dbo].[PR_MATHANG_HIENTHITATCA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_MATHANG_HIENTHITATCA]
AS
BEGIN
SELECT *FROM Mat_Hang
END
GO
/****** Object:  StoredProcedure [dbo].[PR_MATHANG_SUA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_MATHANG_SUA]
@MAMH VARCHAR(10),
@TENMH VARCHAR(50),
@SOLUONG FLOAT,
@DONGIA FLOAT,
@GIABAN FLOAT,
@MANCC VARCHAR(10),
@NGAYNHAP DATETIME,
@MALOAITIEN VARCHAR(10)
AS
BEGIN
UPDATE Mat_Hang
SET TenMH=@TENMH,
SoLuong=@SOLUONG,
DonGia=@DONGIA,
GiaBan=@GIABAN,
MaNCC=@MANCC,
NgayNhap=@NGAYNHAP,
MaLoaiTien=@MALOAITIEN
WHERE MaMH=@MAMH
END
GO
/****** Object:  StoredProcedure [dbo].[PR_MATHANG_THEM]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[PR_MATHANG_THEM]
@MAMH VARCHAR(10),
@TENMH VARCHAR(50),
@SOLUONG FLOAT,
@DONGIA FLOAT,
@GIABAN FLOAT,
@MANCC VARCHAR(10),
@NGAYNHAP DATETIME,
@MALOAITIEN VARCHAR(10)
AS
BEGIN
INSERT Mat_Hang(MaMH,TenMH,SoLuong,DonGia,GiaBan,MaNCC,NgayNhap,MaLoaiTien) VALUES(@MAMH,@TENMH,@SOLUONG,@DONGIA,@GIABAN,@MANCC,@NGAYNHAP,@MALOAITIEN)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_MATHANG_XOA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_MATHANG_XOA]
@MAMH VARCHAR(10)
AS
BEGIN
DELETE Mat_Hang WHERE MaMH=@MAMH
END
GO
/****** Object:  StoredProcedure [dbo].[PR_NHACUNGCAP_HIENTHITATCA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_NHACUNGCAP_HIENTHITATCA]
AS
BEGIN
SELECT *FROM  Nha_Cung_Cap
END

GO
/****** Object:  StoredProcedure [dbo].[PR_NHACUNGCAP_LAYTEN]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_NHACUNGCAP_LAYTEN]
@MANCC VARCHAR(10)
AS
BEGIN
SELECT TenNCC FROM Nha_Cung_Cap WHERE MaNCC=@MANCC
END

GO
/****** Object:  StoredProcedure [dbo].[PR_NHACUNGCAP_SUA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[PR_NHACUNGCAP_SUA]
@MANCC NVARCHAR(10),
@TENCC NVARCHAR(50),
@DIENTHOAI NVARCHAR(20),
@FAX NVARCHAR(30),
@EMAIL NVARCHAR(50),
@DIACHI NVARCHAR(50),
@GHICHU NVARCHAR(100)
AS
BEGIN
UPDATE Nha_Cung_Cap 
SET MaNCC= @MANCC , TenNCC= @TENCC, DienThoai= @DIENTHOAI,Fax= @FAX,Email= @EMAIL,DiaChi=@DIACHI,GhiChu= @GHICHU
WHERE MANCC=@MANCC
END
GO
/****** Object:  StoredProcedure [dbo].[PR_NHACUNGCAP_THEM]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[PR_NHACUNGCAP_THEM]
@MANCC NVARCHAR(10),
@TENCC NVARCHAR(50),
@DIENTHOAI NVARCHAR(20),
@FAX NVARCHAR(30),
@EMAIL NVARCHAR(50),
@DIACHI NVARCHAR(50),
@GHICHU NVARCHAR(100)
AS
BEGIN
INSERT Nha_Cung_Cap VALUES(@MANCC,@TENCC,@DIENTHOAI,@FAX,@EMAIL,@DIACHI,@GHICHU)
END

GO
/****** Object:  StoredProcedure [dbo].[PR_NHACUNGCAP_XOA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_NHACUNGCAP_XOA]
@MANCC NVARCHAR(10)
AS
BEGIN
DELETE Nha_Cung_Cap WHERE MaNCC=@MANCC
END
GO
/****** Object:  StoredProcedure [dbo].[PR_NHANVIEN_HIENTHITATCA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PR_NHANVIEN_HIENTHITATCA]
AS
BEGIN
SELECT *FROM Nhan_Vien
END 
GO
/****** Object:  StoredProcedure [dbo].[PR_NHANVIEN_SUA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_NHANVIEN_SUA]
@MANV VARCHAR(10),
@HOTEN VARCHAR(50),
@DIACHI VARCHAR(50),
@DIENTHOAI VARCHAR(20),
@GIOITINH varchar(10)
AS 
BEGIN
UPDATE Nhan_Vien
SET
HoTenNV=@HOTEN,
DiaChi=@DIACHI,
DienThoai=@DIENTHOAI,
GioiTinh=@GIOITINH
WHERE MaNV=@MANV 
END
GO
/****** Object:  StoredProcedure [dbo].[PR_NHANVIEN_THEM]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_NHANVIEN_THEM]
@MANV VARCHAR(10),
@HOTEN VARCHAR(50),
@DIACHI VARCHAR(50),
@DIENTHOAI VARCHAR(20),
@GIOITINH VARCHAR(10)
AS 
BEGIN
INSERT Nhan_Vien VALUES (@MANV,@HOTEN,@DIACHI,@DIENTHOAI,@GIOITINH)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_NHANVIEN_XOA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_NHANVIEN_XOA]
@MANV VARCHAR(10)
AS
BEGIN
DELETE Nhan_Vien WHERE MaNV=@MANV
END
GO
/****** Object:  StoredProcedure [dbo].[PR_TAIKHOAN_SUA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_TAIKHOAN_SUA]
@MAQUYEN VARCHAR(10),
@MANV VARCHAR(10),
@MATKHAU VARCHAR(30),
@TENDN VARCHAR(50)
AS
BEGIN
UPDATE Phan_Quyen
SET MaNV=@MANV,MaQuyen=@MAQUYEN,MatKhau=@MATKHAU,TenDangNhap=@TENDN
WHERE MaNV=@MANV
END

GO
/****** Object:  StoredProcedure [dbo].[PR_TAIKHOAN_THEM]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[PR_TAIKHOAN_THEM]
@MAQUYEN VARCHAR(10),
@MANV VARCHAR(10),
@MATKHAU VARCHAR(30),
@TENDN VARCHAR(50)
AS
BEGIN
INSERT Phan_Quyen VALUES (@MAQUYEN,@MANV,@MATKHAU,@TENDN)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_TAIKHOAN_XOA]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PR_TAIKHOAN_XOA]
@MANV VARCHAR(10)
AS
BEGIN
DELETE Phan_Quyen
WHERE MaNV=@MANV
END

GO
/****** Object:  StoredProcedure [dbo].[PR_THONGKE_SANPHAM_THEONGAY]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[PR_THONGKE_SANPHAM_THEONGAY]
@NGAYXUAT DATETIME
AS
BEGIN
  SELECT MaMH,SUM(SoLuong) AS SOLUONGBAN
   FROM Hoa_Don WHERE NgayXuat=@NGAYXUAT
  GROUP BY MaMH
END

GO
/****** Object:  StoredProcedure [dbo].[PR_XACTHUC]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PR_XACTHUC]
@TENDANGNHAP NVARCHAR(50),
@MATKHAU NVARCHAR(30)
AS
BEGIN
SELECT MaQuyen FROM Phan_Quyen WHERE TenDangNhap=@TENDANGNHAP AND MatKhau=@MATKHAU
END
GO
/****** Object:  Table [dbo].[Dat_Hang]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dat_Hang](
	[MaPhieu] [varchar](10) NOT NULL,
	[MaMH] [varchar](10) NOT NULL,
	[MaKH] [varchar](10) NOT NULL,
	[SoLuong] [float] NULL,
	[GiaBan] [float] NULL,
	[ThanhTien] [float] NULL,
	[NgayDat] [datetime] NULL,
	[ThanhToan] [bit] NULL,
	[MaLoaiTien] [varchar](10) NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_Dat_Hang_1] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC,
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hoa_Don]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hoa_Don](
	[MaPhieu] [varchar](10) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[MaKH] [varchar](10) NULL,
 CONSTRAINT [PK_Hoa_Don_2] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hoa_Don_ChiTiet]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hoa_Don_ChiTiet](
	[MaPhieu] [varchar](10) NOT NULL,
	[MaMH] [varchar](10) NOT NULL,
	[MaNV] [varchar](10) NOT NULL,
	[SoLuong] [float] NULL,
	[MaLoaiTien] [varchar](10) NULL,
	[ThanhTien] [float] NULL,
 CONSTRAINT [PK_Hoa_Don] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Khach_Hang]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Khach_Hang](
	[MaKH] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[DienThoai] [varchar](20) NULL,
 CONSTRAINT [PK_Khach_Hang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loai_Tien]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loai_Tien](
	[MaLoaiTien] [varchar](10) NOT NULL,
	[LoaiTien] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Loai_Tien] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mat_Hang]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mat_Hang](
	[MaMH] [varchar](10) NOT NULL,
	[TenMH] [nvarchar](50) NULL,
	[SoLuong] [float] NOT NULL,
	[DonGia] [float] NOT NULL,
	[GiaBan] [float] NULL,
	[MaNCC] [varchar](10) NULL,
	[NgayNhap] [datetime] NULL,
	[MaLoaiTien] [varchar](10) NULL,
	[SoLuongCon] [float] NULL,
 CONSTRAINT [PK_Mat_Hang_1] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nha_Cung_Cap]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nha_Cung_Cap](
	[MaNCC] [varchar](10) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[DienThoai] [varchar](20) NULL,
	[Fax] [varchar](30) NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_Nha_Cung_Cap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nhan_Vien]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nhan_Vien](
	[MaNV] [varchar](10) NOT NULL,
	[HoTenNV] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[DienThoai] [varchar](20) NULL,
	[GioiTinh] [nvarchar](10) NULL,
 CONSTRAINT [PK_Nhan_Vien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phan_Quyen]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phan_Quyen](
	[MaQuyen] [varchar](10) NOT NULL,
	[MaNV] [varchar](10) NOT NULL,
	[MatKhau] [varchar](30) NOT NULL,
	[TenDangNhap] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Phan_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 10/7/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [varchar](10) NOT NULL,
	[TenQuyen] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Dat_Hang] ([MaPhieu], [MaMH], [MaKH], [SoLuong], [GiaBan], [ThanhTien], [NgayDat], [ThanhToan], [MaLoaiTien], [GhiChu]) VALUES (N'DH000001', N'MH000001', N'KH000001', 1, 21000000, 21000000, CAST(0x00009F9000000000 AS DateTime), 1, N'0001', N'')
INSERT [dbo].[Dat_Hang] ([MaPhieu], [MaMH], [MaKH], [SoLuong], [GiaBan], [ThanhTien], [NgayDat], [ThanhToan], [MaLoaiTien], [GhiChu]) VALUES (N'DH000002', N'MH000002', N'KH000002', 1, 13900000, 13900000, CAST(0x00009FB300000000 AS DateTime), 1, N'0001', N'')
INSERT [dbo].[Dat_Hang] ([MaPhieu], [MaMH], [MaKH], [SoLuong], [GiaBan], [ThanhTien], [NgayDat], [ThanhToan], [MaLoaiTien], [GhiChu]) VALUES (N'DH000003', N'MH000003', N'KH000003', 1, 1700000, 1700000, CAST(0x00009FB300000000 AS DateTime), 1, N'0001', N'')
INSERT [dbo].[Dat_Hang] ([MaPhieu], [MaMH], [MaKH], [SoLuong], [GiaBan], [ThanhTien], [NgayDat], [ThanhToan], [MaLoaiTien], [GhiChu]) VALUES (N'DH000004', N'MH000006', N'KH000004', 1, 18900000, 18900000, CAST(0x00009FB900000000 AS DateTime), 0, N'0001', N'')
INSERT [dbo].[Hoa_Don] ([MaPhieu], [NgayNhap], [MaKH]) VALUES (N'XH001', CAST(0x00009F9500000000 AS DateTime), N'KH000001')
INSERT [dbo].[Hoa_Don] ([MaPhieu], [NgayNhap], [MaKH]) VALUES (N'XH002', CAST(0x00009F9500000000 AS DateTime), N'KH000002')
INSERT [dbo].[Hoa_Don] ([MaPhieu], [NgayNhap], [MaKH]) VALUES (N'XH003', CAST(0x00009F9500000000 AS DateTime), N'KH000003')
INSERT [dbo].[Hoa_Don] ([MaPhieu], [NgayNhap], [MaKH]) VALUES (N'XH004', CAST(0x00009FBB00000000 AS DateTime), N'KH000004')
INSERT [dbo].[Hoa_Don] ([MaPhieu], [NgayNhap], [MaKH]) VALUES (N'XH005', CAST(0x000007C800000000 AS DateTime), N'KH000002')
INSERT [dbo].[Hoa_Don_ChiTiet] ([MaPhieu], [MaMH], [MaNV], [SoLuong], [MaLoaiTien], [ThanhTien]) VALUES (N'XH002', N'MH000003', N'NV000005', 5, N'0001', 8500000)
INSERT [dbo].[Hoa_Don_ChiTiet] ([MaPhieu], [MaMH], [MaNV], [SoLuong], [MaLoaiTien], [ThanhTien]) VALUES (N'XH002', N'MH000004', N'NV000005', 1, N'0001', 13900000)
INSERT [dbo].[Hoa_Don_ChiTiet] ([MaPhieu], [MaMH], [MaNV], [SoLuong], [MaLoaiTien], [ThanhTien]) VALUES (N'XH002', N'MH000006', N'NV000005', 2, N'0001', 37800000)
INSERT [dbo].[Hoa_Don_ChiTiet] ([MaPhieu], [MaMH], [MaNV], [SoLuong], [MaLoaiTien], [ThanhTien]) VALUES (N'XH003', N'MH000002', N'NV000002', 2, N'0001', 27800000)
INSERT [dbo].[Hoa_Don_ChiTiet] ([MaPhieu], [MaMH], [MaNV], [SoLuong], [MaLoaiTien], [ThanhTien]) VALUES (N'XH003', N'MH000003', N'NV000002', 2, N'0001', 3400000)
INSERT [dbo].[Hoa_Don_ChiTiet] ([MaPhieu], [MaMH], [MaNV], [SoLuong], [MaLoaiTien], [ThanhTien]) VALUES (N'XH004', N'MH000004', N'NV000005', 1, N'0001', NULL)
INSERT [dbo].[Hoa_Don_ChiTiet] ([MaPhieu], [MaMH], [MaNV], [SoLuong], [MaLoaiTien], [ThanhTien]) VALUES (N'XH005   ', N'MH000004', N'NV000001', 1, N'0001', 13900000)
INSERT [dbo].[Khach_Hang] ([MaKH], [HoTen], [DiaChi], [DienThoai]) VALUES (N'KH000001', N'Nguyễn Ngọc Hân', N'Hai Bà Trưng - Hà Nội', N'01689920065')
INSERT [dbo].[Khach_Hang] ([MaKH], [HoTen], [DiaChi], [DienThoai]) VALUES (N'KH000002', N'Nguyễn Tuấn Anh', N'Từ Liêm - Hà Nội', N'0986353234')
INSERT [dbo].[Khach_Hang] ([MaKH], [HoTen], [DiaChi], [DienThoai]) VALUES (N'KH000003', N'Phạm Tiến Dũng', N'Cầu Diễn - Từ Liêm - Hà Nội', N'0912583734')
INSERT [dbo].[Khach_Hang] ([MaKH], [HoTen], [DiaChi], [DienThoai]) VALUES (N'KH000004', N'Nguyễn Mạnh Tuân', N'Thái Hà - Hà Nội', N'0978765785')
INSERT [dbo].[Khach_Hang] ([MaKH], [HoTen], [DiaChi], [DienThoai]) VALUES (N'KH000005', N'Nguyễn Mạnh Hùng', N'Xuân Mai - Chương Mỹ - Hà Nội', N'0978276789')
INSERT [dbo].[Loai_Tien] ([MaLoaiTien], [LoaiTien]) VALUES (N'0001', N'VND')
INSERT [dbo].[Loai_Tien] ([MaLoaiTien], [LoaiTien]) VALUES (N'0002', N'EUR')
INSERT [dbo].[Loai_Tien] ([MaLoaiTien], [LoaiTien]) VALUES (N'0003', N'USD')
INSERT [dbo].[Loai_Tien] ([MaLoaiTien], [LoaiTien]) VALUES (N'0004', N'HKD')
INSERT [dbo].[Loai_Tien] ([MaLoaiTien], [LoaiTien]) VALUES (N'0005', N'GBP')
INSERT [dbo].[Mat_Hang] ([MaMH], [TenMH], [SoLuong], [DonGia], [GiaBan], [MaNCC], [NgayNhap], [MaLoaiTien], [SoLuongCon]) VALUES (N'MH000001', N'Laptop Vaio', 50, 20000000, 21000000, N'NCC000001', CAST(0x00009F8E00000000 AS DateTime), N'0001', 44)
INSERT [dbo].[Mat_Hang] ([MaMH], [TenMH], [SoLuong], [DonGia], [GiaBan], [MaNCC], [NgayNhap], [MaLoaiTien], [SoLuongCon]) VALUES (N'MH000002', N'Điện thoại N9', 10, 12000000, 13900000, N'NCC000002', CAST(0x00009F9400000000 AS DateTime), N'0001', 3)
INSERT [dbo].[Mat_Hang] ([MaMH], [TenMH], [SoLuong], [DonGia], [GiaBan], [MaNCC], [NgayNhap], [MaLoaiTien], [SoLuongCon]) VALUES (N'MH000003', N'Đầu DVD', 50, 1500000, 1700000, N'NCC000001', CAST(0x00009FA400000000 AS DateTime), N'0001', 31)
INSERT [dbo].[Mat_Hang] ([MaMH], [TenMH], [SoLuong], [DonGia], [GiaBan], [MaNCC], [NgayNhap], [MaLoaiTien], [SoLuongCon]) VALUES (N'MH000004', N'SamSung Galaxy tab X2', 10, 13200000, 13900000, N'NCC000003', CAST(0x00009FAE00000000 AS DateTime), N'0001', 6)
INSERT [dbo].[Mat_Hang] ([MaMH], [TenMH], [SoLuong], [DonGia], [GiaBan], [MaNCC], [NgayNhap], [MaLoaiTien], [SoLuongCon]) VALUES (N'MH000005', N'nokia X6', 15, 6000000, 6500000, N'NCC000002', CAST(0x00009FB200000000 AS DateTime), N'0001', 10)
INSERT [dbo].[Mat_Hang] ([MaMH], [TenMH], [SoLuong], [DonGia], [GiaBan], [MaNCC], [NgayNhap], [MaLoaiTien], [SoLuongCon]) VALUES (N'MH000006', N'IPhone 4 32 Gb', 2, 17900000, 18900000, N'NCC000004', CAST(0x00009FB900000000 AS DateTime), N'0001', 0)
INSERT [dbo].[Mat_Hang] ([MaMH], [TenMH], [SoLuong], [DonGia], [GiaBan], [MaNCC], [NgayNhap], [MaLoaiTien], [SoLuongCon]) VALUES (N'MH000007', N'IPhone 4 16gb', 2, 15000000, 16900000, N'NCC000004', CAST(0x00009FB900000000 AS DateTime), N'0001', 10)
INSERT [dbo].[Nha_Cung_Cap] ([MaNCC], [TenNCC], [DienThoai], [Fax], [Email], [DiaChi], [GhiChu]) VALUES (N'NCC000001', N'Sony', N'0463789876', N'0463789889', N'sonyvietnam@gmail.com', N'Thái Hà - Hà Nội', N'')
INSERT [dbo].[Nha_Cung_Cap] ([MaNCC], [TenNCC], [DienThoai], [Fax], [Email], [DiaChi], [GhiChu]) VALUES (N'NCC000002', N'Nokia', N'0887778888', N'0887778889', N'nokia@gmail,com', N'Bình Thạnh - Hồ Chí Minh', N'')
INSERT [dbo].[Nha_Cung_Cap] ([MaNCC], [TenNCC], [DienThoai], [Fax], [Email], [DiaChi], [GhiChu]) VALUES (N'NCC000003', N'Sam Sung', N'087766554', N'088878775', N'samsung@gmail.com', N'Thủ Đức - Hồ Chí Minh', N'')
INSERT [dbo].[Nha_Cung_Cap] ([MaNCC], [TenNCC], [DienThoai], [Fax], [Email], [DiaChi], [GhiChu]) VALUES (N'NCC000004', N'IPhone', N'0437766554', N'0433388776', N'applestone@yahoo.com', N'Ba Đình - Hà Nội', N'')
INSERT [dbo].[Nha_Cung_Cap] ([MaNCC], [TenNCC], [DienThoai], [Fax], [Email], [DiaChi], [GhiChu]) VALUES (N'NCC000005', N'TOSHIBA', N'0463789877', N'0463789876', N'toshiba@gmail.com', N'Hai Bà Trưng - Hà Nội', N'')
INSERT [dbo].[Nhan_Vien] ([MaNV], [HoTenNV], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'NV000001', N'Ngô Chung Kiên', N'Xuân Mai - Chương Mỹ - Hà Nội', N'0979389350', N'Nam')
INSERT [dbo].[Nhan_Vien] ([MaNV], [HoTenNV], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'NV000002', N'Nguyễn Hùng Mạnh', N'Xuân Mai - Chương Mỹ - Hà Nội', N'0973302655', N'Nữ')
INSERT [dbo].[Nhan_Vien] ([MaNV], [HoTenNV], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'NV000003', N'Nguyễn Thị Ngọc', N'Xuân Mai - Chương Mỹ - Hà Nội', N'0988692854', N'Nữ')
INSERT [dbo].[Nhan_Vien] ([MaNV], [HoTenNV], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'NV000004', N'Ngô Thanh Thành', N'Xuân Mai - Chương Mỹ - Hà Nội', N'0988767656', N'Nam')
INSERT [dbo].[Nhan_Vien] ([MaNV], [HoTenNV], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'NV000005', N'Nguyễn Thị Oanh', N'Nhân Hòa - Nhân Chính - Hà Nội', N'01663736342', N'Nam')
INSERT [dbo].[Nhan_Vien] ([MaNV], [HoTenNV], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'NV000006', N'Phạm Trung Dũng', N'Đống Đa - Hà Nội', N'0912897287', N'Nam')
INSERT [dbo].[Phan_Quyen] ([MaQuyen], [MaNV], [MatKhau], [TenDangNhap]) VALUES (N'MQ001', N'NV000001', N'123', N'admin')
INSERT [dbo].[Phan_Quyen] ([MaQuyen], [MaNV], [MatKhau], [TenDangNhap]) VALUES (N'MQ002', N'NV000002', N'123', N'duy')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'MQ001', N'Admin')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'MQ002', N'Users')
ALTER TABLE [dbo].[Dat_Hang]  WITH CHECK ADD  CONSTRAINT [FK_Dat_Hang_Khach_Hang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[Khach_Hang] ([MaKH])
GO
ALTER TABLE [dbo].[Dat_Hang] CHECK CONSTRAINT [FK_Dat_Hang_Khach_Hang]
GO
ALTER TABLE [dbo].[Dat_Hang]  WITH CHECK ADD  CONSTRAINT [FK_Dat_Hang_Loai_Tien] FOREIGN KEY([MaLoaiTien])
REFERENCES [dbo].[Loai_Tien] ([MaLoaiTien])
GO
ALTER TABLE [dbo].[Dat_Hang] CHECK CONSTRAINT [FK_Dat_Hang_Loai_Tien]
GO
ALTER TABLE [dbo].[Dat_Hang]  WITH CHECK ADD  CONSTRAINT [FK_Dat_Hang_Mat_Hang] FOREIGN KEY([MaMH])
REFERENCES [dbo].[Mat_Hang] ([MaMH])
GO
ALTER TABLE [dbo].[Dat_Hang] CHECK CONSTRAINT [FK_Dat_Hang_Mat_Hang]
GO
ALTER TABLE [dbo].[Hoa_Don]  WITH CHECK ADD  CONSTRAINT [FK_Hoa_Don_Khach_Hang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[Khach_Hang] ([MaKH])
GO
ALTER TABLE [dbo].[Hoa_Don] CHECK CONSTRAINT [FK_Hoa_Don_Khach_Hang]
GO
ALTER TABLE [dbo].[Hoa_Don_ChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_Hoa_Don_ChiTiet_Hoa_Don1] FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[Hoa_Don] ([MaPhieu])
GO
ALTER TABLE [dbo].[Hoa_Don_ChiTiet] CHECK CONSTRAINT [FK_Hoa_Don_ChiTiet_Hoa_Don1]
GO
ALTER TABLE [dbo].[Hoa_Don_ChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_Hoa_Don_ChiTiet_Mat_Hang] FOREIGN KEY([MaMH])
REFERENCES [dbo].[Mat_Hang] ([MaMH])
GO
ALTER TABLE [dbo].[Hoa_Don_ChiTiet] CHECK CONSTRAINT [FK_Hoa_Don_ChiTiet_Mat_Hang]
GO
ALTER TABLE [dbo].[Hoa_Don_ChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_Hoa_Don_ChiTiet_Nhan_Vien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhan_Vien] ([MaNV])
GO
ALTER TABLE [dbo].[Hoa_Don_ChiTiet] CHECK CONSTRAINT [FK_Hoa_Don_ChiTiet_Nhan_Vien]
GO
ALTER TABLE [dbo].[Mat_Hang]  WITH CHECK ADD  CONSTRAINT [FK_Mat_Hang_Loai_Tien] FOREIGN KEY([MaLoaiTien])
REFERENCES [dbo].[Loai_Tien] ([MaLoaiTien])
GO
ALTER TABLE [dbo].[Mat_Hang] CHECK CONSTRAINT [FK_Mat_Hang_Loai_Tien]
GO
ALTER TABLE [dbo].[Mat_Hang]  WITH CHECK ADD  CONSTRAINT [FK_Mat_Hang_Nha_Cung_Cap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[Nha_Cung_Cap] ([MaNCC])
GO
ALTER TABLE [dbo].[Mat_Hang] CHECK CONSTRAINT [FK_Mat_Hang_Nha_Cung_Cap]
GO
ALTER TABLE [dbo].[Phan_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_Phan_Quyen_Nhan_Vien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhan_Vien] ([MaNV])
GO
ALTER TABLE [dbo].[Phan_Quyen] CHECK CONSTRAINT [FK_Phan_Quyen_Nhan_Vien]
GO
ALTER TABLE [dbo].[Phan_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_Phan_Quyen_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[Phan_Quyen] CHECK CONSTRAINT [FK_Phan_Quyen_Quyen]
GO
