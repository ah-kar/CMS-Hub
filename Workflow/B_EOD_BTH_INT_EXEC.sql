USE [msdb]
GO

/****** Object:  Job [B_CLEAN_LOG_EXEC]    Script Date: 6/29/2025 8:27:05 PM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Data Collector]    Script Date: 6/29/2025 8:27:05 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Data Collector' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Data Collector'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'B_CLEAN_LOG_EXEC', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Clean Log and System Task Rebuild', 
		@category_name=N'Data Collector', 
		@owner_login_name=N'CMSDB1\Administrator', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_MOV_SYS_LOG_HIS_EXEC]    Script Date: 6/29/2025 8:27:08 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_MOV_SYS_LOG_HIS_EXEC', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_MOV_SYS_LOG_HIS_EXEC

USE [CMS_KBANK]
GO

-- Declare variable to store row count
DECLARE @MovedRowCount INT;

-- Move Historical Data
BEGIN TRANSACTION;

-- Insert the data into SYSLOGHISTORY from SYSLOG based on the conditions
;WITH CTE_Transaction AS (
    SELECT 
       [LOGREF]
      ,[LOGDT]
      ,[ACTION_USR_ID]
      ,[TARGET_USR_ID]
      ,[ACTIONCODE]
      ,[LOGBODY]
      ,[REMARK]
      ,[LOGSTS]
    FROM SYSLOG
    WHERE [LOGDT] < CAST(GETDATE() AS DATE)
)
-- Insert the selected records into SYSLOGHISTORY and also delete from SYSLOG
DELETE CTE_Transaction
OUTPUT 
       DELETED.[LOGREF]
      ,DELETED.[LOGDT]
      ,DELETED.[ACTION_USR_ID]
      ,DELETED.[TARGET_USR_ID]
      ,DELETED.[ACTIONCODE]
      ,DELETED.[LOGBODY]
      ,DELETED.[REMARK]
      ,DELETED.[LOGSTS]
INTO SYSLOGHISTORY;

-- Capture how many rows were moved
SET @MovedRowCount = @@ROWCOUNT;

-- Insert clear log
INSERT INTO dbo.D_CLEANLOG(
	TXDT,
	DVALUEDT,
	TXCODE,
	FROM_TABLE,
	TO_TABLE,
	RSQUERY,
	RESULT,
	LOGMSG,
	STATUS
)
VALUES (
	GETDATE(),
	CAST(GETDATE()-1 AS date),
	''MOV_HIS_LOG'',
	''SYSLOG'',
	''SYSLOGHISTORY'',
	@MovedRowCount,
	CONCAT(''Move Data from SYSLOG to SYSLOGHISTORY with RowCount '',@MovedRowCount),
	CONCAT(''{"DATE":"'',CAST(GETUTCDATE() AS date),''","DESC":"MOVE TABLE HIS","TXDT":"'',CAST(GETDATE()-1 AS date),''"}''),
	''C''
);

COMMIT TRANSACTION;

', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_UPD_BILL_EXPDT_EXEC]    Script Date: 6/29/2025 8:27:08 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_UPD_BILL_EXPDT_EXEC', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_UPD_BILL_EXPDT_EXEC
USE [CMS_KBANK]
GO

BEGIN TRAN;
UPDATE D_BILLINFO
SET billsts = ''E''
WHERE CAST(expiredt as date) = CAST(GETDATE() as date)
COMMIT TRAN;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_MOV_BILL_EXP_STS_EXEC]    Script Date: 6/29/2025 8:27:08 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_MOV_BILL_EXP_STS_EXEC', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_MOV_BILL_EXP_STS_EXEC

USE [CMS_KBANK]
GO

-- Declare variable to store row count
DECLARE @MovedRowCount INT;

-- Move Historical Data
BEGIN TRANSACTION;

-- Insert the data into SYSUSERLOG from SYSUSERLOGHIS based on the conditions
;WITH CTE_Transaction AS (
    SELECT 
       [fileid]
      ,[importref]
      ,[fileref]
      ,[filetoken]
      ,[importdt]
      ,[filedt]
      ,[expiredt]
      ,[filetype]
      ,[importtype]
      ,[consumerid]
      ,[cosumerref]
      ,[billref]
      ,[billsts]
      ,[billamt]
      ,[refval01]
      ,[refval02]
      ,[refval03]
      ,[refval04]
      ,[refval05]
      ,[char01]
      ,[char02]
      ,[char03]
      ,[char04]
      ,[char05]
      ,[char06]
      ,[char07]
      ,[char08]
      ,[char09]
      ,[char10]
      ,[char11]
      ,[char12]
      ,[char13]
      ,[char14]
      ,[char15]
      ,[char16]
      ,[char17]
      ,[char18]
      ,[char19]
      ,[char20]
      ,[num01]
      ,[num02]
      ,[num03]
      ,[num04]
      ,[num05]
      ,[num06]
      ,[num07]
      ,[num08]
      ,[num09]
      ,[num10]
      ,[date01]
      ,[date02]
      ,[date03]
      ,[date04]
  FROM [CMS_KBANK].[dbo].[D_BILLINFO]
    WHERE billsts IN (''P'',''E'')
)
-- Insert the selected records into R_LOGTRAN and also delete from D_LOGTRAN
DELETE CTE_Transaction
OUTPUT 
       deleted.[fileid]
      ,deleted.[importref]
      ,deleted.[fileref]
      ,deleted.[filetoken]
      ,deleted.[importdt]
      ,deleted.[filedt]
      ,deleted.[expiredt]
      ,deleted.[filetype]
      ,deleted.[importtype]
      ,deleted.[consumerid]
      ,deleted.[cosumerref]
      ,deleted.[billref]
      ,deleted.[billsts]
      ,deleted.[billamt]
      ,deleted.[refval01]
      ,deleted.[refval02]
      ,deleted.[refval03]
      ,deleted.[refval04]
      ,deleted.[refval05]
      ,deleted.[char01]
      ,deleted.[char02]
      ,deleted.[char03]
      ,deleted.[char04]
      ,deleted.[char05]
      ,deleted.[char06]
      ,deleted.[char07]
      ,deleted.[char08]
      ,deleted.[char09]
      ,deleted.[char10]
      ,deleted.[char11]
      ,deleted.[char12]
      ,deleted.[char13]
      ,deleted.[char14]
      ,deleted.[char15]
      ,deleted.[char16]
      ,deleted.[char17]
      ,deleted.[char18]
      ,deleted.[char19]
      ,deleted.[char20]
      ,deleted.[num01]
      ,deleted.[num02]
      ,deleted.[num03]
      ,deleted.[num04]
      ,deleted.[num05]
      ,deleted.[num06]
      ,deleted.[num07]
      ,deleted.[num08]
      ,deleted.[num09]
      ,deleted.[num10]
      ,deleted.[date01]
      ,deleted.[date02]
      ,deleted.[date03]
      ,deleted.[date04]
INTO R_BILLINFO;

-- Capture how many rows were moved
SET @MovedRowCount = @@ROWCOUNT;

-- Insert audit log
INSERT INTO dbo.D_CLEANLOG(
	TXDT,
	DVALUEDT,
	TXCODE,
	FROM_TABLE,
	TO_TABLE,
	RSQUERY,
	RESULT,
	LOGMSG,
	STATUS
)
VALUES (
	GETDATE(),
	CAST(GETDATE()-1 AS date),
	''MOV_HIS_LOG'',
	''D_BILLINFO'',
	''R_BILLINFO'',
	@MovedRowCount,
	CONCAT(''Move Data from D_BILLINFO to R_BILLINFO with RowCount '',@MovedRowCount),
	CONCAT(''{"DATE":"'',CAST(GETUTCDATE() AS date),''","DESC":"MOVE TABLE HIS","TXDT":"'',CAST(GETDATE()-1 AS date),''"}''),
	''C''
);

COMMIT TRANSACTION;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_ADD_MER_SETTLE_EXEC]    Script Date: 6/29/2025 8:27:08 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_ADD_MER_SETTLE_EXEC', 
		@step_id=4, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_ADD_MER_SETTLE_EXEC
USE [CMS_KBANK]
GO

-- add merchant settle
BEGIN TRAN;
INSERT INTO D_MERCHANTSETTLE
(TXDT,SETTLEDT,TXREFID,SERCODE,MERCHANTID,MERACNO,BILLAMT,FEECODE,FEEAMT,CCYID,SETTLESTS,TXSTS,STS,CREATEDT,TRANDESC)
SELECT 
TXDT,DVALUEDT,TXREFID,SERVICECD,MERCHANTID,RIGHT(INCACNO,8),BILLAMT,CONCAT(CHAR36,''/'',CHAR37),(NUM09+NUM10),CCYID,''S'',TXSTS,STS,GETDATE(),REFVAL10
FROM D_HUBSTM
WHERE MERCHANTID = ''2C2P''
AND STS = ''C''
AND SERVICECD = ''BPM_TRF''
AND CHAR24 IS NULL
AND CAST(DVALUEDT as date) < CAST(GETDATE() as date)
COMMIT TRAN;

-- update D_HUBSTM
BEGIN TRAN;
UPDATE D_HUBSTM
SET CHAR24 = ''Import Settle Merchant Fee Tran'',
CHAR25 = ''Settle File Success''
WHERE MERCHANTID = ''2C2P''
AND STS = ''C''
AND SERVICECD = ''BPM_TRF''
AND CHAR24 IS NULL
AND CAST(DVALUEDT as date) < CAST(GETDATE() as date)
COMMIT TRAN;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_MOV_HUB_STM_HIS_EXEC]    Script Date: 6/29/2025 8:27:08 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_MOV_HUB_STM_HIS_EXEC', 
		@step_id=5, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_MOV_HUB_STM_HIS_EXEC

USE [CMS_KBANK]
GO

-- Declare variable to store row count
DECLARE @MovedRowCount INT;

-- Move Historical Data
BEGIN TRANSACTION;

-- Insert the data into SYSUSERLOG from SYSUSERLOGHIS based on the conditions
;WITH CTE_Transaction AS (
       SELECT 
       [STMREF]
      ,[TXDT]
      ,[TXREFID]
      ,[SYSTEMID]
      ,[SOURCEREF]
      ,[DESREF]
      ,[USRID]
      ,[USRAPPR]
      ,[NEXTAPPR]
      ,[SERVICEID]
      ,[SERVICECD]
      ,[TRANCODE]
      ,[TXCODE]
      ,[BCODE]
      ,[WFCODE]
      ,[TXCHANNEL]
      ,[PAYREFNO]
      ,[TXUPDATEDT]
      ,[DVALUEDT]
      ,[BANKID]
      ,[BRANCHCD]
      ,[SWIFTCODE]
      ,[NOTIFMAIL]
      ,[INVREF]
      ,[INVCODE]
      ,[MERCHANTID]
      ,[CATID]
      ,[ID]
      ,[CUSCODE]
      ,[CUSMOBILE]
      ,[BACCDR]
      ,[BACCCR]
      ,[BILLAMT]
      ,[CCYID]
      ,[INCACNO]
      ,[FEECODE]
      ,[FEEVAL]
      ,[ERRCODE]
      ,[TRANTYPE]
      ,[ISOFFLINETRN]
      ,[ISONLINETRN]
      ,[RSTS]
      ,[TXSTS]
      ,[STS]
      ,[WFSTS]
      ,[ISOTP]
      ,[ISVCH]
      ,[ISSMS]
      ,[ISEMAIL]
      ,[REFVAL01]
      ,[REFVAL02]
      ,[REFVAL03]
      ,[REFVAL04]
      ,[REFVAL05]
      ,[REFVAL06]
      ,[REFVAL07]
      ,[REFVAL08]
      ,[REFVAL09]
      ,[REFVAL10]
      ,[CHAR01]
      ,[CHAR02]
      ,[CHAR03]
      ,[CHAR04]
      ,[CHAR05]
      ,[CHAR06]
      ,[CHAR07]
      ,[CHAR08]
      ,[CHAR09]
      ,[CHAR10]
      ,[CHAR11]
      ,[CHAR12]
      ,[CHAR13]
      ,[CHAR14]
      ,[CHAR15]
      ,[CHAR16]
      ,[CHAR17]
      ,[CHAR18]
      ,[CHAR19]
      ,[CHAR20]
      ,[CHAR21]
      ,[CHAR22]
      ,[CHAR23]
      ,[CHAR24]
      ,[CHAR25]
      ,[CHAR26]
      ,[CHAR27]
      ,[CHAR28]
      ,[CHAR29]
      ,[CHAR30]
      ,[CHAR31]
      ,[CHAR32]
      ,[CHAR33]
      ,[CHAR34]
      ,[CHAR35]
      ,[CHAR36]
      ,[CHAR37]
      ,[CHAR38]
      ,[CHAR39]
      ,[CHAR40]
      ,[CHAR41]
      ,[CHAR42]
      ,[CHAR43]
      ,[CHAR44]
      ,[CHAR45]
      ,[CHAR46]
      ,[CHAR47]
      ,[CHAR48]
      ,[CHAR49]
      ,[CHAR50]
      ,[NUM01]
      ,[NUM02]
      ,[NUM03]
      ,[NUM04]
      ,[NUM05]
      ,[NUM06]
      ,[NUM07]
      ,[NUM08]
      ,[NUM09]
      ,[NUM10]
      ,[DATE01]
      ,[DATE02]
      ,[DATE03]
      ,[DATE04]
      ,[DATE05]
      ,[DATE06]
  FROM [CMS_KBANK].[dbo].[D_HUBSTM]
  WHERE CAST(DVALUEDT AS date) < CAST(GETDATE() as date)
)
-- Insert the selected records into R_LOGTRAN and also delete from D_LOGTRAN
DELETE CTE_Transaction
OUTPUT 
       deleted.[STMREF]
      ,deleted.[TXDT]
      ,deleted.[TXREFID]
      ,deleted.[SYSTEMID]
      ,deleted.[SOURCEREF]
      ,deleted.[DESREF]
      ,deleted.[USRID]
      ,deleted.[USRAPPR]
      ,deleted.[NEXTAPPR]
      ,deleted.[SERVICEID]
      ,deleted.[SERVICECD]
      ,deleted.[TRANCODE]
      ,deleted.[TXCODE]
      ,deleted.[BCODE]
      ,deleted.[WFCODE]
      ,deleted.[TXCHANNEL]
      ,deleted.[PAYREFNO]
      ,deleted.[TXUPDATEDT]
      ,deleted.[DVALUEDT]
      ,deleted.[BANKID]
      ,deleted.[BRANCHCD]
      ,deleted.[SWIFTCODE]
      ,deleted.[NOTIFMAIL]
      ,deleted.[INVREF]
      ,deleted.[INVCODE]
      ,deleted.[MERCHANTID]
      ,deleted.[CATID]
      ,deleted.[ID]
      ,deleted.[CUSCODE]
      ,deleted.[CUSMOBILE]
      ,deleted.[BACCDR]
      ,deleted.[BACCCR]
      ,deleted.[BILLAMT]
      ,deleted.[CCYID]
      ,deleted.[INCACNO]
      ,deleted.[FEECODE]
      ,deleted.[FEEVAL]
      ,deleted.[ERRCODE]
      ,deleted.[TRANTYPE]
      ,deleted.[ISOFFLINETRN]
      ,deleted.[ISONLINETRN]
      ,deleted.[RSTS]
      ,deleted.[TXSTS]
      ,deleted.[STS]
      ,deleted.[WFSTS]
      ,deleted.[ISOTP]
      ,deleted.[ISVCH]
      ,deleted.[ISSMS]
      ,deleted.[ISEMAIL]
      ,deleted.[REFVAL01]
      ,deleted.[REFVAL02]
      ,deleted.[REFVAL03]
      ,deleted.[REFVAL04]
      ,deleted.[REFVAL05]
      ,deleted.[REFVAL06]
      ,deleted.[REFVAL07]
      ,deleted.[REFVAL08]
      ,deleted.[REFVAL09]
      ,deleted.[REFVAL10]
      ,deleted.[CHAR01]
      ,deleted.[CHAR02]
      ,deleted.[CHAR03]
      ,deleted.[CHAR04]
      ,deleted.[CHAR05]
      ,deleted.[CHAR06]
      ,deleted.[CHAR07]
      ,deleted.[CHAR08]
      ,deleted.[CHAR09]
      ,deleted.[CHAR10]
      ,deleted.[CHAR11]
      ,deleted.[CHAR12]
      ,deleted.[CHAR13]
      ,deleted.[CHAR14]
      ,deleted.[CHAR15]
      ,deleted.[CHAR16]
      ,deleted.[CHAR17]
      ,deleted.[CHAR18]
      ,deleted.[CHAR19]
      ,deleted.[CHAR20]
      ,deleted.[CHAR21]
      ,deleted.[CHAR22]
      ,deleted.[CHAR23]
      ,deleted.[CHAR24]
      ,deleted.[CHAR25]
      ,deleted.[CHAR26]
      ,deleted.[CHAR27]
      ,deleted.[CHAR28]
      ,deleted.[CHAR29]
      ,deleted.[CHAR30]
      ,deleted.[CHAR31]
      ,deleted.[CHAR32]
      ,deleted.[CHAR33]
      ,deleted.[CHAR34]
      ,deleted.[CHAR35]
      ,deleted.[CHAR36]
      ,deleted.[CHAR37]
      ,deleted.[CHAR38]
      ,deleted.[CHAR39]
      ,deleted.[CHAR40]
      ,deleted.[CHAR41]
      ,deleted.[CHAR42]
      ,deleted.[CHAR43]
      ,deleted.[CHAR44]
      ,deleted.[CHAR45]
      ,deleted.[CHAR46]
      ,deleted.[CHAR47]
      ,deleted.[CHAR48]
      ,deleted.[CHAR49]
      ,deleted.[CHAR50]
      ,deleted.[NUM01]
      ,deleted.[NUM02]
      ,deleted.[NUM03]
      ,deleted.[NUM04]
      ,deleted.[NUM05]
      ,deleted.[NUM06]
      ,deleted.[NUM07]
      ,deleted.[NUM08]
      ,deleted.[NUM09]
      ,deleted.[NUM10]
      ,deleted.[DATE01]
      ,deleted.[DATE02]
      ,deleted.[DATE03]
      ,deleted.[DATE04]
      ,deleted.[DATE05]
      ,deleted.[DATE06]
INTO R_HUBSTM;

-- Capture how many rows were moved
SET @MovedRowCount = @@ROWCOUNT;

-- Insert audit log
INSERT INTO dbo.D_CLEANLOG(
	TXDT,
	DVALUEDT,
	TXCODE,
	FROM_TABLE,
	TO_TABLE,
	RSQUERY,
	RESULT,
	LOGMSG,
	STATUS
)
VALUES (
	GETDATE(),
	CAST(GETDATE()-1 AS date),
	''MOV_HIS_LOG'',
	''D_HUBSTM'',
	''R_HUBSTM'',
	@MovedRowCount,
	CONCAT(''Move Data from D_HUBSTM to R_HUBSTM with RowCount '',@MovedRowCount),
	CONCAT(''{"DATE":"'',CAST(GETUTCDATE() AS date),''","DESC":"MOVE TABLE HIS","TXDT":"'',CAST(GETDATE()-1 AS date),''"}''),
	''C''
);

COMMIT TRANSACTION;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_MOV_DIR_DBT_HIS_EXEC]    Script Date: 6/29/2025 8:27:08 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_MOV_DIR_DBT_HIS_EXEC', 
		@step_id=6, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_MOV_DIR_DBT_HIS_EXEC

USE [CMS_KBANK]
GO

-- Declare variable to store row count
DECLARE @MovedRowCount INT;

-- Move Historical Data
BEGIN TRANSACTION;

-- Insert the data into SYSUSERLOG from SYSUSERLOGHIS based on the conditions
;WITH CTE_Transaction AS (
       SELECT 
       [STMREF]
      ,[TXDT]
      ,[TXREFID]
      ,[SYSTEMID]
      ,[SOURCEREF]
      ,[DESREF]
      ,[USRID]
      ,[USRAPPR]
      ,[NEXTAPPR]
      ,[SERVICEID]
      ,[SERVICECD]
      ,[TRANCODE]
      ,[TXCODE]
      ,[BCODE]
      ,[WFCODE]
      ,[TXCHANNEL]
      ,[PAYREFNO]
      ,[TXUPDATEDT]
      ,[DVALUEDT]
      ,[BANKID]
      ,[BRANCHCD]
      ,[SWIFTCODE]
      ,[NOTIFMAIL]
      ,[INVREF]
      ,[INVCODE]
      ,[MERCHANTID]
      ,[CATID]
      ,[ID]
      ,[CUSCODE]
      ,[CUSMOBILE]
      ,[BACCDR]
      ,[BACCCR]
      ,[BILLAMT]
      ,[CCYID]
      ,[INCACNO]
      ,[FEECODE]
      ,[FEEVAL]
      ,[ERRCODE]
      ,[TRANTYPE]
      ,[ISOFFLINETRN]
      ,[ISONLINETRN]
      ,[RSTS]
      ,[TXSTS]
      ,[STS]
      ,[WFSTS]
      ,[ISOTP]
      ,[ISVCH]
      ,[ISSMS]
      ,[ISEMAIL]
      ,[REFVAL01]
      ,[REFVAL02]
      ,[REFVAL03]
      ,[REFVAL04]
      ,[REFVAL05]
      ,[REFVAL06]
      ,[REFVAL07]
      ,[REFVAL08]
      ,[REFVAL09]
      ,[REFVAL10]
      ,[CHAR01]
      ,[CHAR02]
      ,[CHAR03]
      ,[CHAR04]
      ,[CHAR05]
      ,[CHAR06]
      ,[CHAR07]
      ,[CHAR08]
      ,[CHAR09]
      ,[CHAR10]
      ,[CHAR11]
      ,[CHAR12]
      ,[CHAR13]
      ,[CHAR14]
      ,[CHAR15]
      ,[CHAR16]
      ,[CHAR17]
      ,[CHAR18]
      ,[CHAR19]
      ,[CHAR20]
      ,[CHAR21]
      ,[CHAR22]
      ,[CHAR23]
      ,[CHAR24]
      ,[CHAR25]
      ,[CHAR26]
      ,[CHAR27]
      ,[CHAR28]
      ,[CHAR29]
      ,[CHAR30]
      ,[CHAR31]
      ,[CHAR32]
      ,[CHAR33]
      ,[CHAR34]
      ,[CHAR35]
      ,[CHAR36]
      ,[CHAR37]
      ,[CHAR38]
      ,[CHAR39]
      ,[CHAR40]
      ,[CHAR41]
      ,[CHAR42]
      ,[CHAR43]
      ,[CHAR44]
      ,[CHAR45]
      ,[CHAR46]
      ,[CHAR47]
      ,[CHAR48]
      ,[CHAR49]
      ,[CHAR50]
      ,[NUM01]
      ,[NUM02]
      ,[NUM03]
      ,[NUM04]
      ,[NUM05]
      ,[NUM06]
      ,[NUM07]
      ,[NUM08]
      ,[NUM09]
      ,[NUM10]
      ,[DATE01]
      ,[DATE02]
      ,[DATE03]
      ,[DATE04]
      ,[DATE05]
      ,[DATE06]
  FROM [CMS_KBANK].[dbo].[D_DIRECTDEBIT]
  WHERE CAST(DVALUEDT AS date) < CAST(GETDATE() as date)
)
-- Insert the selected records into R_LOGTRAN and also delete from D_LOGTRAN
DELETE CTE_Transaction
OUTPUT 
       deleted.[STMREF]
      ,deleted.[TXDT]
      ,deleted.[TXREFID]
      ,deleted.[SYSTEMID]
      ,deleted.[SOURCEREF]
      ,deleted.[DESREF]
      ,deleted.[USRID]
      ,deleted.[USRAPPR]
      ,deleted.[NEXTAPPR]
      ,deleted.[SERVICEID]
      ,deleted.[SERVICECD]
      ,deleted.[TRANCODE]
      ,deleted.[TXCODE]
      ,deleted.[BCODE]
      ,deleted.[WFCODE]
      ,deleted.[TXCHANNEL]
      ,deleted.[PAYREFNO]
      ,deleted.[TXUPDATEDT]
      ,deleted.[DVALUEDT]
      ,deleted.[BANKID]
      ,deleted.[BRANCHCD]
      ,deleted.[SWIFTCODE]
      ,deleted.[NOTIFMAIL]
      ,deleted.[INVREF]
      ,deleted.[INVCODE]
      ,deleted.[MERCHANTID]
      ,deleted.[CATID]
      ,deleted.[ID]
      ,deleted.[CUSCODE]
      ,deleted.[CUSMOBILE]
      ,deleted.[BACCDR]
      ,deleted.[BACCCR]
      ,deleted.[BILLAMT]
      ,deleted.[CCYID]
      ,deleted.[INCACNO]
      ,deleted.[FEECODE]
      ,deleted.[FEEVAL]
      ,deleted.[ERRCODE]
      ,deleted.[TRANTYPE]
      ,deleted.[ISOFFLINETRN]
      ,deleted.[ISONLINETRN]
      ,deleted.[RSTS]
      ,deleted.[TXSTS]
      ,deleted.[STS]
      ,deleted.[WFSTS]
      ,deleted.[ISOTP]
      ,deleted.[ISVCH]
      ,deleted.[ISSMS]
      ,deleted.[ISEMAIL]
      ,deleted.[REFVAL01]
      ,deleted.[REFVAL02]
      ,deleted.[REFVAL03]
      ,deleted.[REFVAL04]
      ,deleted.[REFVAL05]
      ,deleted.[REFVAL06]
      ,deleted.[REFVAL07]
      ,deleted.[REFVAL08]
      ,deleted.[REFVAL09]
      ,deleted.[REFVAL10]
      ,deleted.[CHAR01]
      ,deleted.[CHAR02]
      ,deleted.[CHAR03]
      ,deleted.[CHAR04]
      ,deleted.[CHAR05]
      ,deleted.[CHAR06]
      ,deleted.[CHAR07]
      ,deleted.[CHAR08]
      ,deleted.[CHAR09]
      ,deleted.[CHAR10]
      ,deleted.[CHAR11]
      ,deleted.[CHAR12]
      ,deleted.[CHAR13]
      ,deleted.[CHAR14]
      ,deleted.[CHAR15]
      ,deleted.[CHAR16]
      ,deleted.[CHAR17]
      ,deleted.[CHAR18]
      ,deleted.[CHAR19]
      ,deleted.[CHAR20]
      ,deleted.[CHAR21]
      ,deleted.[CHAR22]
      ,deleted.[CHAR23]
      ,deleted.[CHAR24]
      ,deleted.[CHAR25]
      ,deleted.[CHAR26]
      ,deleted.[CHAR27]
      ,deleted.[CHAR28]
      ,deleted.[CHAR29]
      ,deleted.[CHAR30]
      ,deleted.[CHAR31]
      ,deleted.[CHAR32]
      ,deleted.[CHAR33]
      ,deleted.[CHAR34]
      ,deleted.[CHAR35]
      ,deleted.[CHAR36]
      ,deleted.[CHAR37]
      ,deleted.[CHAR38]
      ,deleted.[CHAR39]
      ,deleted.[CHAR40]
      ,deleted.[CHAR41]
      ,deleted.[CHAR42]
      ,deleted.[CHAR43]
      ,deleted.[CHAR44]
      ,deleted.[CHAR45]
      ,deleted.[CHAR46]
      ,deleted.[CHAR47]
      ,deleted.[CHAR48]
      ,deleted.[CHAR49]
      ,deleted.[CHAR50]
      ,deleted.[NUM01]
      ,deleted.[NUM02]
      ,deleted.[NUM03]
      ,deleted.[NUM04]
      ,deleted.[NUM05]
      ,deleted.[NUM06]
      ,deleted.[NUM07]
      ,deleted.[NUM08]
      ,deleted.[NUM09]
      ,deleted.[NUM10]
      ,deleted.[DATE01]
      ,deleted.[DATE02]
      ,deleted.[DATE03]
      ,deleted.[DATE04]
      ,deleted.[DATE05]
      ,deleted.[DATE06]
INTO R_DIRECTDEBIT;

-- Capture how many rows were moved
SET @MovedRowCount = @@ROWCOUNT;

-- Insert audit log
INSERT INTO dbo.D_CLEANLOG(
	TXDT,
	DVALUEDT,
	TXCODE,
	FROM_TABLE,
	TO_TABLE,
	RSQUERY,
	RESULT,
	LOGMSG,
	STATUS
)
VALUES (
	GETDATE(),
	CAST(GETDATE()-1 AS date),
	''MOV_HIS_LOG'',
	''D_DIRECTDEBIT'',
	''R_DIRECTDEBIT'',
	@MovedRowCount,
	CONCAT(''Move Data from D_DIRECTDEBIT to R_DIRECTDEBIT with RowCount '',@MovedRowCount),
	CONCAT(''{"DATE":"'',CAST(GETUTCDATE() AS date),''","DESC":"MOVE TABLE HIS","TXDT":"'',CAST(GETDATE()-1 AS date),''"}''),
	''C''
);

COMMIT TRANSACTION;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_MOV_SCH_TRF_HIS_EXEC]    Script Date: 6/29/2025 8:27:08 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_MOV_SCH_TRF_HIS_EXEC', 
		@step_id=7, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_MOV_SCH_TRF_HIS_EXEC

USE [CMS_KBANK]
GO

-- Declare variable to store row count
DECLARE @MovedRowCount INT;

-- Move Historical Data
BEGIN TRANSACTION;

-- Insert the data into SYSUSERLOG from SYSUSERLOGHIS based on the conditions
;WITH CTE_Transaction AS (
       SELECT 
       [STMREF]
      ,[TXDT]
      ,[TXREFID]
      ,[SYSTEMID]
      ,[SOURCEREF]
      ,[DESREF]
      ,[USRID]
      ,[USRAPPR]
      ,[NEXTAPPR]
      ,[SERVICEID]
      ,[SERVICECD]
      ,[TRANCODE]
      ,[TXCODE]
      ,[BCODE]
      ,[WFCODE]
      ,[TXCHANNEL]
      ,[PAYREFNO]
      ,[TXUPDATEDT]
      ,[DVALUEDT]
      ,[BANKID]
      ,[BRANCHCD]
      ,[SWIFTCODE]
      ,[NOTIFMAIL]
      ,[INVREF]
      ,[INVCODE]
      ,[MERCHANTID]
      ,[CATID]
      ,[ID]
      ,[CUSCODE]
      ,[CUSMOBILE]
      ,[BACCDR]
      ,[BACCCR]
      ,[BILLAMT]
      ,[CCYID]
      ,[INCACNO]
      ,[FEECODE]
      ,[FEEVAL]
      ,[ERRCODE]
      ,[TRANTYPE]
      ,[ISOFFLINETRN]
      ,[ISONLINETRN]
      ,[RSTS]
      ,[TXSTS]
      ,[STS]
      ,[WFSTS]
      ,[ISOTP]
      ,[ISVCH]
      ,[ISSMS]
      ,[ISEMAIL]
      ,[REFVAL01]
      ,[REFVAL02]
      ,[REFVAL03]
      ,[REFVAL04]
      ,[REFVAL05]
      ,[REFVAL06]
      ,[REFVAL07]
      ,[REFVAL08]
      ,[REFVAL09]
      ,[REFVAL10]
      ,[CHAR01]
      ,[CHAR02]
      ,[CHAR03]
      ,[CHAR04]
      ,[CHAR05]
      ,[CHAR06]
      ,[CHAR07]
      ,[CHAR08]
      ,[CHAR09]
      ,[CHAR10]
      ,[CHAR11]
      ,[CHAR12]
      ,[CHAR13]
      ,[CHAR14]
      ,[CHAR15]
      ,[CHAR16]
      ,[CHAR17]
      ,[CHAR18]
      ,[CHAR19]
      ,[CHAR20]
      ,[CHAR21]
      ,[CHAR22]
      ,[CHAR23]
      ,[CHAR24]
      ,[CHAR25]
      ,[CHAR26]
      ,[CHAR27]
      ,[CHAR28]
      ,[CHAR29]
      ,[CHAR30]
      ,[CHAR31]
      ,[CHAR32]
      ,[CHAR33]
      ,[CHAR34]
      ,[CHAR35]
      ,[CHAR36]
      ,[CHAR37]
      ,[CHAR38]
      ,[CHAR39]
      ,[CHAR40]
      ,[CHAR41]
      ,[CHAR42]
      ,[CHAR43]
      ,[CHAR44]
      ,[CHAR45]
      ,[CHAR46]
      ,[CHAR47]
      ,[CHAR48]
      ,[CHAR49]
      ,[CHAR50]
      ,[NUM01]
      ,[NUM02]
      ,[NUM03]
      ,[NUM04]
      ,[NUM05]
      ,[NUM06]
      ,[NUM07]
      ,[NUM08]
      ,[NUM09]
      ,[NUM10]
      ,[DATE01]
      ,[DATE02]
      ,[DATE03]
      ,[DATE04]
      ,[DATE05]
      ,[DATE06]
  FROM [CMS_KBANK].[dbo].[D_SCHEDULETRANSFER]
  WHERE CAST(DVALUEDT AS date) < CAST(GETDATE() as date)
)
-- Insert the selected records into R_LOGTRAN and also delete from D_LOGTRAN
DELETE CTE_Transaction
OUTPUT 
       deleted.[STMREF]
      ,deleted.[TXDT]
      ,deleted.[TXREFID]
      ,deleted.[SYSTEMID]
      ,deleted.[SOURCEREF]
      ,deleted.[DESREF]
      ,deleted.[USRID]
      ,deleted.[USRAPPR]
      ,deleted.[NEXTAPPR]
      ,deleted.[SERVICEID]
      ,deleted.[SERVICECD]
      ,deleted.[TRANCODE]
      ,deleted.[TXCODE]
      ,deleted.[BCODE]
      ,deleted.[WFCODE]
      ,deleted.[TXCHANNEL]
      ,deleted.[PAYREFNO]
      ,deleted.[TXUPDATEDT]
      ,deleted.[DVALUEDT]
      ,deleted.[BANKID]
      ,deleted.[BRANCHCD]
      ,deleted.[SWIFTCODE]
      ,deleted.[NOTIFMAIL]
      ,deleted.[INVREF]
      ,deleted.[INVCODE]
      ,deleted.[MERCHANTID]
      ,deleted.[CATID]
      ,deleted.[ID]
      ,deleted.[CUSCODE]
      ,deleted.[CUSMOBILE]
      ,deleted.[BACCDR]
      ,deleted.[BACCCR]
      ,deleted.[BILLAMT]
      ,deleted.[CCYID]
      ,deleted.[INCACNO]
      ,deleted.[FEECODE]
      ,deleted.[FEEVAL]
      ,deleted.[ERRCODE]
      ,deleted.[TRANTYPE]
      ,deleted.[ISOFFLINETRN]
      ,deleted.[ISONLINETRN]
      ,deleted.[RSTS]
      ,deleted.[TXSTS]
      ,deleted.[STS]
      ,deleted.[WFSTS]
      ,deleted.[ISOTP]
      ,deleted.[ISVCH]
      ,deleted.[ISSMS]
      ,deleted.[ISEMAIL]
      ,deleted.[REFVAL01]
      ,deleted.[REFVAL02]
      ,deleted.[REFVAL03]
      ,deleted.[REFVAL04]
      ,deleted.[REFVAL05]
      ,deleted.[REFVAL06]
      ,deleted.[REFVAL07]
      ,deleted.[REFVAL08]
      ,deleted.[REFVAL09]
      ,deleted.[REFVAL10]
      ,deleted.[CHAR01]
      ,deleted.[CHAR02]
      ,deleted.[CHAR03]
      ,deleted.[CHAR04]
      ,deleted.[CHAR05]
      ,deleted.[CHAR06]
      ,deleted.[CHAR07]
      ,deleted.[CHAR08]
      ,deleted.[CHAR09]
      ,deleted.[CHAR10]
      ,deleted.[CHAR11]
      ,deleted.[CHAR12]
      ,deleted.[CHAR13]
      ,deleted.[CHAR14]
      ,deleted.[CHAR15]
      ,deleted.[CHAR16]
      ,deleted.[CHAR17]
      ,deleted.[CHAR18]
      ,deleted.[CHAR19]
      ,deleted.[CHAR20]
      ,deleted.[CHAR21]
      ,deleted.[CHAR22]
      ,deleted.[CHAR23]
      ,deleted.[CHAR24]
      ,deleted.[CHAR25]
      ,deleted.[CHAR26]
      ,deleted.[CHAR27]
      ,deleted.[CHAR28]
      ,deleted.[CHAR29]
      ,deleted.[CHAR30]
      ,deleted.[CHAR31]
      ,deleted.[CHAR32]
      ,deleted.[CHAR33]
      ,deleted.[CHAR34]
      ,deleted.[CHAR35]
      ,deleted.[CHAR36]
      ,deleted.[CHAR37]
      ,deleted.[CHAR38]
      ,deleted.[CHAR39]
      ,deleted.[CHAR40]
      ,deleted.[CHAR41]
      ,deleted.[CHAR42]
      ,deleted.[CHAR43]
      ,deleted.[CHAR44]
      ,deleted.[CHAR45]
      ,deleted.[CHAR46]
      ,deleted.[CHAR47]
      ,deleted.[CHAR48]
      ,deleted.[CHAR49]
      ,deleted.[CHAR50]
      ,deleted.[NUM01]
      ,deleted.[NUM02]
      ,deleted.[NUM03]
      ,deleted.[NUM04]
      ,deleted.[NUM05]
      ,deleted.[NUM06]
      ,deleted.[NUM07]
      ,deleted.[NUM08]
      ,deleted.[NUM09]
      ,deleted.[NUM10]
      ,deleted.[DATE01]
      ,deleted.[DATE02]
      ,deleted.[DATE03]
      ,deleted.[DATE04]
      ,deleted.[DATE05]
      ,deleted.[DATE06]
INTO R_SCHEDULETRANSFER;

-- Capture how many rows were moved
SET @MovedRowCount = @@ROWCOUNT;

-- Insert audit log
INSERT INTO dbo.D_CLEANLOG(
	TXDT,
	DVALUEDT,
	TXCODE,
	FROM_TABLE,
	TO_TABLE,
	RSQUERY,
	RESULT,
	LOGMSG,
	STATUS
)
VALUES (
	GETDATE(),
	CAST(GETDATE()-1 AS date),
	''MOV_HIS_LOG'',
	''D_SCHEDULETRANSFER'',
	''R_SCHEDULETRANSFER'',
	@MovedRowCount,
	CONCAT(''Move Data from D_SCHEDULETRANSFER to R_SCHEDULETRANSFER with RowCount '',@MovedRowCount),
	CONCAT(''{"DATE":"'',CAST(GETUTCDATE() AS date),''","DESC":"MOVE TABLE HIS","TXDT":"'',CAST(GETDATE()-1 AS date),''"}''),
	''C''
);

COMMIT TRANSACTION;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_MOV_MAIL_OUT_HIS_EXEC]    Script Date: 6/29/2025 8:27:08 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_MOV_MAIL_OUT_HIS_EXEC', 
		@step_id=8, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_MOV_MAIL_OUT_HIS_EXEC

USE [CMS_KBANK]
GO

-- Declare variable to store row count
DECLARE @MovedRowCount INT;

-- Move Historical Data
BEGIN TRANSACTION;

-- Insert the data into SYSUSERLOG from SYSUSERLOGHIS based on the conditions
;WITH CTE_Transaction AS (
       SELECT 
       [TXDT]
      ,[TXREFID]
      ,[CUSCODE]
      ,[CUSMOBILE]
      ,[MAILINFO]
      ,[MAILSTS]
      ,[SENTDT]
      ,[EXPIREDT]
	  ,[ID]
  FROM [CMS_KBANK].[dbo].[D_MAILOUT]
  WHERE CAST(TXDT AS date) < CAST(GETDATE() as date)
)
-- Insert the selected records into R_LOGTRAN and also delete from D_LOGTRAN
DELETE CTE_Transaction
OUTPUT 
       deleted.[TXDT]
      ,deleted.[TXREFID]
      ,deleted.[CUSCODE]
      ,deleted.[CUSMOBILE]
      ,deleted.[MAILINFO]
      ,deleted.[MAILSTS]
      ,deleted.[SENTDT]
      ,deleted.[EXPIREDT]
	  ,deleted.[ID]
INTO R_MAILOUT;

-- Capture how many rows were moved
SET @MovedRowCount = @@ROWCOUNT;

-- Insert audit log
INSERT INTO dbo.D_CLEANLOG(
	TXDT,
	DVALUEDT,
	TXCODE,
	FROM_TABLE,
	TO_TABLE,
	RSQUERY,
	RESULT,
	LOGMSG,
	STATUS
)
VALUES (
	GETDATE(),
	CAST(GETDATE()-1 AS date),
	''MOV_HIS_LOG'',
	''D_MAILOUT'',
	''R_MAILOUT'',
	@MovedRowCount,
	CONCAT(''Move Data from D_MAILOUT to R_MAILOUT with RowCount '',@MovedRowCount),
	CONCAT(''{"DATE":"'',CAST(GETUTCDATE() AS date),''","DESC":"MOVE TABLE HIS","TXDT":"'',CAST(GETDATE()-1 AS date),''"}''),
	''C''
);

COMMIT TRANSACTION;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_MOV_OTP_OUT_HIS_EXEC]    Script Date: 6/29/2025 8:27:08 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_MOV_OTP_OUT_HIS_EXEC', 
		@step_id=9, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_MOV_OTP_OUT_HIS_EXEC

USE [CMS_KBANK]
GO

-- Declare variable to store row count
DECLARE @MovedRowCount INT;

-- Move Historical Data
BEGIN TRANSACTION;

-- Insert the data into SYSUSERLOG from SYSUSERLOGHIS based on the conditions
;WITH CTE_Transaction AS (
       SELECT 
       [TXDT]
      ,[TXREFID]
      ,[CUSCODE]
      ,[CUSMOBILE]
      ,[OTPINFO]
      ,[OTPSTS]
      ,[SENTDT]
      ,[EXPIREDT]
	  ,[ID]
  FROM [CMS_KBANK].[dbo].[D_OTPOUT]
  WHERE CAST(TXDT AS date) < CAST(GETDATE() as date)
)
-- Insert the selected records into R_LOGTRAN and also delete from D_LOGTRAN
DELETE CTE_Transaction
OUTPUT 
       deleted.[TXDT]
      ,deleted.[TXREFID]
      ,deleted.[CUSCODE]
      ,deleted.[CUSMOBILE]
      ,deleted.[OTPINFO]
      ,deleted.[OTPSTS]
      ,deleted.[SENTDT]
      ,deleted.[EXPIREDT]
	  ,deleted.[ID]
INTO R_OTPOUT;

-- Capture how many rows were moved
SET @MovedRowCount = @@ROWCOUNT;

-- Insert audit log
INSERT INTO dbo.D_CLEANLOG(
	TXDT,
	DVALUEDT,
	TXCODE,
	FROM_TABLE,
	TO_TABLE,
	RSQUERY,
	RESULT,
	LOGMSG,
	STATUS
)
VALUES (
	GETDATE(),
	CAST(GETDATE()-1 AS date),
	''MOV_HIS_LOG'',
	''D_OTPOUT'',
	''R_OTPOUT'',
	@MovedRowCount,
	CONCAT(''Move Data from D_OTPOUT to R_OTPOUT with RowCount '',@MovedRowCount),
	CONCAT(''{"DATE":"'',CAST(GETUTCDATE() AS date),''","DESC":"MOVE TABLE HIS","TXDT":"'',CAST(GETDATE()-1 AS date),''"}''),
	''C''
);

COMMIT TRANSACTION;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_MOV_SMS_OUT_HIS_EXEC]    Script Date: 6/29/2025 8:27:08 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_MOV_SMS_OUT_HIS_EXEC', 
		@step_id=10, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_MOV_SMS_OUT_HIS_EXEC

USE [CMS_KBANK]
GO

-- Declare variable to store row count
DECLARE @MovedRowCount INT;

-- Move Historical Data
BEGIN TRANSACTION;

-- Insert the data into SYSUSERLOG from SYSUSERLOGHIS based on the conditions
;WITH CTE_Transaction AS (
       SELECT 
       [TXDT]
      ,[TXREFID]
      ,[CUSCODE]
      ,[CUSMOBILE]
      ,[SMSINFO]
      ,[STS]
      ,[SENTDT]
      ,[EXPIREDT]
	  ,[ID]
  FROM [CMS_KBANK].[dbo].[D_SMSOUT]
  WHERE CAST(TXDT AS date) < CAST(GETDATE() as date)
)
-- Insert the selected records into R_LOGTRAN and also delete from D_LOGTRAN
DELETE CTE_Transaction
OUTPUT 
       deleted.[TXDT]
      ,deleted.[TXREFID]
      ,deleted.[CUSCODE]
      ,deleted.[CUSMOBILE]
      ,deleted.[SMSINFO]
      ,deleted.[STS]
      ,deleted.[SENTDT]
      ,deleted.[EXPIREDT]
	  ,deleted.[ID]
INTO R_SMSOUT;

-- Capture how many rows were moved
SET @MovedRowCount = @@ROWCOUNT;

-- Insert audit log
INSERT INTO dbo.D_CLEANLOG(
	TXDT,
	DVALUEDT,
	TXCODE,
	FROM_TABLE,
	TO_TABLE,
	RSQUERY,
	RESULT,
	LOGMSG,
	STATUS
)
VALUES (
	GETDATE(),
	CAST(GETDATE()-1 AS date),
	''MOV_HIS_LOG'',
	''D_SMSOUT'',
	''R_SMSOUT'',
	@MovedRowCount,
	CONCAT(''Move Data from D_SMSOUT to R_SMSOUT with RowCount '',@MovedRowCount),
	CONCAT(''{"DATE":"'',CAST(GETUTCDATE() AS date),''","DESC":"MOVE TABLE HIS","TXDT":"'',CAST(GETDATE()-1 AS date),''"}''),
	''C''
);

COMMIT TRANSACTION;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_SYNC_SCH_INFO_EXEC]    Script Date: 6/29/2025 8:27:08 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_SYNC_SCH_INFO_EXEC', 
		@step_id=11, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_SYNC_SCH_INFO_EXEC
USE [CMS_KBANK]
GO

-- delete old data
TRUNCATE TABLE D_SCHEDULEINFO;


-- insert new data
BEGIN TRAN;
INSERT INTO D_SCHEDULEINFO
(SCHEDULEID,SCHEDULECD,NAME,JOBID,JOBNAME,JOBSTEP,STEPORD,STEPCOMMAND,SCHVERSION,STATUS,MAKER,APPROVER,CREATEDT)
SELECT 
A.job_id,A.name,A.description,B.step_uid,B.step_name,B.step_id,B.step_id,B.command,A.version_number,''A'',''sems'',''sems'',
GETUTCDATE()
FROM
msdb.dbo.sysjobs A Join msdb.dbo.sysjobsteps B
ON A.job_id = B.job_id
WHERE A.name LIKE ''B_%''
ORDER BY A.job_id,B.step_id
COMMIT TRAN;
', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_UPD_CAL_CDT_EXEC]    Script Date: 6/29/2025 8:27:08 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_UPD_CAL_CDT_EXEC', 
		@step_id=12, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_UPD_CURDT_EXEC
USE [CMS_KBANK]
GO

-- upd old day
BEGIN TRAN;
UPDATE D_CALENDAR
SET ISCURRDT = ''N''
WHERE ISCURRDT = ''Y''
AND SEQDATE < CAST(GETDATE() as date)
COMMIT TRAN;

-- upd cur day
BEGIN TRAN;
UPDATE D_CALENDAR
SET ISCURRDT = ''Y''
WHERE ISCURRDT = ''N''
AND SEQDATE = CAST(GETDATE() as date)
COMMIT TRAN;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [J_UPD_HDY_CDT_EXEC]    Script Date: 6/29/2025 8:27:09 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'J_UPD_HDY_CDT_EXEC', 
		@step_id=13, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- J_UPD_CUR_DT_EXEC
USE [CMS_KBANK]
GO

-- upd old day
BEGIN TRAN;
UPDATE D_HOLIDAY
SET ISCURRDT = ''N''
WHERE ISCURRDT = ''Y''
AND SEQDT < CAST(GETDATE() as date)
COMMIT TRAN;

-- upd cur day
BEGIN TRAN;
UPDATE D_HOLIDAY
SET ISCURRDT = ''Y''
WHERE ISCURRDT = ''N''
AND SEQDT = CAST(GETDATE() as date)
COMMIT TRAN;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'B_CLEAN_LOG_EXEC', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20250601, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'508bc5b3-8a07-4b46-ac31-fa1b072b0385'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


