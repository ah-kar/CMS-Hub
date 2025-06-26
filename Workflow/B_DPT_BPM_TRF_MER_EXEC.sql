USE [msdb]
GO

/****** Object:  Job [B_DPT_BPM_TRF_MER_EXEC]    Script Date: 6/25/2025 5:28:31 PM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Data Collector]    Script Date: 6/25/2025 5:28:31 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Data Collector' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Data Collector'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'B_DPT_BPM_TRF_MER_EXEC', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Bill Payment by Merchant', 
		@category_name=N'Data Collector', 
		@owner_login_name=N'CMSDB1\Administrator', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_ADD_TRN_INFO_EXEC]    Script Date: 6/25/2025 5:28:31 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_ADD_TRN_INFO_EXEC', 
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

DECLARE @count INT = 0;

WHILE @count <= ROUND(RAND() * 20, 0)
BEGIN
    BEGIN TRAN;

INSERT INTO [dbo].[D_HUBSTM] (
    [TXDT],
    [USRID],
    [SYSTEMID],
    [SOURCEREF],
    [DESREF],
    [BANKID],
    [SWIFTCODE],
    [SERVICEID],
    [SERVICECD],
    [TXCHANNEL],
    [TXCODE],
    [BCODE],
    [TRANCODE],
    [WFCODE],
    [NOTIFMAIL],
    [CCYID],
    [FEECODE],
    [FEEVAL],
    [INCACNO],
    [CATID],
    [ID],
    [DVALUEDT],
    [TRANTYPE],
    [ISOFFLINETRN],
    [ISONLINETRN],
    [RSTS],
    [WFSTS],
    [TXSTS],
    [REFVAL01],
    [REFVAL02],
    [REFVAL03],
    [REFVAL04],
    [REFVAL10],
	[REFVAL05],
    [DATE01],
    [DATE02]
)
VALUES (
    GETDATE(),                                -- TXDT
    ''digital01/2c2p'',                              -- USRID
    ''HUB02'',                                    -- SYSTEMID
    LOWER(NEWID()),                           -- SOURCEREF
    LOWER(NEWID()),                           -- DESREF
    ''KBANK'',                                  -- BANKID
    ''KASITHBK'',                               -- SWIFTCODE
    ''902'',                                    -- SERVICEID
    ''BPM_TRF'',                                -- SERVICECD
    (
        SELECT TOP 1 CHANNELID
        FROM D_CHANNEL
        WHERE CHANNELCODE <> ''O''
        ORDER BY NEWID()
    ),                                        -- TXCHANNEL
    ''K9_HUB02'',                                    -- TXCODE
    ''902'',                                    -- BCODE
    ''DPT_BPM_TRF'',                            -- TRANCODE
    ''WF_INIT'',                               -- WFCODE
    ''noreply-cmshub@kbank.com'',               -- NOTIFMAIL
    ''THB'',                                    -- CCYID
    ''[{"FEECODE01":"BPM_FEE","FEECODE02":"BPM_CHG"}]'',-- FEECODE
    ''[{"HUBFEE01":"50","HUBFEE02":"50"}]'',            -- FEEVAL
    ''20101011'',                               -- INCACNO
    ''hub'',                                    -- CATID
    REPLACE(LOWER(NEWID()), ''-'', ''''),        -- ID
    CAST(GETDATE() AS DATE),                 -- DVALUEDT
    ''Online'',                                 -- TRANTYPE
    ''N'',                                      -- ISOFFLINETRN
    ''Y'',                                      -- ISONLINETRN
    ''C'',                                      -- RSTS
    ''C'',                                      -- WFSTS
    (
        SELECT TOP 1 CODEID
        FROM (
            SELECT CODEID FROM D_CODETYPE WHERE CODETYPE = ''TXSTS''
            UNION ALL
            SELECT CODEID FROM D_CODETYPE WHERE CODETYPE = ''TXSTS'' AND CODEID = ''C''
            UNION ALL
            SELECT CODEID FROM D_CODETYPE WHERE CODETYPE = ''TXSTS'' AND CODEID = ''C''
        ) AS WeightedPool
        ORDER BY NEWID()
    ),                                        -- TXSTS
    RIGHT(''000000'' + CAST(ABS(CHECKSUM(NEWID())) % 1000000 AS NVARCHAR), 6), -- REFVAL01
    (
        SELECT TOP 1 ACNO, CUSCODE, CUSMOBILE, BRANCHCODE, ACCAT, BANKID
        FROM D_BENEFDPTACT
        ORDER BY NEWID()
        FOR JSON PATH
    ),                                        -- REFVAL02
	''30101022'',                               -- REFVAL03
	''Bill Payment Transfer'',  					  -- REFVAL04
    ''Bill Payment Transfer'',                      -- REFVAL10
	(SELECT TOP 1
fileid,importref,fileref,importdt,filedt,expiredt,billref,billsts,billamt,consumerid,cosumerref,refval01
FROM D_BILLINFO
WHERE billsts = ''A'' AND billamt > 0
ORDER BY NEWID() FOR JSON PATH),			  -- REFVAL05
    GETDATE(),                                -- DATE01
    GETUTCDATE()                              -- DATE02
);

    SET @count = @count + 1;
    COMMIT TRAN;
END;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_UPD_TRN_INFO_EXEC]    Script Date: 6/25/2025 5:28:31 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_UPD_TRN_INFO_EXEC', 
		@step_id=2, 
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

BEGIN TRAN;

UPDATE D_HUBSTM
SET 
    STMREF      = RIGHT(''00000000'' + CAST(RECID AS NVARCHAR), 8),
    TXREFID     = FORMAT(GETDATE(), ''yyyyMMdd'') + RIGHT(''00000000'' + CAST(RECID AS NVARCHAR), 8),
	INVCODE     = RIGHT(''INV_NUM_00000000'' + CAST(RECID AS NVARCHAR), 8),
    INVREF     = RIGHT(''INV_REF_00000000'' + CAST(RECID AS NVARCHAR), 8),
    BRANCHCD    = JSON_VALUE(REFVAL02, ''$[0].BRANCHCODE''),
    CUSCODE     = JSON_VALUE(REFVAL02, ''$[0].CUSCODE''),
    CUSMOBILE   = JSON_VALUE(REFVAL02, ''$[0].CUSMOBILE''),
    BACCDR       = JSON_VALUE(REFVAL02, ''$[0].ACNO''),
    BACCCR       = REFVAL03,
	MERCHANTID  = ''2C2P'',
	INCACNO = ''20101011/30101023'',
	CHAR38 = JSON_VALUE(REFVAL05, ''$[0].fileid''),
	CHAR39 = JSON_VALUE(REFVAL05, ''$[0].importref''),
	CHAR40 = JSON_VALUE(REFVAL05, ''$[0].fileref''),
	CHAR48 = JSON_VALUE(REFVAL05, ''$[0].billref''),
	CHAR42 = JSON_VALUE(REFVAL05, ''$[0].billsts''),
	CHAR43 = JSON_VALUE(REFVAL05, ''$[0].consumerid''),
	CHAR44 = JSON_VALUE(REFVAL05, ''$[0].cosumerref''),
	CHAR49 = JSON_VALUE(REFVAL05, ''$[0].refval01''),
	BILLAMT = JSON_VALUE(REFVAL05, ''$[0].billamt'')
WHERE 
    STMREF IS NULL
	AND TRANCODE = ''DPT_BPM_TRF''
    AND ISONLINETRN = ''Y'' AND USRID = ''digital01/2c2p''

COMMIT TRAN;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_UDP_TRN_STS_EXEC]    Script Date: 6/25/2025 5:28:31 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_UDP_TRN_STS_EXEC', 
		@step_id=3, 
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

BEGIN TRAN;

UPDATE D_HUBSTM
SET STS = 
    CASE 
        WHEN TXSTS = ''C'' THEN ''C''
        WHEN TXSTS = ''F'' THEN ''F''
    END,
	RSTS = WFSTS
WHERE 
    STS IS NULL
    AND TRANCODE = ''DPT_BPM_TRF''
    AND ISONLINETRN = ''Y''
AND MERCHANTID = ''2C2P''

COMMIT TRAN;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_UPD_TRN_AMT_EXEC]    Script Date: 6/25/2025 5:28:31 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_UPD_TRN_AMT_EXEC', 
		@step_id=4, 
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

BEGIN TRAN;

UPDATE D_HUBSTM
SET 
	USRAPPR = CASE
                 WHEN STS = ''C'' THEN ''Digital01''
                 WHEN STS = ''F'' THEN NULL
              END,
    NUM01 = CASE 
                WHEN STS = ''C'' THEN BILLAMT
                WHEN STS = ''F'' THEN 0
            END,
	CHAR36 = CASE 
                WHEN STS = ''C'' THEN JSON_VALUE(FEECODE, ''$[0].FEECODE01'')
                WHEN STS = ''F'' THEN ''-''
            END,
	CHAR37 = CASE 
                WHEN STS = ''C'' THEN JSON_VALUE(FEECODE, ''$[0].FEECODE02'')
                WHEN STS = ''F'' THEN ''-''
            END,
	NUM02 = CASE 
                WHEN STS = ''C'' THEN JSON_VALUE(FEEVAL, ''$[0].HUBFEE01'')
                WHEN STS = ''F'' THEN 0
            END,
	NUM03 = CASE 
                WHEN STS = ''C'' THEN JSON_VALUE(FEEVAL, ''$[0].HUBFEE02'')
                WHEN STS = ''F'' THEN 0
            END,
	NUM07 = CASE 
                WHEN STS = ''C'' THEN CAST(JSON_VALUE(FEEVAL, ''$[0].HUBFEE01'') AS INT)/2
                WHEN STS = ''F'' THEN 0
            END,
	NUM08 = CASE 
                WHEN STS = ''C'' THEN CAST(JSON_VALUE(FEEVAL, ''$[0].HUBFEE02'') AS INT)/2
                WHEN STS = ''F'' THEN 0
            END,
	NUM09 = CASE 
                WHEN STS = ''C'' THEN CAST(JSON_VALUE(FEEVAL, ''$[0].HUBFEE01'') AS INT)/2
                WHEN STS = ''F'' THEN 0
            END,
	NUM10 = CASE 
                WHEN STS = ''C'' THEN CAST(JSON_VALUE(FEEVAL, ''$[0].HUBFEE02'') AS INT)/2
                WHEN STS = ''F'' THEN 0
            END,
    NUM06 = CASE 
                WHEN STS = ''C'' THEN BILLAMT + CAST(JSON_VALUE(FEEVAL, ''$[0].HUBFEE01'') AS INT) + CAST(JSON_VALUE(FEEVAL, ''$[0].HUBFEE02'') AS INT)
                WHEN STS = ''F'' THEN 0
            END,
    ERRCODE = CASE
                 WHEN STS = ''C'' THEN ''S001''
                 WHEN STS = ''F'' THEN (
                     SELECT TOP 1 ERRORCD 
                     FROM D_ERRORCODE 
                     WHERE RECID <> 1 
                     ORDER BY NEWID()
                 )
             END
WHERE 
    NUM01 IS NULL
    AND TRANCODE = ''DPT_BPM_TRF''
    AND ISONLINETRN = ''Y''
	AND MERCHANTID = ''2C2P''

COMMIT TRAN;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_ADD_OTP_OUT_HIS_EXEC]    Script Date: 6/25/2025 5:28:31 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_ADD_OTP_OUT_HIS_EXEC', 
		@step_id=5, 
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

-- Step 1: Insert OTP records into D_OTPOUT
BEGIN TRAN;

INSERT INTO D_OTPOUT (
    [TXREFID],
    [TXDT],
    [CUSMOBILE],
    [CUSCODE],
    [OTPINFO],
    [OTPSTS],
    [SENTDT],
    [EXPIREDT]
)
SELECT 
    TXREFID,
    TXDT,
	CUSMOBILE,
	CUSCODE,
    CONCAT(''KBANK Ebanking System - Authentication code ,'',REFVAL01),
    CASE 
        WHEN STS = ''C'' THEN ''U''  -- Used
        ELSE ''E''                -- Expired or Failed
    END AS OTPSTS,
    TXDT,
    DATEADD(MINUTE, 3, TXDT)
FROM D_HUBSTM
WHERE 
    CHAR01 IS NULL
    AND TRANCODE = ''DPT_BPM_TRF''
    AND ISONLINETRN = ''Y''
	AND MERCHANTID = ''2C2P''

COMMIT TRAN;
GO

-- Step 2: Update CHAR fields in D_HUBSTM for logging/status messages
USE [CMS_KBANK];
GO

BEGIN TRAN;

UPDATE D_HUBSTM
SET 
    CHAR01 = ''Import D_OTPOUT Done'',
    CHAR02 = CASE 
                WHEN STS = ''C'' THEN CONCAT(REFVAL01, '' is used'')
                WHEN STS = ''F'' THEN CONCAT(REFVAL01, '' is expired'')
             END,
    CHAR03 = CONCAT(''OTP Code : '', REFVAL01),
    CHAR04 = CASE 
                WHEN STS = ''C'' THEN CONCAT(REFVAL01, '' OTP Transaction Success'')
                WHEN STS = ''F'' THEN CONCAT(REFVAL01, '' OTP Transaction Failed'')
             END,
    CHAR05 = CASE 
                WHEN STS = ''C'' THEN CONCAT(TXREFID, '' OTP Transaction Success'')
                WHEN STS = ''F'' THEN CONCAT(TXREFID, '' OTP Transaction Failed'')
             END,
    ISOTP  = CASE 
                WHEN STS = ''C'' THEN ''Y''
                WHEN STS = ''F'' THEN ''-''
             END
WHERE 
    CHAR01 IS NULL
    AND TRANCODE = ''DPT_BPM_TRF''
    AND ISONLINETRN = ''Y''
	AND MERCHANTID = ''2C2P''

COMMIT TRAN;
GO', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_ADD_SMS_OUT_HIS_EXEC]    Script Date: 6/25/2025 5:28:31 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_ADD_SMS_OUT_HIS_EXEC', 
		@step_id=6, 
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

-- Step 1: Insert SMS records into D_SMSOUT
BEGIN TRAN;

INSERT INTO D_SMSOUT (
    [TXREFID],
    [TXDT],
	[CUSMOBILE],
    [CUSCODE],
    [SMSINFO],
    [STS],
    [SENTDT],
    [EXPIREDT]
)
SELECT 
    TXREFID,
    TXDT,
	CUSMOBILE,
    CUSCODE,
    ''{KBANK Ebanking System - Payment Notification}'', -- Empty JSON or template SMS payload
    CASE 
        WHEN STS = ''C'' THEN ''S''  -- Sent
        ELSE ''F''                -- Failed
    END AS SMSSTS,
    TXDT,
    DATEADD(MINUTE, 3, TXDT)
FROM D_HUBSTM
WHERE 
    CHAR06 IS NULL
    AND TRANCODE = ''DPT_BPM_TRF''
    AND ISONLINETRN = ''Y''
	AND MERCHANTID = ''2C2P''

COMMIT TRAN;
GO

-- Step 2: Update CHAR06–CHAR10 fields in D_HUBSTM for SMS tracking
USE [CMS_KBANK];
GO

BEGIN TRAN;

UPDATE D_HUBSTM
SET 
    CHAR06 = ''Import D_SMSOUT Done'',
    CHAR07 = CASE 
                WHEN STS = ''C'' THEN ''SMS is sent''
                WHEN STS = ''F'' THEN ''SMS is failed''
             END,
    CHAR08 = CASE 
                WHEN STS = ''C'' THEN CONCAT(''Sender/Receiver : '', CUSCODE)
                WHEN STS = ''F'' THEN ''Sender/Receiver : -''
             END,
    CHAR09 = CASE 
                WHEN STS = ''C'' THEN ''SMS Transaction Success''
                WHEN STS = ''F'' THEN ''SMS Transaction Failed''
             END,
    CHAR10 = CASE 
                WHEN STS = ''C'' THEN CONCAT(TXREFID, '' SMS Transaction Success'')
                WHEN STS = ''F'' THEN CONCAT(TXREFID, '' SMS Transaction Failed'')
             END,
	ISSMS  = CASE 
                WHEN STS = ''C'' THEN ''Y''
                WHEN STS = ''F'' THEN ''-''
             END
WHERE 
    CHAR06 IS NULL
    AND TRANCODE = ''DPT_BPM_TRF''
    AND ISONLINETRN = ''Y''
	AND MERCHANTID = ''2C2P''

COMMIT TRAN;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_ADD_MAIL_OUT_HIS_EXEC]    Script Date: 6/25/2025 5:28:31 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_ADD_MAIL_OUT_HIS_EXEC', 
		@step_id=7, 
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

-- Step 1: Insert mail records into D_MAILOUT
BEGIN TRAN;

INSERT INTO D_MAILOUT (
    [TXREFID],
    [TXDT],
	[CUSMOBILE],
    [CUSCODE],
    [MAILINFO],
    [MAILSTS],
    [SENTDT],
    [EXPIREDT]
)
SELECT 
    TXREFID,
    TXDT,
	CUSMOBILE,
    CUSCODE,
    ''{KBANK Ebanking System - Payment Receipt}'',  -- Placeholder for email content
    CASE 
        WHEN STS = ''C'' THEN ''S''  -- Sent
        ELSE ''F''                -- Failed
    END AS MAILSTS,
    TXDT,
    DATEADD(MINUTE, 3, TXDT)
FROM D_HUBSTM
WHERE 
    CHAR11 IS NULL
    AND TRANCODE = ''DPT_BPM_TRF''
    AND ISONLINETRN = ''Y''
	AND MERCHANTID = ''2C2P'';

COMMIT TRAN;
GO

-- Step 2: Update CHAR11–CHAR15 fields in D_HUBSTM for mail tracking
USE [CMS_KBANK];
GO

BEGIN TRAN;

UPDATE D_HUBSTM
SET 
    CHAR11 = ''Import D_MAILOUT Done'',  -- Corrected label from "D_SMSOUT"
    CHAR12 = CASE 
                WHEN STS = ''C'' THEN ''Noreply Mail is sent''
                WHEN STS = ''F'' THEN ''Noreply Mail is failed''
             END,
    CHAR13 = CASE 
                WHEN STS = ''C'' THEN CONCAT(''Sender/Receiver : '', NOTIFMAIL, ''/'', CUSCODE)
                WHEN STS = ''F'' THEN ''Sender/Receiver : -''
             END,
    CHAR14 = CASE 
                WHEN STS = ''C'' THEN ''Mail Transaction Success''
                WHEN STS = ''F'' THEN ''Mail Transaction Failed''
             END,
    CHAR15 = CASE 
                WHEN STS = ''C'' THEN CONCAT(TXREFID, '' Mail Transaction Success'')
                WHEN STS = ''F'' THEN CONCAT(TXREFID, '' Mail Transaction Failed'')
             END,
	ISEMAIL  = CASE 
                WHEN STS = ''C'' THEN ''Y''
                WHEN STS = ''F'' THEN ''-''
             END
WHERE 
    CHAR11 IS NULL
    AND TRANCODE = ''DPT_BPM_TRF''
    AND ISONLINETRN = ''Y''
	AND MERCHANTID = ''2C2P''


COMMIT TRAN;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_UPD_TRN_LOG_BODY_EXEC]    Script Date: 6/25/2025 5:28:31 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_UPD_TRN_LOG_BODY_EXEC', 
		@step_id=8, 
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

UPDATE D_HUBSTM
SET 
    CHAR30 = CONCAT(TXREFID, ''/'', STMREF, ''/'', DESREF, ''/'', SOURCEREF),
    CHAR31 = ''{}'',
    CHAR32 = ''Transaction Success'',
    CHAR33 = CONCAT(REFVAL04, ''/'', REFVAL10),
    CHAR34 = CONCAT(TXREFID, '' Transaction Success''),
    CHAR35 = ''Success'',
	CHAR20 = ''MerchantID ''+MERCHANTID,
	CHAR21 = ''Merchant Settlment'',
	CHAR22 = 
	CASE WHEN STS = ''C'' THEN ''Merchant Settle Transaction''
	ELSE ''-'' END,
	CHAR23 = 
	CASE WHEN STS = ''C'' THEN ''Biller Success''
	ELSE ''-'' END,
    TXUPDATEDT = GETDATE()
WHERE 
    CHAR30 IS NULL
    AND TRANCODE = ''DPT_BPM_TRF''
    AND ISONLINETRN = ''Y''
    AND STS = ''C''
	AND MERCHANTID = ''2C2P''

COMMIT TRAN;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_UPD_BILL_INFO_STS_EXEC]    Script Date: 6/25/2025 5:28:31 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_UPD_BILL_INFO_STS_EXEC', 
		@step_id=9, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'

-- [{"HUBFEE01":"50","HUBFEE02":"50"}]

-- J_UPD_BILL_INFO_STS_EXEC

-- update biller info

USE [CMS_KBANK]
GO

BEGIN TRAN;
UPDATE D_BILLINFO
SET billsts = ''P'',
billamt = 0,
refval02 = ''Bill Payment Transaction Success'',
CHAR06 = ''Transaction Success'',
CHAR07 = ''Biller Success'',
NUM07 = 50,
NUM08 = 50,
NUM10 = NUM01 + 50 + 50,
date04 = GETDATE()
WHERE importref IN (
SELECT CHAR39 FROM D_HUBSTM
	WHERE
    REFVAL07 IS NULL
    AND TRANCODE = ''DPT_BPM_TRF''
    AND ISONLINETRN = ''Y''
	AND STS = ''C''
	AND MERCHANTID = ''2C2P''
)
COMMIT TRAN;

-- update bill info
USE [CMS_KBANK]
GO

BEGIN TRAN;
UPDATE D_HUBSTM
SET REFVAL07 = ''Biller Info Updated''
WHERE 
REFVAL07 IS NULL
AND TRANCODE = ''DPT_BPM_TRF''
AND ISONLINETRN = ''Y''
AND STS = ''C''
AND MERCHANTID = ''2C2P''
COMMIT TRAN;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_ADD_WFE_LOG_EXEC]    Script Date: 6/25/2025 5:28:31 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_ADD_WFE_LOG_EXEC', 
		@step_id=10, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
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
FROM D_HUBSTM WHERE CHAR45 IS NULL AND TRANCODE = ''DPT_BPM_TRF'' AND ISONLINETRN = ''Y'' AND MERCHANTID = ''2c2p''

OPEN row_cursor;
FETCH NEXT FROM row_cursor INTO @ID;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Insert each row as a separate JSON object into YourJsonTable
    INSERT INTO D_WORKFLOW_EX(REQUESTMESS)
    SELECT 
        (SELECT *
         FROM D_HUBSTM
         WHERE RECID = @ID AND CHAR45 IS NULL AND TRANCODE = ''DPT_BPM_TRF'' AND ISONLINETRN = ''Y'' AND MERCHANTID = ''2c2p''
         FOR JSON PATH, WITHOUT_ARRAY_WRAPPER) AS JsonData;
    
    FETCH NEXT FROM row_cursor INTO @ID;
END

CLOSE row_cursor;
DEALLOCATE row_cursor;

-- update
begin tran;
update D_WORKFLOW_EX
SET
TXDT = JSON_VALUE(REQUESTMESS, ''$.TXDT''),
TXREFID = JSON_VALUE(REQUESTMESS, ''$.TXREFID''),
TXCODE = JSON_VALUE(REQUESTMESS, ''$.TXCODE''),
ID = JSON_VALUE(REQUESTMESS, ''$.ID''),
RESPONSEMESS = REQUESTMESS,
WFCODE = 
CASE WHEN
	 JSON_VALUE(REQUESTMESS, ''$.STS'') = ''C'' THEN ''WF_INIT|WF_EXEC|WF_SUCC''
	 WHEN
	 JSON_VALUE(REQUESTMESS, ''$.STS'') = ''F'' THEN ''WF_INIT|WF_REVR''
	 END,
WFDESC = ''{}'',
WFSTS = JSON_VALUE(REQUESTMESS, ''$.WFSTS''),
WFDT = JSON_VALUE(REQUESTMESS, ''$.TXDT'')
WHERE TXCODE IS NULL;
commit tran;


-- Step 2: Update CHAR fields in D_HUBSTM for logging/status messages
USE [CMS_KBANK];
GO

BEGIN TRAN;

UPDATE D_HUBSTM
SET 
    CHAR45 = ''Import D_WORKFLOW_EX Done'',
    CHAR41 = CASE 
                WHEN STS = ''C'' THEN CONCAT(TXREFID, '' Workflow Exec Success'')
                WHEN STS = ''F'' THEN CONCAT(TXREFID, '' Workflow Exec Fail'')
             END,
    WFCODE = CASE 
                WHEN STS = ''C'' THEN ''WF_INIT|WF_EXEC|WF_SUCC''
                WHEN STS = ''F'' THEN ''WF_INIT|WF_REVR''
             END
WHERE 
    CHAR45 IS NULL
    AND TRANCODE = ''DPT_BPM_TRF''
    AND ISONLINETRN = ''Y''
    AND MERCHANTID = ''2c2p''
COMMIT TRAN;
GO
', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'B_DPT_BPM_TRF_MER_EXEC', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=5, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20250603, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'c69882ac-a5e3-4931-9ff0-374a9b4b77ba'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


