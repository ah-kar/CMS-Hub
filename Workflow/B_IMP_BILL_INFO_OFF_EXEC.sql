USE [msdb]
GO

/****** Object:  Job [B_IMP_BILL_INFO_OFF_EXEC]    Script Date: 6/25/2025 5:30:40 PM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Data Collector]    Script Date: 6/25/2025 5:30:40 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Data Collector' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Data Collector'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'B_IMP_BILL_INFO_OFF_EXEC', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Import Offline Bill', 
		@category_name=N'Data Collector', 
		@owner_login_name=N'CMSDB1\Administrator', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_IMP_BILL_FILE_OFF_EXEC]    Script Date: 6/25/2025 5:30:40 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_IMP_BILL_FILE_OFF_EXEC', 
		@step_id=1, 
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
-------------------------------
-- 1. Insert into D_UPLOADFILE_OFF
-------------------------------

DECLARE @FileID VARCHAR(50) = LOWER(NEWID());
DECLARE @FileName VARCHAR(255) = CONCAT(''seq_batch_imp_file'',''000000000'',SUBSTRING(CAST(ABS(CHECKSUM(NEWID())) AS varchar(max)),1,9),''.xlsx'')
DECLARE @FileDT DATETIME = GETDATE();
DECLARE @FileType VARCHAR(50) = ''BPM'';
DECLARE @BillType VARCHAR(50) = (SELECT TOP 1 CODEID FROM D_CODETYPE WHERE CODETYPE = ''BTYPE'' ORDER BY NEWID())
DECLARE @FileSize DECIMAL(10,2) = ROUND(RAND() * 29, 2);
DECLARE @FilePath VARCHAR(500) = ''C:\CMS_KBANK\upload\file\bill\offline\'';
DECLARE @UploadType VARCHAR(50) = ''OFFLINE'';
DECLARE @FileRowCnt INT = ROUND(RAND() * 39999, 0);
DECLARE @UsrUpload VARCHAR(50) = ''hubadmin''
DECLARE @UsrAppr VARCHAR(50) = ''sems'';
DECLARE @BranchCode  VARCHAR(50) = ''001''


-- file token gen
DECLARE @count INT = 1;
DECLARE @Length INT = 255;
DECLARE @Chars VARCHAR(62) = ''ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'';

BEGIN
    DECLARE @RandomString VARCHAR(MAX) = N'''';
    DECLARE @RandomChar VARCHAR(1);
    DECLARE @Counter INT = 0;

    -- Generate a random 255-character string
    WHILE @Counter < @Length
    BEGIN
        SET @RandomChar = SUBSTRING(@Chars, ABS(CHECKSUM(NEWID())) % LEN(@Chars) + 1, 1);
        SET @RandomString = @RandomString + @RandomChar;
        SET @Counter = @Counter + 1;
    END;

    -- Output or use the generated string
    --PRINT @RandomString;
END



-- Generate the filename


INSERT INTO D_UPLOADFILE_OFF
(
    FILEID,FILENAME,FILEDT,FILESTS,FILETOKEN,FILETYPE,FILESIZE,IMPROWCNT,BTYPE,IMPORTCAT,STS,USRID,USRAPPR
)
VALUES
(
    @FileID, @FileName, @FileDT,''Success'',@RandomString,@FileType,@FileSize,@FileRowCnt,@BillType,''OFF'',''P'',@UsrUpload,@UsrAppr
);

-------------------------------
-- 2. Insert into D_BILLINFO
-------------------------------

DECLARE @linecnt INT = 1;

-- Optional: Wrap the entire loop inside a transaction
BEGIN TRAN;
WHILE @linecnt <= @FileRowCnt
BEGIN
    INSERT INTO [dbo].[D_BILLINFO]
    (
		fileid,
		filedt,
		filetoken,
		importdt,
		expiredt,
		filetype,
		consumerid,
		cosumerref,
		billref,
		billamt,
		billsts,
		refval01,
		char01,
		char02,
		importtype,
		char03,
		char04,
		char05,
		date01,
		date02,
		date03
	)
    VALUES
    (
		@FileID,
		@FileDT,
		@RandomString,
		@FileDT,
		DATEADD(DAY,7,@FileDT),
		@FileType,
		ABS(CHECKSUM(NEWID())),
		LOWER(NEWID()),
		CONCAT(''95'',''000000000'',SUBSTRING(CAST(ABS(CHECKSUM(NEWID())) AS varchar(max)),1,9)),
		(
		SELECT CASE 
           WHEN ROUND(RAND() * 10000, -2) = 0 THEN 1000 
           ELSE ROUND(RAND() * 10000, -2) 
        END
		),
		''A'',
		@BillType,
		''Bill Payment'',
		''OFF'',
		''Offline'',
		LOWER(NEWID()),
		''Import Bill'',
		''Import Success'',
		GETDATE(),
		GETUTCDATE(),
		CAST(GETDATE() AS date)
    );

    SET @linecnt += 1;
END;

COMMIT TRAN;

-------------------------------
-- 3. Update D_UPLOADFILE_OFF
-------------------------------
-- import fileinfo
USE [CMS_KBANK]
GO

BEGIN TRAN;
INSERT INTO D_FILEINFO (fileid,filetype,importdt,filedt,billtype,importsts,importlinecnt,filests)
SELECT 
FILEID,FILETYPE,FILEDT,FILEDT,BTYPE,FILESTS,IMPROWCNT,''C''
FROM D_UPLOADFILE_OFF
WHERE STS = ''P''
COMMIT TRAN;

Begin Tran;
UPDATE D_UPLOADFILE_OFF
Set REMARK = CONCAT(''Row '',IMPROWCNT,''/'',IMPROWCNT,'' Imported.''),
STS = ''C''
WHERE STS = ''P''
Commit Tran; 

-------------------------------
-- 4. Update D_BILLINFO
-------------------------------

Begin Tran;
UPDATE D_BILLINFO
Set importref = ''95''+FORMAT(GETDATE(), ''yyyyMMdd'') + RIGHT(''0000000000'' + CAST(recid AS VARCHAR), 10) ,
fileref = FORMAT(GETDATE(), ''yyyyMMdd'') + RIGHT(''0000000000'' + CAST(recid AS VARCHAR), 10),
num01 = billamt,
num02 = billamt,
num03 = billamt,
num04 = billamt,
num05 = billamt
WHERE num01 IS NULL;
Commit Tran;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'B_IMP_BILL_SEQ_OFF_EXEC', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=62, 
		@freq_subday_type=8, 
		@freq_subday_interval=1, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20250531, 
		@active_end_date=99991231, 
		@active_start_time=90000, 
		@active_end_time=175959, 
		@schedule_uid=N'c6d5f395-647c-4c23-8d1d-4c68fcc31629'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


