----------------------------------------------------------------------
-- Create databases
----------------------------------------------------------------------
use master;
go
if not exists (select name from master.sys.databases where name = N'Forum')
begin
	create database Forum
	on 
	( name = Forum_dat,
		filename = 'D:\TDWTF-Forums\Database\MSSQL12.TDWTF\MSSQL\DATA\Forum.mdf',
		size = 10MB,
		maxsize = UNLIMITED,
		filegrowth = 10MB )
	log on
	( name = Forum_log,
		filename = 'D:\TDWTF-Forums\Database\MSSQL12.TDWTF\MSSQL\DATA\Forum.ldf',
		size = 5MB,
		maxsize = 500MB,
		filegrowth = 5MB ) ;
	print 'Created database "Forum"'
	end
else
begin
	Print 'Database "Forum" exists. No changes made.'
end
------
go
if not exists (select name from master.sys.databases where name = N'SignalRMessaging')
begin
create database SignalRMessaging
on 
( name = SignalR_dat,
    filename = 'D:\TDWTF-Forums\Database\MSSQL12.TDWTF\MSSQL\DATA\SignalRMessaging.mdf',
    size = 10MB,
    maxsize = UNLIMITED,
    filegrowth = 10MB )
log on
( name = SignalR_log,
    filename = 'D:\TDWTF-Forums\Database\MSSQL12.TDWTF\MSSQL\DATA\SignalRMessaging.ldf',
    size = 5MB,
    maxsize = 500MB,
    filegrowth = 5MB );
	print 'Created database "SignalRMessaging"'
end
else
begin
	Print 'Database "SignalRMessaging" exists. No changes made.'
end
------
go
if not exists (select name from master.sys.databases where name = N'Archive')
begin
create database Archive
on 
( name = Archive_dat,
    filename = 'D:\TDWTF-Forums\Database\MSSQL12.TDWTF\MSSQL\DATA\Archive.mdf',
    size = 10MB,
    maxsize = UNLIMITED,
    filegrowth = 10MB )
log on
( name = Archive_log,
    filename = 'D:\TDWTF-Forums\Database\MSSQL12.TDWTF\MSSQL\DATA\Archive.ldf',
    size = 5MB,
    maxsize = 500MB,
    filegrowth = 5MB );
	print 'Created database "Archive"'
end
else
begin
	Print 'Database "Archive" exists. No changes made.'
end
------
go
if not exists (select name from master.sys.databases where name = N'EncryptionSettings')
begin
create database EncryptionSettings
on 
( name = EncryptionSettings_dat,
    filename = 'D:\TDWTF-Forums\Database\MSSQL12.TDWTF\MSSQL\DATA\EncryptionSettings.mdf',
    size = 10MB,
    maxsize = UNLIMITED,
    filegrowth = 10MB )
log on
( name = EncryptionSettings_log,
    filename = 'D:\TDWTF-Forums\Database\MSSQL12.TDWTF\MSSQL\DATA\EncryptionSettings.ldf',
    size = 5MB,
    maxsize = 500MB,
    filegrowth = 5MB );
	print 'Created database "EncryptionSettings"'
end
else
begin
	Print 'Database "EncryptionSettings" exists. No changes made.'
end
------
go
if not exists (select name from master.sys.databases where name = N'AuditLog')
begin
create database AuditLog
on 
( name = AuditLog_dat,
    filename = 'D:\TDWTF-Forums\Database\MSSQL12.TDWTF\MSSQL\DATA\AuditLog.mdf',
    size = 10MB,
    maxsize = UNLIMITED,
    filegrowth = 10MB )
log on
( name = AuditLog_log,
    filename = 'D:\TDWTF-Forums\Database\MSSQL12.TDWTF\MSSQL\DATA\AuditLog.ldf',
    size = 5MB,
    maxsize = 500MB,
    filegrowth = 5MB );
	print 'Created database "AuditLog"'
