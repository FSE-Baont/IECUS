/*
Script created by SQL Compare from Red Gate Software Ltd at 8/3/2017 8:13:21 AM
Run this script on pc01\sql2008.ECUS5_CANG_PH to make it the same as pc01\sql2008.ECUS5_CANG_DEV
Please back up your database before running this script
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
PRINT N'Altering [dbo].[CONT_KB_CONTAINER_OUT_465_CT]'
GO
ALTER TABLE [dbo].[CONT_KB_CONTAINER_OUT_465_CT] ADD
[TONG_TRONG_LUONG] [float] NULL,
[MA_DVT] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CONT_KB_CONTAINER_OUT_CT]'
GO
ALTER TABLE [dbo].[CONT_KB_CONTAINER_OUT_CT] ADD
[TONG_TRONG_LUONG] [float] NULL,
[MA_DVT] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CONT_KB_CONTAINER_CT]'
GO
ALTER TABLE [dbo].[CONT_KB_CONTAINER_CT] ADD
[TONG_TRONG_LUONG] [float] NULL,
[MA_DVT] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[SYSNSD]'
GO
ALTER TABLE [dbo].[SYSNSD] ADD
[CAP_DO] [int] NOT NULL CONSTRAINT [DF_SYSNSD_LEVE] DEFAULT ((0))
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[SP_RESET_DB]'
GO
CREATE PROCEDURE [dbo].[SP_RESET_DB]
@PASSWORD VARCHAR(20)
AS
BEGIN
	IF @PASSWORD <> '@TSD123321@' BEGIN
		PRINT 'Fail'
		RETURN 0
	END 
	DELETE FROM CONT_KB_CONTAINER_OUT_465_CT 
	DELETE FROM CONT_KB_CONTAINER_OUT_465
	DELETE FROM CONT_KB_CONTAINER_OUT_CT
	DELETE FROM CONT_KB_CONTAINER_OUT
	DELETE FROM CONT_KB_CONTAINER_TT_CT_X
	DELETE FROM CONT_KB_CONTAINER_TT_CT
	DELETE FROM CONT_KB_CONTAINER_TT
	DELETE FROM CONT_KB_HUY
	DELETE FROM CONT_KB_SAIKHAC_CT_VANDON
	DELETE FROM CONT_KB_SAIKHAC_CT
	DELETE FROM CONT_KB_SAIKHAC
	DELETE FROM CONT_KB_SOICHIEU_CT
	DELETE FROM CONT_KB_SOICHIEU
	DELETE FROM CONT_KB_SUA
	DELETE FROM CONT_KB_TKVC_CT_VANDON 
	DELETE FROM CONT_KB_TKVC_CT
	DELETE FROM CONT_KB_TKVC
	DELETE FROM CONT_TOKHAI_TRACUU_CT
	DELETE FROM CONT_TOKHAI_TRACUU
	DELETE FROM CONT_KB_CONTAINER_CT_VANDON
	DELETE FROM CONT_KB_CONTAINER_CT
	DELETE FROM CONT_KB_CONTAINER
	DELETE FROM CONT_KB_HANGHOA_CT_VANDON
	DELETE FROM CONT_KB_HANGHOA_CT
	DELETE FROM CONT_KB_HANGHOA
	DELETE FROM HK_VANDON_TRACUU_CT
	DELETE FROM HK_VANDON_TRACUU
	DELETE FROM HK_TOKHAI_TRACUU_CT
	DELETE FROM HK_TOKHAI_TRACUU
	DELETE FROM HK_KB_XUAT_CT
	DELETE FROM HK_KB_XUAT
	DELETE FROM HK_KB_XUAT_341_CT
	DELETE FROM HK_KB_XUAT_341
	DELETE FROM HK_KB_TACHGHEP_CT
	DELETE FROM HK_KB_TACHGHEP
	DELETE FROM HK_KB_SUA
	DELETE FROM HK_KB_SAIKHAC_CT
	DELETE FROM HK_KB_SAIKHAC
	DELETE FROM HK_KB_HUY
	DELETE FROM HK_KB_HANGHOA_CT
	DELETE FROM HK_KB_HANGHOA
	DELETE FROM HK_KB_NHAP_CT_TK
	DELETE FROM HK_KB_NHAP_CT
	DELETE FROM HK_KB_NHAP
	DELETE FROM HR_VANDON_TRACUU_CT
	DELETE FROM HR_VANDON_TRACUU
	DELETE FROM HR_TOKHAI_TRACUU_CT
	DELETE FROM HR_TOKHAI_TRACUU
	DELETE FROM HR_KB_XUAT_CT
	DELETE FROM HR_KB_XUAT
	DELETE FROM HR_KB_XUAT_441_CT
	DELETE FROM HR_KB_XUAT_441
	DELETE FROM HR_KB_SUA
	DELETE FROM HR_KB_SAIKHAC_CT
	DELETE FROM HR_KB_SAIKHAC
	DELETE FROM HR_KB_HUY
	DELETE FROM HR_KB_HANGHOA_CT
	DELETE FROM HR_KB_HANGHOA
	DELETE FROM HR_KB_NHAP_CT_TK
	DELETE FROM HR_KB_NHAP_CT
	DELETE FROM HR_KB_NHAP
	DELETE FROM KB_CHUYENDIADIEM_CT
	DELETE FROM KB_CHUYENDIADIEM
	DELETE FROM KB_DINHDANH
	DELETE FROM KB_SODO
	DELETE FROM KB_TAU_CT
	DELETE FROM KB_TAU
	DELETE FROM KB_THONGDIEP_CT
	DELETE FROM KB_THONGDIEP
	DELETE FROM DLOGINFO 
	DELETE FROM DLOGMSG 
	DELETE FROM DLOGUSER 
	DELETE FROM DMESSAGEID 
	DELETE FROM SKHACHHANG
	DELETE FROM SKHO
	PRINT 'SUCCESS.'
	RETURN 1
END 
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[SP_INSERTGENERATOR]'
GO


CREATE  PROC [dbo].[SP_InsertGenerator]
(@tableName nvarchar(100)) as

--Declare a cursor to retrieve column specific information for the specified table
DECLARE cursCol CURSOR FAST_FORWARD FOR 
SELECT column_name,data_type FROM information_schema.columns WHERE table_name = @tableName AND COLUMNPROPERTY(OBJECT_ID(@tableName),COLUMN_NAME,'IsIdentity')<>1
OPEN cursCol
DECLARE @string nvarchar(3000) --for storing the first half of INSERT statement
DECLARE @stringData nvarchar(3000) --for storing the data (VALUES) related statement
DECLARE @dataType nvarchar(1000) --data types returned for respective columns
SET @string='INSERT '+@tableName+'('
SET @stringData=''

DECLARE @colName nvarchar(50)

FETCH NEXT FROM cursCol INTO @colName,@dataType

IF @@fetch_status<>0
	begin
	print 'Table '+@tableName+' not found, processing skipped.'
	close curscol
	deallocate curscol
	return
END

WHILE @@FETCH_STATUS=0
BEGIN
IF @dataType in ('varchar','char')
BEGIN
	--SET @stringData=@stringData+'''''''''+isnull('+@colName+','''')+'''''',''+'
	SET @stringData=@stringData+''''+'N''+isnull('''''+'''''+replace('+@colName+', '''''''','''''''''''')+'''''+''''',''ULL'')+'',''+'
	
END
ELSE
IF @dataType in ('nchar','nvarchar')
BEGIN
	--SET @stringData=@stringData+'''''''''+isnull('+@colName+','''')+'''''',''+'
	SET @stringData=@stringData+''''+'N''+isnull('''''+'''''+replace('+@colName+', '''''''','''''''''''')+'''''+''''',''ULL'')+'',''+'
		
END
ELSE
if @dataType in ('text','ntext') --if the datatype is text or something else 
BEGIN
	SET @stringData=@stringData+'''''''''+isnull(cast('+@colName+' as nvarchar(2000)),'''')+'''''',''+'
END
ELSE
IF @dataType = 'money' --because money doesn't get converted from varchar implicitly
BEGIN
	SET @stringData=@stringData+'''convert(money,''''''+isnull(cast('+@colName+' as nvarchar(200)),''0.0000'')+''''''),''+'
END
ELSE 
IF @dataType='datetime'
BEGIN
	--SET @stringData=@stringData+'''convert(datetime,''''''+isnull(cast('+@colName+' as nvarchar(200)),''0'')+''''''),''+'
	--SELECT 'INSERT Authorizations(StatusDate) VALUES('+'convert(datetime,'+isnull(''''+convert(nvarchar(200),StatusDate,121)+'''','NULL')+',121),)' FROM Authorizations
	--SET @stringData=@stringData+'''convert(money,''''''+isnull(cast('+@colName+' as nvarchar(200)),''0.0000'')+''''''),''+'
	SET @stringData=@stringData+'''convert(datetime,'+'''+isnull('''''+'''''+convert(nvarchar(200),'+@colName+',121)+'''''+''''',''NULL'')+'',121),''+'
  --                             'convert(datetime,'+isnull(''''+convert(nvarchar(200),StatusDate,121)+'''','NULL')+',121),)' FROM Authorizations
END
ELSE 
IF @dataType='image' 
BEGIN
	SET @stringData=@stringData+'''''''''+isnull(cast(convert(varbinary,'+@colName+') as nvarchar(6)),''0'')+'''''',''+'
END
ELSE --presuming the data type is int,bit,numeric,decimal 
BEGIN
	--SET @stringData=@stringData+'''''''''+isnull(cast('+@colName+' as nvarchar(200)),''0'')+'''''',''+'
	--SET @stringData=@stringData+'''convert(datetime,'+'''+isnull('''''+'''''+convert(nvarchar(200),'+@colName+',121)+'''''+''''',''NULL'')+'',121),''+'
	SET @stringData=@stringData+''''+'''+isnull('''''+'''''+convert(nvarchar(200),'+@colName+')+'''''+''''',''NULL'')+'',''+'
END

SET @string=@string+@colName+','

FETCH NEXT FROM cursCol INTO @colName,@dataType
END
DECLARE @Query nvarchar(4000)

SET @query ='SELECT '''+substring(@string,0,len(@string)) + ') VALUES(''+ ' + substring(@stringData,0,len(@stringData)-2)+'''+'')'' FROM '+@tableName
exec sp_executesql @query
--select @query

CLOSE cursCol
DEALLOCATE cursCol


GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[SP_REINDEXALL]'
GO
Create PROCEDURE [dbo].[SP_REINDEXALL] AS

DECLARE @TableName varchar(255) 

DECLARE TableCursor CURSOR FOR 
SELECT table_name FROM information_schema.tables 
WHERE table_type = 'base table' 

OPEN TableCursor 

FETCH NEXT FROM TableCursor INTO @TableName 
WHILE @@FETCH_STATUS = 0 
BEGIN 
DBCC DBREINDEX(@TableName,' ',80) 
FETCH NEXT FROM TableCursor INTO @TableName 
END 

CLOSE TableCursor 

DEALLOCATE TableCursor

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
--Cập nhật phiên bản csdl
UPDATE SYSAPP SET GIA_TRI = '12' WHERE DATA_FIELD = 'DBVERSION'
PRINT 'The database updated succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE #tmpErrors
GO
