USE [msdb]
GO

/****** Object:  Job [B_SYNC_BEF_DPT_ACT_EXEC]    Script Date: 6/25/2025 5:31:13 PM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Data Collector]    Script Date: 6/25/2025 5:31:13 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Data Collector' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Data Collector'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'B_SYNC_BEF_DPT_ACT_EXEC', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Sync Beneficiary Deposit Account', 
		@category_name=N'Data Collector', 
		@owner_login_name=N'CMSDB1\Administrator', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_ADD_BEF_DPT_ACT_EXEC]    Script Date: 6/25/2025 5:31:13 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_ADD_BEF_DPT_ACT_EXEC', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'USE [CMS_KBANK];
GO
DECLARE @MaxLoop INT = ROUND(RAND() * 5, 0)
DECLARE @i INT = 1;

WHILE @i <= @MaxLoop
BEGIN
    DECLARE @RandomString NVARCHAR(MAX) = N'''';
    DECLARE @RandomChar NVARCHAR(1);
    DECLARE @Counter INT = 0;
    DECLARE @Length INT = 255;
    DECLARE @Chars NVARCHAR(62) = ''ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'';

    -- Generate random 255-character token
    WHILE @Counter < @Length
    BEGIN
        SET @RandomChar = SUBSTRING(@Chars, ABS(CHECKSUM(NEWID())) % LEN(@Chars) + 1, 1);
        SET @RandomString = @RandomString + @RandomChar;
        SET @Counter = @Counter + 1;
    END

    BEGIN TRAN;
    INSERT INTO D_BENEFDPTACT
    (CUSCODE, CUSMOBILE, BRANCHCODE, ACCAT, ACSTS, OPENDT, NOTIFCHANNEL, ISOPNIB, ISOPNMB, SYNCSTS, SYNCTOKEN)
    VALUES
    (
        CONCAT(''10'', SUBSTRING(CAST(ABS(CHECKSUM(NEWID())) AS NVARCHAR), 1, 7)),
        CONCAT(''+66'', SUBSTRING(CAST(ABS(CHECKSUM(NEWID())) AS NVARCHAR), 1, 8)),
        (SELECT TOP 1 BRANCHCODE FROM D_BRANCHCODE WHERE BRANCHCODE <> ''0001'' ORDER BY NEWID()),
        (SELECT TOP 1 CATALOGCD FROM D_DEPOSITCATALOG ORDER BY NEWID()),
        ''N'',
        DATEADD(DAY, ABS(CHECKSUM(NEWID())) % DATEDIFF(DAY, ''2019-01-01'', GETDATE()), ''2019-01-01''),
        ''E|S'',
        ''Y'',
        ''Y'',
        ''P'',
        @RandomString
    );
    COMMIT TRAN;

    SET @i += 1;
END;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_UPD_BEF_DPT_ACT_EXEC]    Script Date: 6/25/2025 5:31:13 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_UPD_BEF_DPT_ACT_EXEC', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'USE [CMS_KBANK]
GO

BEGIN TRAN;
UPDATE D_BENEFDPTACT
SET ACNO = CASE 
    WHEN ACCAT = ''CU'' THEN CONCAT(''11'',BRANCHCODE,RIGHT(''0000000'' + CAST(RECID AS NVARCHAR), 7))
    WHEN ACCAT = ''SA'' THEN CONCAT(''21'',BRANCHCODE,RIGHT(''0000000'' + CAST(RECID AS NVARCHAR), 7))
    WHEN ACCAT = ''CA'' THEN CONCAT(''31'',BRANCHCODE,RIGHT(''0000000'' + CAST(RECID AS NVARCHAR), 7))
END,
ACHOLDBRN = BRANCHCODE,
BANKID = ''KBANK''
WHERE SYNCSTS = ''P'';
COMMIT TRAN;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_ADD_SYS_LOG_EXEC]    Script Date: 6/25/2025 5:31:13 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_ADD_SYS_LOG_EXEC', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_ADD_SYS_LOG_EXEC
USE [CMS_KBANK]
GO

-- Insert each row from YourTable into YourJsonTable as a separate JSON object
DECLARE @ID INT;

DECLARE row_cursor CURSOR FOR
SELECT RECID
FROM D_BENEFDPTACT WHERE SYNCSTS = ''P'';

OPEN row_cursor;
FETCH NEXT FROM row_cursor INTO @ID;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Insert each row as a separate JSON object into YourJsonTable
    INSERT INTO SYSLOG(LOGBODY)
    SELECT 
        (SELECT *
         FROM D_BENEFDPTACT
         WHERE RECID = @ID AND SYNCSTS = ''P''
         FOR JSON PATH, WITHOUT_ARRAY_WRAPPER) AS JsonData;
    
    FETCH NEXT FROM row_cursor INTO @ID;
END

CLOSE row_cursor;
DEALLOCATE row_cursor;

-- update
begin tran;
update SYSLOG
set LOGREF = REPLACE(LOWER(NEWID()),''-'',''''),
LOGDT = GETDATE(),
ACTION_USR_ID = ''sems'',
TARGET_USR_ID = ''D_BENEFDPTACT'',
ACTIONCODE = ''SQL_INSERT_LOG'',
LOGSTS = ''C'',
REMARK = ''Sync Beneficiary Deposit Account''
WHERE ACTIONCODE IS NULL;
commit tran;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_UPD_BEF_DPT_LOG_EXEC]    Script Date: 6/25/2025 5:31:13 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_UPD_BEF_DPT_LOG_EXEC', 
		@step_id=4, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'USE [CMS_KBANK]
GO

BEGIN TRAN;
UPDATE D_BENEFDPTACT
SET 
SYNCSTS = ''S'',
SYNCDT = GETUTCDATE()
WHERE SYNCSTS = ''P'';
COMMIT TRAN;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'B_SYNC_BEF_DPT_ACT_EXEC', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=1, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20250531, 
		@active_end_date=99991231, 
		@active_start_time=90000, 
		@active_end_time=235959, 
		@schedule_uid=N'afe69df0-2317-42d3-81b1-25b831a27160'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