end
else
begin
	Print 'Database "AuditLog" exists. No changes made.'
end
go
----------------------------------------------------------------------
-- Create database audit log
----------------------------------------------------------------------
go
use AuditLog
go
if not exists (select * from sys.tables where name = 'DDL_Audit_Log')
begin
	create table AuditLog.dbo.DDL_Audit_Log
	(
		EventTime datetime not null,
		LoginName varchar(250) not null,
		UserName varchar(250) not null,
		DatabaseName varchar(250) not null,
		SchemaName varchar(250) not null,
		ObjectName varchar(250) not null,
		ObjectType varchar(250) not null,
		DDLCommand varchar(max) not null
	)
	print 'Created Table "DDL_Audit_Log".'
end
else
begin
	print 'Table "DDL_Audit_Log" exists. No changes made.'
end
----------------------------------------------------------------------
-- Create Audit Log Triggers on databases
----------------------------------------------------------------------
go
use Forum
go
if exists (select * from sys.triggers where name = 'AuditChanges')
begin
	drop trigger AuditChanges on database
	print 'Recreating "AuditChanges" trigger on Forum.'
end
go
create trigger AuditChanges
on database
for DDL_DATABASE_LEVEL_EVENTS
as
declare @data xml
SET @data= eventdata()

insert into AuditLog.dbo.DDL_Audit_Log values 
(       replace(convert(varchar(50),@data.query('data(/EVENT_INSTANCE/PostTime)')),'T', ' '),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/LoginName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/UserName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/DatabaseName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/SchemaName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/ObjectName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/ObjectType)')),
        convert(nvarchar(max),@data.query('data(/EVENT_INSTANCE/TSQLCommand/CommandText)'))
)
-------
go
use EncryptionSettings
go
if exists (select * from sys.triggers where name = 'AuditChanges')
begin
	print 'Recreating "AuditChanges" trigger on EncryptionSettings.'
	drop trigger AuditChanges on database
end
go
create trigger AuditChanges
on database
for DDL_DATABASE_LEVEL_EVENTS
as
declare @data xml
SET @data= eventdata()

insert into AuditLog.dbo.DDL_Audit_Log values 
(       replace(convert(varchar(50),@data.query('data(/EVENT_INSTANCE/PostTime)')),'T', ' '),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/LoginName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/UserName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/DatabaseName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/SchemaName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/ObjectName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/ObjectType)')),
        convert(nvarchar(max),@data.query('data(/EVENT_INSTANCE/TSQLCommand/CommandText)'))
)
-------
go
use SignalRMessaging
go
if exists (select * from sys.triggers where name = 'AuditChanges')
begin
	print 'Recreating "AuditChanges" trigger on SignalRMessaging.'
	drop trigger AuditChanges on database
end
go
create trigger AuditChanges
on database
for DDL_DATABASE_LEVEL_EVENTS
as
declare @data xml
SET @data= eventdata()

