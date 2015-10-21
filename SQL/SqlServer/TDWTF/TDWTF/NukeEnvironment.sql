--GO
--ALTER DATABASE Forum
--SET SINGLE_USER
--WITH ROLLBACK IMMEDIATE
--GO
--ALTER DATABASE Forum
--SET MULTI_USER
--GO

--GO
--ALTER DATABASE SignalRMessaging
--SET SINGLE_USER
--WITH ROLLBACK IMMEDIATE
--GO
--ALTER DATABASE SignalRMessaging
--SET MULTI_USER
--GO

--GO
--ALTER DATABASE Archive
--SET SINGLE_USER
--WITH ROLLBACK IMMEDIATE
--GO
--ALTER DATABASE Archive
--SET MULTI_USER
--GO


--GO
--ALTER DATABASE EncryptionSettings
--SET SINGLE_USER
--WITH ROLLBACK IMMEDIATE
--GO
--ALTER DATABASE Archive
--SET MULTI_USER
--GO

--GO
--ALTER DATABASE AuditLog
--SET SINGLE_USER
--WITH ROLLBACK IMMEDIATE
--GO
--ALTER DATABASE AuditLog
--SET MULTI_USER
--GO
----------------------------------------------------------------------
-- Database Nuke
----------------------------------------------------------------------
--disable trigger safety_database on all server;
--enable trigger safety_database on all server;
drop database Forum;
drop database SignalRMessaging;
drop database Archive;
drop database EncryptionSettings;
drop database AuditLog;
drop trigger safety_database on all server
drop trigger insert_encryption_trigger on all server

----------------------------------------------------------------------
-- Table Nuke
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Procedure Nuke
----------------------------------------------------------------------