insert into AuditLog.dbo.DDL_Audit_Log values 
(       replace(convert(varchar(50),@data.query('data(/EVENT_INSTANCE/PostTime)')),'T', ' '),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/LoginName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/UserName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/DatabaseName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/SchemaName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/ObjectName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/ObjectType)')),
        convert(nvarchar(max),@data.query('data(/EVENT_INSTANCE/TSQLCommand/CommandText)'))
)
----------------------------------------------------------------------
-- Encryption version history (DB side, code manages it's own information)
----------------------------------------------------------------------
create table EncryptionSettings.dbo.EncryptionDetails
(
	ID int not null identity(1, 1),
	Version int not null,
	CodeEncryptedDbKey nvarchar(max) not null,
	CreatedOn datetime not null,
	CreatedBy nvarchar(255) not null,
	MigrationReason nvarchar(max) not null,
	IsActive bit not null,
	constraint pk_EncryptionDetails primary key clustered (ID),
)
create unique index uix_EncryptionDetails_Version on EncryptionSettings.dbo.EncryptionDetails (Version)
create unique index uix_EncryptionDetails_IsActive on EncryptionSettings.dbo.EncryptionDetails (IsActive)
	where IsActive = 1

insert into EncryptionSettings.dbo.EncryptionDetails
select 0, 'init version', getutcdate(), SYSTEM_USER, 'Initial version', 1

----------------------------------------------------------------------
-- Table encryption version
----------------------------------------------------------------------
create table EncryptionSettings.dbo.EncryptionTables
(
	ID int not null identity(1, 1),
	EncryptionID int not null,
	DatabaseName varchar(250),
	SchemaName varchar(250),
	ObjectName varchar(250),
	constraint pk_EncryptionTables primary key clustered (ID),
	constraint fk_EncryptionTables_EncryptionID foreign key (EncryptionID)
		references EncryptionSettings.dbo.EncryptionDetails (ID)
)
go
use Forum
go
create trigger InsertEncryptionTrigger
on database
for create_table
as
begin
declare @data xml
set @data= eventdata()

insert into EncryptionSettings.dbo.EncryptionTables values 
(       (select max(ID) from EncryptionSettings.dbo.EncryptionDetails),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/DatabaseName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/SchemaName)')),
        convert(varchar(250), @data.query('data(/EVENT_INSTANCE/ObjectName)'))
)
end
-----
go
create trigger DeleteEncryptionTrigger
on database
for drop_table
as
begin
declare @data xml
set @data= eventdata()

delete from EncryptionSettings.dbo.EncryptionTables
where DatabaseName = convert(varchar(250), @data.query('data(/EVENT_INSTANCE/DatabaseName)'))
and SchemaName = convert(varchar(250), @data.query('data(/EVENT_INSTANCE/SchemaName)'))
and ObjectName = convert(varchar(250), @data.query('data(/EVENT_INSTANCE/ObjectName)'))
end
go
----------------------------------------------------------------------
-- Primary user table, core required fields only.
----------------------------------------------------------------------
create table dbo.UserMaster
(
	ID int not null identity(1, 1),
	LoginName nvarchar(255) not null,
	EncryptedLoginPassword nvarchar(max) not null,
	constraint pk_UserMaster primary key clustered (ID)
)

----------------------------------------------------------------------
-- Allows users to have multiple sub accounts, can be used to manage
-- alt names
----------------------------------------------------------------------
create table dbo.UserAccount
(
	ID int not null identity(1, 1),
	UserMasterID int not null,
	AccountName nvarchar(255) not null,
	DisplayName nvarchar(255) not null,
	constraint pk_UserAccount primary key clustered (ID),
	constraint fk_UserAccount_UserMasterID foreign key (UserMasterID)
		references dbo.UserMaster (ID)
)

----------------------------------------------------------------------
-- General user detail table, used for things like name, address,
-- phone number, whatever
----------------------------------------------------------------------
create table dbo.UserDetails
(
)
----------------------------------------------------------------------
-- Oauth master table, consolidates oauth accounts into a single link
-- And ties it back to the users master account
----------------------------------------------------------------------
create table dbo.OAuthMaster
(
)
----------------------------------------------------------------------
-- Oauth detail table, allows for many accounts to link to OAuth mater
----------------------------------------------------------------------
create table dbo.OAuthLink
(
)
----------------------------------------------------------------------
--
----------------------------------------------------------------------

----------------------------------------------------------------------
--
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Add DDL Triggers
----------------------------------------------------------------------
--go
--if exists (select * from sys.server_triggers where name = 'safety_database')
--begin
--	drop trigger safety_database on all server;
--	print 'Recreating "safety_database" trigger.'
--end
--go
--create trigger safety_database
--on all server
--for drop_database
--as
--begin
--	print 'You must disable Trigger "safety_database" to drop databases!' 
--	rollback;
--end
--go
--print 'Created server trigger "safety_database"'
--go