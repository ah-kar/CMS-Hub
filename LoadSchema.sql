USE [CMS_KBANK]
GO
/****** Object:  Table [dbo].[ACCOUNTCHART_EX]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNTCHART_EX](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[ACCODE] [varchar](50) NULL,
	[ACNO] [varchar](50) NULL,
	[ACDESC] [varchar](100) NULL,
	[ACSTS] [varchar](1) NULL,
	[ACSIGN] [varchar](50) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_ACCOUNTCHART_EX] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACQUIRINGBANK_EX]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACQUIRINGBANK_EX](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[BANKCD] [varchar](50) NULL,
	[ID] [varchar](50) NULL,
	[ROWID] [varchar](50) NULL,
 CONSTRAINT [PK_ACQUIRINGBANK_EX] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_BENEFDPTACT]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_BENEFDPTACT](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[ACNO] [varchar](50) NULL,
	[BRANCHCODE] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[BANKID] [varchar](50) NULL,
	[ACHOLDBRN] [varchar](50) NULL,
	[ACSTS] [varchar](1) NULL,
	[OPENDT] [datetime2](7) NULL,
	[SYNCTOKEN] [varchar](500) NULL,
	[ACCAT] [varchar](50) NULL,
	[SYNCSTS] [varchar](1) NULL,
	[SYNCDT] [datetime2](7) NULL,
	[ISOPNMB] [varchar](1) NULL,
	[ISOPNIB] [varchar](1) NULL,
	[NOTIFCHANNEL] [varchar](50) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
	[MIGSTS] [varchar](1) NULL,
	[REMARK] [varchar](500) NULL,
 CONSTRAINT [D_BENEFDPTACT_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_D_BENEFDPTACT_ACINFO] UNIQUE NONCLUSTERED 
(
	[ACNO] ASC,
	[CUSCODE] ASC,
	[BRANCHCODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_BILLINFO]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_BILLINFO](
	[recid] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[fileid] [varchar](50) NULL,
	[importref] [varchar](50) NULL,
	[fileref] [varchar](50) NULL,
	[filetoken] [varchar](500) NULL,
	[importdt] [datetime2](7) NULL,
	[filedt] [datetime2](7) NULL,
	[expiredt] [datetime2](7) NULL,
	[filetype] [varchar](50) NULL,
	[importtype] [varchar](50) NULL,
	[consumerid] [varchar](50) NULL,
	[cosumerref] [varchar](50) NULL,
	[billref] [varchar](50) NULL,
	[billsts] [varchar](50) NULL,
	[billamt] [numeric](19, 6) NULL,
	[refval01] [varchar](500) NULL,
	[refval02] [varchar](500) NULL,
	[refval03] [varchar](500) NULL,
	[refval04] [varchar](500) NULL,
	[refval05] [varchar](500) NULL,
	[char01] [varchar](200) NULL,
	[char02] [varchar](200) NULL,
	[char03] [varchar](200) NULL,
	[char04] [varchar](200) NULL,
	[char05] [varchar](200) NULL,
	[char06] [varchar](200) NULL,
	[char07] [varchar](200) NULL,
	[char08] [varchar](200) NULL,
	[char09] [varchar](200) NULL,
	[char10] [varchar](200) NULL,
	[char11] [varchar](200) NULL,
	[char12] [varchar](200) NULL,
	[char13] [varchar](200) NULL,
	[char14] [varchar](200) NULL,
	[char15] [varchar](200) NULL,
	[char16] [varchar](200) NULL,
	[char17] [varchar](200) NULL,
	[char18] [varchar](200) NULL,
	[char19] [varchar](200) NULL,
	[char20] [varchar](200) NULL,
	[num01] [numeric](19, 6) NULL,
	[num02] [numeric](19, 6) NULL,
	[num03] [numeric](19, 6) NULL,
	[num04] [numeric](19, 6) NULL,
	[num05] [numeric](19, 6) NULL,
	[num06] [numeric](19, 6) NULL,
	[num07] [numeric](19, 6) NULL,
	[num08] [numeric](19, 6) NULL,
	[num09] [numeric](19, 6) NULL,
	[num10] [numeric](19, 6) NULL,
	[date01] [datetime2](7) NULL,
	[date02] [datetime2](7) NULL,
	[date03] [datetime2](7) NULL,
	[date04] [datetime2](7) NULL,
 CONSTRAINT [D_BILLINFO_PKEY] PRIMARY KEY CLUSTERED 
(
	[recid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_D_BILLINFO_CHAR03] UNIQUE NONCLUSTERED 
(
	[recid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_BRANCHCODE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_BRANCHCODE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[BRANCHID] [varchar](50) NULL,
	[BRANCHCODE] [varchar](50) NULL,
	[BRANCHNAME] [varchar](100) NULL,
	[STATUS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_BRANCHCODE] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_CALENDAR]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_CALENDAR](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[SEQDATE] [date] NULL,
	[SEQDAY] [int] NULL,
	[SEQDAYSUFFIX] [char](2) NULL,
	[SEQDAYNAME] [varchar](20) NULL,
	[SEQDAYOFWEEK] [int] NULL,
	[SEQDAYOFWEEKINMONTH] [tinyint] NULL,
	[SEQDAYOFYEAR] [int] NULL,
	[ISWEEKEND] [bit] NULL,
	[SEQWEEK] [int] NULL,
	[SEQISOWEEK] [int] NULL,
	[SEQFIRSTOFWEEK] [date] NULL,
	[SEQLASTOFWEEK] [date] NULL,
	[SEQWEEKOFMONTH] [tinyint] NULL,
	[SEQMONTH] [int] NULL,
	[SEQMONTHNAME] [varchar](20) NULL,
	[SEQFIRSTOFMONTH] [date] NULL,
	[SEQLASTOFMONTH] [date] NULL,
	[SEQFIRSTOFNEXTMONTH] [date] NULL,
	[SEQLASTOFNEXTMONTH] [date] NULL,
	[SEQQUARTER] [int] NULL,
	[SEQFIRSTOFQUARTER] [date] NULL,
	[SEQLASTOFQUARTER] [date] NULL,
	[SEQYEAR] [int] NULL,
	[SEQISOYEAR] [int] NULL,
	[SEQFIRSTOFYEAR] [date] NULL,
	[SEQLASTOFYEAR] [date] NULL,
	[ISLEAPYEAR] [bit] NULL,
	[HAS53WEEKS] [bit] NULL,
	[HAS53ISOWEEKS] [bit] NULL,
	[MMYYYY] [char](6) NULL,
	[STYLE101] [varchar](10) NULL,
	[STYLE103] [varchar](10) NULL,
	[STYLE112] [char](8) NULL,
	[STYLE120] [varchar](10) NULL,
	[ISCURRDT] [varchar](1) NULL,
 CONSTRAINT [PK_D_CALENDAR] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_CASHACNO]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_CASHACNO](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[ACNO] [varchar](50) NULL,
	[ACCODE] [varchar](50) NULL,
	[ACDESC] [varchar](100) NULL,
	[ACSTS] [varchar](1) NULL,
	[ACSIGN] [varchar](50) NULL,
 CONSTRAINT [PK_D_CASHACNO] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_CHANNEL]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_CHANNEL](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[CHANNELID] [varchar](50) NULL,
	[CHANNELCODE] [varchar](50) NULL,
	[CHANNELNAME] [varchar](200) NULL,
	[CHANNELSTS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_CHANNEL] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_CLEANLOG]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_CLEANLOG](
	[RECID] [bigint] IDENTITY(1,1) NOT NULL,
	[TXDT] [datetime2](0) NULL,
	[DVALUEDT] [datetime2](0) NULL,
	[TXCODE] [varchar](50) NULL,
	[FROM_TABLE] [varchar](100) NULL,
	[TO_TABLE] [varchar](100) NULL,
	[RSQUERY] [varchar](50) NULL,
	[RESULT] [varchar](500) NULL,
	[LOGMSG] [varchar](500) NULL,
	[STATUS] [varchar](1) NULL,
	[LOGREF] [varchar](50) NULL,
 CONSTRAINT [D_CLEANLOG_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_CODETYPE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_CODETYPE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[CODEID] [varchar](50) NULL,
	[CODETYPE] [varchar](50) NULL,
	[CODESUBTYPE] [varchar](50) NULL,
	[CODEVAL] [varchar](50) NULL,
	[CODENAME] [varchar](200) NULL,
	[CODEIDX] [varchar](50) NULL,
	[CODEGROUP] [varchar](50) NULL,
	[CODESTS] [varchar](1) NULL,
	[ROWID] [varchar](50) NULL,
 CONSTRAINT [PK_D_CODETYPE] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_COUNTRY]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_COUNTRY](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[COUNTRYID] [varchar](50) NULL,
	[COUNTRYCD] [varchar](50) NULL,
	[COUNTRYNAME] [varchar](200) NULL,
	[COUNTRYSTS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_COUNTRY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_CURRENCY]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_CURRENCY](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[CURRENCYID] [varchar](50) NULL,
	[CURRENCYCD] [varchar](50) NULL,
	[CURRENCYNAME] [varchar](200) NULL,
	[CURRENCYSTS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_CURRENCY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_DEPOSITCATALOG]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_DEPOSITCATALOG](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[CATALOGID] [varchar](50) NULL,
	[CATALOGCD] [varchar](50) NULL,
	[CATALOGNAME] [varchar](200) NULL,
	[CATALOGSTS] [varchar](1) NULL,
	[ACMASK] [varchar](100) NULL,
	[ACFORMAT] [varchar](100) NULL,
	[ACEXT] [varchar](100) NULL,
	[ACSIGN] [varchar](100) NULL,
	[CCYID] [varchar](50) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_DEPOSITCATALOG] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_DIRECTDEBIT]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_DIRECTDEBIT](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[STMREF] [varchar](50) NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[SYSTEMID] [varchar](50) NULL,
	[SOURCEREF] [varchar](50) NULL,
	[DESREF] [varchar](50) NULL,
	[USRID] [varchar](50) NULL,
	[USRAPPR] [varchar](50) NULL,
	[NEXTAPPR] [varchar](50) NULL,
	[SERVICEID] [varchar](50) NULL,
	[SERVICECD] [varchar](50) NULL,
	[TRANCODE] [varchar](50) NULL,
	[TXCODE] [varchar](50) NULL,
	[BCODE] [varchar](50) NULL,
	[WFCODE] [varchar](50) NULL,
	[TXCHANNEL] [varchar](50) NULL,
	[PAYREFNO] [varchar](50) NULL,
	[TXUPDATEDT] [datetime2](7) NULL,
	[DVALUEDT] [datetime2](7) NULL,
	[BANKID] [varchar](50) NULL,
	[BRANCHCD] [varchar](50) NULL,
	[SWIFTCODE] [varchar](50) NULL,
	[NOTIFMAIL] [varchar](50) NULL,
	[INVREF] [varchar](50) NULL,
	[INVCODE] [varchar](50) NULL,
	[MERCHANTID] [varchar](50) NULL,
	[CATID] [varchar](50) NULL,
	[ID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[BACCDR] [varchar](50) NULL,
	[BACCCR] [varchar](50) NULL,
	[BILLAMT] [numeric](19, 6) NULL,
	[CCYID] [varchar](50) NULL,
	[INCACNO] [varchar](50) NULL,
	[FEECODE] [varchar](200) NULL,
	[FEEVAL] [varchar](200) NULL,
	[ERRCODE] [varchar](100) NULL,
	[TRANTYPE] [varchar](50) NULL,
	[ISOFFLINETRN] [varchar](1) NULL,
	[ISONLINETRN] [varchar](1) NULL,
	[RSTS] [varchar](1) NULL,
	[TXSTS] [varchar](1) NULL,
	[STS] [varchar](1) NULL,
	[WFSTS] [varchar](1) NULL,
	[ISOTP] [varchar](1) NULL,
	[ISVCH] [varchar](1) NULL,
	[ISSMS] [varchar](1) NULL,
	[ISEMAIL] [varchar](1) NULL,
	[REFVAL01] [varchar](500) NULL,
	[REFVAL02] [varchar](500) NULL,
	[REFVAL03] [varchar](500) NULL,
	[REFVAL04] [varchar](500) NULL,
	[REFVAL05] [varchar](500) NULL,
	[REFVAL06] [varchar](500) NULL,
	[REFVAL07] [varchar](500) NULL,
	[REFVAL08] [varchar](500) NULL,
	[REFVAL09] [varchar](500) NULL,
	[REFVAL10] [varchar](500) NULL,
	[CHAR01] [varchar](200) NULL,
	[CHAR02] [varchar](200) NULL,
	[CHAR03] [varchar](200) NULL,
	[CHAR04] [varchar](200) NULL,
	[CHAR05] [varchar](200) NULL,
	[CHAR06] [varchar](200) NULL,
	[CHAR07] [varchar](200) NULL,
	[CHAR08] [varchar](200) NULL,
	[CHAR09] [varchar](200) NULL,
	[CHAR10] [varchar](200) NULL,
	[CHAR11] [varchar](200) NULL,
	[CHAR12] [varchar](200) NULL,
	[CHAR13] [varchar](200) NULL,
	[CHAR14] [varchar](200) NULL,
	[CHAR15] [varchar](200) NULL,
	[CHAR16] [varchar](200) NULL,
	[CHAR17] [varchar](200) NULL,
	[CHAR18] [varchar](200) NULL,
	[CHAR19] [varchar](200) NULL,
	[CHAR20] [varchar](200) NULL,
	[CHAR21] [varchar](200) NULL,
	[CHAR22] [varchar](200) NULL,
	[CHAR23] [varchar](200) NULL,
	[CHAR24] [varchar](200) NULL,
	[CHAR25] [varchar](200) NULL,
	[CHAR26] [varchar](200) NULL,
	[CHAR27] [varchar](200) NULL,
	[CHAR28] [varchar](200) NULL,
	[CHAR29] [varchar](200) NULL,
	[CHAR30] [varchar](200) NULL,
	[CHAR31] [varchar](200) NULL,
	[CHAR32] [varchar](200) NULL,
	[CHAR33] [varchar](200) NULL,
	[CHAR34] [varchar](200) NULL,
	[CHAR35] [varchar](200) NULL,
	[CHAR36] [varchar](200) NULL,
	[CHAR37] [varchar](200) NULL,
	[CHAR38] [varchar](200) NULL,
	[CHAR39] [varchar](200) NULL,
	[CHAR40] [varchar](200) NULL,
	[CHAR41] [varchar](200) NULL,
	[CHAR42] [varchar](200) NULL,
	[CHAR43] [varchar](200) NULL,
	[CHAR44] [varchar](200) NULL,
	[CHAR45] [varchar](200) NULL,
	[CHAR46] [varchar](200) NULL,
	[CHAR47] [varchar](200) NULL,
	[CHAR48] [varchar](200) NULL,
	[CHAR49] [varchar](200) NULL,
	[CHAR50] [varchar](200) NULL,
	[NUM01] [numeric](19, 6) NULL,
	[NUM02] [numeric](19, 6) NULL,
	[NUM03] [numeric](19, 6) NULL,
	[NUM04] [numeric](19, 6) NULL,
	[NUM05] [numeric](19, 6) NULL,
	[NUM06] [numeric](19, 6) NULL,
	[NUM07] [numeric](19, 6) NULL,
	[NUM08] [numeric](19, 6) NULL,
	[NUM09] [numeric](19, 6) NULL,
	[NUM10] [numeric](19, 6) NULL,
	[DATE01] [datetime2](7) NULL,
	[DATE02] [datetime2](7) NULL,
	[DATE03] [datetime2](7) NULL,
	[DATE04] [datetime2](7) NULL,
	[DATE05] [datetime2](7) NULL,
	[DATE06] [datetime2](7) NULL,
 CONSTRAINT [D_DIRECTDEBIT_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_D_DIRECTDEBIT_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_ERRORCODE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_ERRORCODE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[ERRORID] [varchar](50) NULL,
	[ERRORCD] [varchar](50) NULL,
	[ERRORDESC] [varchar](500) NULL,
	[ERRORTYPE] [varchar](50) NULL,
	[APPLIEDON] [varchar](200) NULL,
	[APPLIEDWHEN] [varchar](200) NULL,
	[ROWID] [varchar](50) NULL,
	[CODESTS] [varchar](1) NULL,
 CONSTRAINT [PK_D_ERRORCODE] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_FEECODE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_FEECODE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[FEEID] [varchar](50) NULL,
	[FEECODE] [varchar](50) NULL,
	[FEETYPE] [varchar](50) NULL,
	[FEENAME] [varchar](200) NULL,
	[FEESTS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_FEECODE] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_FEEDEF]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_FEEDEF](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[FEEID] [varchar](50) NULL,
	[FEECODE] [varchar](50) NULL,
	[FEECCY] [varchar](50) NULL,
	[FEEAMT] [numeric](18, 2) NULL,
	[MARGIN_VAL] [numeric](18, 2) NULL,
	[MAX_VAL] [numeric](18, 2) NULL,
	[MIN_VAL] [numeric](18, 2) NULL,
	[DISCOUNT] [numeric](18, 2) NULL,
	[ISPERCENT] [varchar](50) NULL,
	[PERCENTVAL] [numeric](18, 2) NULL,
	[FEETYPE] [varchar](50) NULL,
	[FEEFORMULA] [varchar](500) NULL,
	[APPLIEDON] [varchar](500) NULL,
	[APPLIEDWHEN] [varchar](500) NULL,
	[FEESTS] [varchar](50) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
	[MODIFYDT] [datetime2](7) NULL,
	[ROWID] [varchar](50) NULL,
 CONSTRAINT [PK_D_FEEDEF] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_FEETYPE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_FEETYPE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TYPEID] [varchar](50) NULL,
	[TYPECD] [varchar](50) NULL,
	[TYPENAME] [varchar](200) NULL,
	[TYPESTS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_FEETYPE] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_FILEINFO]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_FILEINFO](
	[recid] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[fileid] [varchar](50) NULL,
	[filetype] [varchar](50) NULL,
	[importdt] [datetime2](7) NULL,
	[filedt] [datetime2](7) NULL,
	[billtype] [varchar](50) NULL,
	[importsts] [varchar](50) NULL,
	[importlinecnt] [numeric](19, 0) NULL,
	[filests] [varchar](50) NULL,
 CONSTRAINT [D_FILEINFO_PKEY] PRIMARY KEY CLUSTERED 
(
	[recid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_D_FILEINFO_FILEID] UNIQUE NONCLUSTERED 
(
	[fileid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_FILETYPE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_FILETYPE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TYPEID] [varchar](50) NULL,
	[TYPECD] [varchar](50) NULL,
	[TYPENAME] [varchar](200) NULL,
	[TYPESTS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_FILETYPE] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_HOLIDAY]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_HOLIDAY](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[SEQDT] [datetime2](7) NULL,
	[ISWEEKEND] [varchar](1) NULL,
	[ISHOLIDAY] [varchar](1) NULL,
	[REMARK] [varchar](200) NULL,
	[ISCURRDT] [varchar](1) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_HOLIDAY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_HUBSTM]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_HUBSTM](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[STMREF] [varchar](50) NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[SYSTEMID] [varchar](50) NULL,
	[SOURCEREF] [varchar](50) NULL,
	[DESREF] [varchar](50) NULL,
	[USRID] [varchar](50) NULL,
	[USRAPPR] [varchar](50) NULL,
	[NEXTAPPR] [varchar](50) NULL,
	[SERVICEID] [varchar](50) NULL,
	[SERVICECD] [varchar](50) NULL,
	[TRANCODE] [varchar](50) NULL,
	[TXCODE] [varchar](50) NULL,
	[BCODE] [varchar](50) NULL,
	[WFCODE] [varchar](50) NULL,
	[TXCHANNEL] [varchar](50) NULL,
	[PAYREFNO] [varchar](50) NULL,
	[TXUPDATEDT] [datetime2](7) NULL,
	[DVALUEDT] [datetime2](7) NULL,
	[BANKID] [varchar](50) NULL,
	[BRANCHCD] [varchar](50) NULL,
	[SWIFTCODE] [varchar](50) NULL,
	[NOTIFMAIL] [varchar](50) NULL,
	[INVREF] [varchar](50) NULL,
	[INVCODE] [varchar](50) NULL,
	[MERCHANTID] [varchar](50) NULL,
	[CATID] [varchar](50) NULL,
	[ID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[BACCDR] [varchar](50) NULL,
	[BACCCR] [varchar](50) NULL,
	[BILLAMT] [numeric](19, 6) NULL,
	[CCYID] [varchar](50) NULL,
	[INCACNO] [varchar](50) NULL,
	[FEECODE] [varchar](200) NULL,
	[FEEVAL] [varchar](200) NULL,
	[ERRCODE] [varchar](100) NULL,
	[TRANTYPE] [varchar](50) NULL,
	[ISOFFLINETRN] [varchar](1) NULL,
	[ISONLINETRN] [varchar](1) NULL,
	[RSTS] [varchar](1) NULL,
	[TXSTS] [varchar](1) NULL,
	[STS] [varchar](1) NULL,
	[WFSTS] [varchar](1) NULL,
	[ISOTP] [varchar](1) NULL,
	[ISVCH] [varchar](1) NULL,
	[ISSMS] [varchar](1) NULL,
	[ISEMAIL] [varchar](1) NULL,
	[REFVAL01] [varchar](500) NULL,
	[REFVAL02] [varchar](500) NULL,
	[REFVAL03] [varchar](500) NULL,
	[REFVAL04] [varchar](500) NULL,
	[REFVAL05] [varchar](500) NULL,
	[REFVAL06] [varchar](500) NULL,
	[REFVAL07] [varchar](500) NULL,
	[REFVAL08] [varchar](500) NULL,
	[REFVAL09] [varchar](500) NULL,
	[REFVAL10] [varchar](500) NULL,
	[CHAR01] [varchar](200) NULL,
	[CHAR02] [varchar](200) NULL,
	[CHAR03] [varchar](200) NULL,
	[CHAR04] [varchar](200) NULL,
	[CHAR05] [varchar](200) NULL,
	[CHAR06] [varchar](200) NULL,
	[CHAR07] [varchar](200) NULL,
	[CHAR08] [varchar](200) NULL,
	[CHAR09] [varchar](200) NULL,
	[CHAR10] [varchar](200) NULL,
	[CHAR11] [varchar](200) NULL,
	[CHAR12] [varchar](200) NULL,
	[CHAR13] [varchar](200) NULL,
	[CHAR14] [varchar](200) NULL,
	[CHAR15] [varchar](200) NULL,
	[CHAR16] [varchar](200) NULL,
	[CHAR17] [varchar](200) NULL,
	[CHAR18] [varchar](200) NULL,
	[CHAR19] [varchar](200) NULL,
	[CHAR20] [varchar](200) NULL,
	[CHAR21] [varchar](200) NULL,
	[CHAR22] [varchar](200) NULL,
	[CHAR23] [varchar](200) NULL,
	[CHAR24] [varchar](200) NULL,
	[CHAR25] [varchar](200) NULL,
	[CHAR26] [varchar](200) NULL,
	[CHAR27] [varchar](200) NULL,
	[CHAR28] [varchar](200) NULL,
	[CHAR29] [varchar](200) NULL,
	[CHAR30] [varchar](200) NULL,
	[CHAR31] [varchar](200) NULL,
	[CHAR32] [varchar](200) NULL,
	[CHAR33] [varchar](200) NULL,
	[CHAR34] [varchar](200) NULL,
	[CHAR35] [varchar](200) NULL,
	[CHAR36] [varchar](200) NULL,
	[CHAR37] [varchar](200) NULL,
	[CHAR38] [varchar](200) NULL,
	[CHAR39] [varchar](200) NULL,
	[CHAR40] [varchar](200) NULL,
	[CHAR41] [varchar](200) NULL,
	[CHAR42] [varchar](200) NULL,
	[CHAR43] [varchar](200) NULL,
	[CHAR44] [varchar](200) NULL,
	[CHAR45] [varchar](200) NULL,
	[CHAR46] [varchar](200) NULL,
	[CHAR47] [varchar](200) NULL,
	[CHAR48] [varchar](200) NULL,
	[CHAR49] [varchar](200) NULL,
	[CHAR50] [varchar](200) NULL,
	[NUM01] [numeric](19, 6) NULL,
	[NUM02] [numeric](19, 6) NULL,
	[NUM03] [numeric](19, 6) NULL,
	[NUM04] [numeric](19, 6) NULL,
	[NUM05] [numeric](19, 6) NULL,
	[NUM06] [numeric](19, 6) NULL,
	[NUM07] [numeric](19, 6) NULL,
	[NUM08] [numeric](19, 6) NULL,
	[NUM09] [numeric](19, 6) NULL,
	[NUM10] [numeric](19, 6) NULL,
	[DATE01] [datetime2](7) NULL,
	[DATE02] [datetime2](7) NULL,
	[DATE03] [datetime2](7) NULL,
	[DATE04] [datetime2](7) NULL,
	[DATE05] [datetime2](7) NULL,
	[DATE06] [datetime2](7) NULL,
 CONSTRAINT [D_HUBSTM_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_D_HUBSTM_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_HUBSTMW]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_HUBSTMW](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[STMREF] [varchar](50) NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[SYSTEMID] [varchar](50) NULL,
	[SOURCEREF] [varchar](50) NULL,
	[DESREF] [varchar](50) NULL,
	[USRID] [varchar](50) NULL,
	[USRAPPR] [varchar](50) NULL,
	[NEXTAPPR] [varchar](50) NULL,
	[SERVICEID] [varchar](50) NULL,
	[SERVICECD] [varchar](50) NULL,
	[TRANCODE] [varchar](50) NULL,
	[TXCODE] [varchar](50) NULL,
	[BCODE] [varchar](50) NULL,
	[WFCODE] [varchar](50) NULL,
	[TXCHANNEL] [varchar](50) NULL,
	[PAYREFNO] [varchar](50) NULL,
	[TXUPDATEDT] [datetime2](7) NULL,
	[DVALUEDT] [datetime2](7) NULL,
	[BANKID] [varchar](50) NULL,
	[BRANCHCD] [varchar](50) NULL,
	[SWIFTCODE] [varchar](50) NULL,
	[NOTIFMAIL] [varchar](50) NULL,
	[INVREF] [varchar](50) NULL,
	[INVCODE] [varchar](50) NULL,
	[MERCHANTID] [varchar](50) NULL,
	[CATID] [varchar](50) NULL,
	[ID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[BACCDR] [varchar](50) NULL,
	[BACCCR] [varchar](50) NULL,
	[BILLAMT] [numeric](19, 6) NULL,
	[CCYID] [varchar](50) NULL,
	[INCACNO] [varchar](50) NULL,
	[FEECODE] [varchar](200) NULL,
	[FEEVAL] [varchar](200) NULL,
	[ERRCODE] [varchar](100) NULL,
	[TRANTYPE] [varchar](50) NULL,
	[ISOFFLINETRN] [varchar](1) NULL,
	[ISONLINETRN] [varchar](1) NULL,
	[RSTS] [varchar](1) NULL,
	[TXSTS] [varchar](1) NULL,
	[STS] [varchar](1) NULL,
	[WFSTS] [varchar](1) NULL,
	[ISOTP] [varchar](1) NULL,
	[ISVCH] [varchar](1) NULL,
	[ISSMS] [varchar](1) NULL,
	[ISEMAIL] [varchar](1) NULL,
	[REFVAL01] [varchar](500) NULL,
	[REFVAL02] [varchar](500) NULL,
	[REFVAL03] [varchar](500) NULL,
	[REFVAL04] [varchar](500) NULL,
	[REFVAL05] [varchar](500) NULL,
	[REFVAL06] [varchar](500) NULL,
	[REFVAL07] [varchar](500) NULL,
	[REFVAL08] [varchar](500) NULL,
	[REFVAL09] [varchar](500) NULL,
	[REFVAL10] [varchar](500) NULL,
	[CHAR01] [varchar](200) NULL,
	[CHAR02] [varchar](200) NULL,
	[CHAR03] [varchar](200) NULL,
	[CHAR04] [varchar](200) NULL,
	[CHAR05] [varchar](200) NULL,
	[CHAR06] [varchar](200) NULL,
	[CHAR07] [varchar](200) NULL,
	[CHAR08] [varchar](200) NULL,
	[CHAR09] [varchar](200) NULL,
	[CHAR10] [varchar](200) NULL,
	[CHAR11] [varchar](200) NULL,
	[CHAR12] [varchar](200) NULL,
	[CHAR13] [varchar](200) NULL,
	[CHAR14] [varchar](200) NULL,
	[CHAR15] [varchar](200) NULL,
	[CHAR16] [varchar](200) NULL,
	[CHAR17] [varchar](200) NULL,
	[CHAR18] [varchar](200) NULL,
	[CHAR19] [varchar](200) NULL,
	[CHAR20] [varchar](200) NULL,
	[CHAR21] [varchar](200) NULL,
	[CHAR22] [varchar](200) NULL,
	[CHAR23] [varchar](200) NULL,
	[CHAR24] [varchar](200) NULL,
	[CHAR25] [varchar](200) NULL,
	[CHAR26] [varchar](200) NULL,
	[CHAR27] [varchar](200) NULL,
	[CHAR28] [varchar](200) NULL,
	[CHAR29] [varchar](200) NULL,
	[CHAR30] [varchar](200) NULL,
	[CHAR31] [varchar](200) NULL,
	[CHAR32] [varchar](200) NULL,
	[CHAR33] [varchar](200) NULL,
	[CHAR34] [varchar](200) NULL,
	[CHAR35] [varchar](200) NULL,
	[CHAR36] [varchar](200) NULL,
	[CHAR37] [varchar](200) NULL,
	[CHAR38] [varchar](200) NULL,
	[CHAR39] [varchar](200) NULL,
	[CHAR40] [varchar](200) NULL,
	[CHAR41] [varchar](200) NULL,
	[CHAR42] [varchar](200) NULL,
	[CHAR43] [varchar](200) NULL,
	[CHAR44] [varchar](200) NULL,
	[CHAR45] [varchar](200) NULL,
	[CHAR46] [varchar](200) NULL,
	[CHAR47] [varchar](200) NULL,
	[CHAR48] [varchar](200) NULL,
	[CHAR49] [varchar](200) NULL,
	[CHAR50] [varchar](200) NULL,
	[NUM01] [numeric](19, 6) NULL,
	[NUM02] [numeric](19, 6) NULL,
	[NUM03] [numeric](19, 6) NULL,
	[NUM04] [numeric](19, 6) NULL,
	[NUM05] [numeric](19, 6) NULL,
	[NUM06] [numeric](19, 6) NULL,
	[NUM07] [numeric](19, 6) NULL,
	[NUM08] [numeric](19, 6) NULL,
	[NUM09] [numeric](19, 6) NULL,
	[NUM10] [numeric](19, 6) NULL,
	[DATE01] [datetime2](7) NULL,
	[DATE02] [datetime2](7) NULL,
	[DATE03] [datetime2](7) NULL,
	[DATE04] [datetime2](7) NULL,
	[DATE05] [datetime2](7) NULL,
	[DATE06] [datetime2](7) NULL,
 CONSTRAINT [D_HUBSTMW_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_D_HUBSTMW_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_MAILOUT]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_MAILOUT](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[MAILINFO] [varchar](500) NULL,
	[MAILSTS] [varchar](1) NULL,
	[SENTDT] [datetime2](7) NULL,
	[EXPIREDT] [datetime2](7) NULL,
	[ID] [varchar](100) NULL,
 CONSTRAINT [D_MAILOUT_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_D_MAILOUT_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_MERCHANT]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_MERCHANT](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[MERCHANTID] [varchar](50) NULL,
	[MERCHANTCD] [varchar](50) NULL,
	[MERCHANTNAME] [varchar](200) NULL,
	[MERCHANTTYPE] [varchar](50) NULL,
	[STATUS] [varchar](1) NULL,
	[CCYID] [varchar](10) NULL,
	[ISFEEAPPLY] [varchar](1) NULL,
	[FEECODE] [varchar](200) NULL,
	[COUNTRY] [varchar](50) NULL,
	[REGION] [varchar](50) NULL,
	[REGISTERCD] [varchar](50) NULL,
	[REGISTERDT] [datetime2](7) NULL,
	[EMAIL] [varchar](50) NULL,
	[ADDRESS] [varchar](500) NULL,
	[CUSPHONE] [varchar](50) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
	[CUSCODE] [varchar](50) NULL,
 CONSTRAINT [PK_D_MERCHANT] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_MERCHANTSETTLE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_MERCHANTSETTLE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TXDT] [datetime2](7) NULL,
	[SETTLEDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[SERCODE] [varchar](50) NULL,
	[MERCHANTID] [varchar](50) NULL,
	[MERACNO] [varchar](50) NULL,
	[BILLAMT] [decimal](19, 6) NULL,
	[FEECODE] [varchar](50) NULL,
	[FEEAMT] [decimal](19, 6) NULL,
	[CCYID] [varchar](10) NULL,
	[TRANDESC] [varchar](500) NULL,
	[SETTLESTS] [varchar](1) NULL,
	[TXSTS] [varchar](1) NULL,
	[STS] [varchar](1) NULL,
	[CREATEDT] [datetime2](7) NULL,
	[ID] [varchar](100) NULL,
 CONSTRAINT [D_MERCHANTSETTLE_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_D_MERCHANTSETTLE_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_NATION]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_NATION](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[NATIONID] [varchar](50) NULL,
	[NATIONCD] [varchar](50) NULL,
	[NAME] [varchar](200) NULL,
	[NATIONSTS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_NATION] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_OTPOUT]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_OTPOUT](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[OTPINFO] [varchar](500) NULL,
	[OTPSTS] [varchar](1) NULL,
	[SENTDT] [datetime2](7) NULL,
	[EXPIREDT] [datetime2](7) NULL,
	[ID] [varchar](100) NULL,
 CONSTRAINT [D_OTPOUT_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_D_OTPOUT_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_SCHEDULEINFO]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_SCHEDULEINFO](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[SCHEDULEID] [varchar](50) NULL,
	[SCHEDULECD] [varchar](50) NULL,
	[NAME] [varchar](50) NULL,
	[JOBID] [varchar](50) NULL,
	[JOBNAME] [varchar](50) NULL,
	[JOBSTEP] [varchar](50) NULL,
	[STEPORD] [numeric](19, 0) NULL,
	[STEPCOMMAND] [varchar](max) NULL,
	[SCHVERSION] [varchar](50) NULL,
	[STATUS] [varchar](50) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_SCHEDULEINFO] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_SCHEDULETRANSFER]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_SCHEDULETRANSFER](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[STMREF] [varchar](50) NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[SYSTEMID] [varchar](50) NULL,
	[SOURCEREF] [varchar](50) NULL,
	[DESREF] [varchar](50) NULL,
	[USRID] [varchar](50) NULL,
	[USRAPPR] [varchar](50) NULL,
	[NEXTAPPR] [varchar](50) NULL,
	[SERVICEID] [varchar](50) NULL,
	[SERVICECD] [varchar](50) NULL,
	[TRANCODE] [varchar](50) NULL,
	[TXCODE] [varchar](50) NULL,
	[BCODE] [varchar](50) NULL,
	[WFCODE] [varchar](50) NULL,
	[TXCHANNEL] [varchar](50) NULL,
	[PAYREFNO] [varchar](50) NULL,
	[TXUPDATEDT] [datetime2](7) NULL,
	[DVALUEDT] [datetime2](7) NULL,
	[BANKID] [varchar](50) NULL,
	[BRANCHCD] [varchar](50) NULL,
	[SWIFTCODE] [varchar](50) NULL,
	[NOTIFMAIL] [varchar](50) NULL,
	[INVREF] [varchar](50) NULL,
	[INVCODE] [varchar](50) NULL,
	[MERCHANTID] [varchar](50) NULL,
	[CATID] [varchar](50) NULL,
	[ID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[BACCDR] [varchar](50) NULL,
	[BACCCR] [varchar](50) NULL,
	[BILLAMT] [numeric](19, 6) NULL,
	[CCYID] [varchar](50) NULL,
	[INCACNO] [varchar](50) NULL,
	[FEECODE] [varchar](200) NULL,
	[FEEVAL] [varchar](200) NULL,
	[ERRCODE] [varchar](100) NULL,
	[TRANTYPE] [varchar](50) NULL,
	[ISOFFLINETRN] [varchar](1) NULL,
	[ISONLINETRN] [varchar](1) NULL,
	[RSTS] [varchar](1) NULL,
	[TXSTS] [varchar](1) NULL,
	[STS] [varchar](1) NULL,
	[WFSTS] [varchar](1) NULL,
	[ISOTP] [varchar](1) NULL,
	[ISVCH] [varchar](1) NULL,
	[ISSMS] [varchar](1) NULL,
	[ISEMAIL] [varchar](1) NULL,
	[REFVAL01] [varchar](500) NULL,
	[REFVAL02] [varchar](500) NULL,
	[REFVAL03] [varchar](500) NULL,
	[REFVAL04] [varchar](500) NULL,
	[REFVAL05] [varchar](500) NULL,
	[REFVAL06] [varchar](500) NULL,
	[REFVAL07] [varchar](500) NULL,
	[REFVAL08] [varchar](500) NULL,
	[REFVAL09] [varchar](500) NULL,
	[REFVAL10] [varchar](500) NULL,
	[CHAR01] [varchar](200) NULL,
	[CHAR02] [varchar](200) NULL,
	[CHAR03] [varchar](200) NULL,
	[CHAR04] [varchar](200) NULL,
	[CHAR05] [varchar](200) NULL,
	[CHAR06] [varchar](200) NULL,
	[CHAR07] [varchar](200) NULL,
	[CHAR08] [varchar](200) NULL,
	[CHAR09] [varchar](200) NULL,
	[CHAR10] [varchar](200) NULL,
	[CHAR11] [varchar](200) NULL,
	[CHAR12] [varchar](200) NULL,
	[CHAR13] [varchar](200) NULL,
	[CHAR14] [varchar](200) NULL,
	[CHAR15] [varchar](200) NULL,
	[CHAR16] [varchar](200) NULL,
	[CHAR17] [varchar](200) NULL,
	[CHAR18] [varchar](200) NULL,
	[CHAR19] [varchar](200) NULL,
	[CHAR20] [varchar](200) NULL,
	[CHAR21] [varchar](200) NULL,
	[CHAR22] [varchar](200) NULL,
	[CHAR23] [varchar](200) NULL,
	[CHAR24] [varchar](200) NULL,
	[CHAR25] [varchar](200) NULL,
	[CHAR26] [varchar](200) NULL,
	[CHAR27] [varchar](200) NULL,
	[CHAR28] [varchar](200) NULL,
	[CHAR29] [varchar](200) NULL,
	[CHAR30] [varchar](200) NULL,
	[CHAR31] [varchar](200) NULL,
	[CHAR32] [varchar](200) NULL,
	[CHAR33] [varchar](200) NULL,
	[CHAR34] [varchar](200) NULL,
	[CHAR35] [varchar](200) NULL,
	[CHAR36] [varchar](200) NULL,
	[CHAR37] [varchar](200) NULL,
	[CHAR38] [varchar](200) NULL,
	[CHAR39] [varchar](200) NULL,
	[CHAR40] [varchar](200) NULL,
	[CHAR41] [varchar](200) NULL,
	[CHAR42] [varchar](200) NULL,
	[CHAR43] [varchar](200) NULL,
	[CHAR44] [varchar](200) NULL,
	[CHAR45] [varchar](200) NULL,
	[CHAR46] [varchar](200) NULL,
	[CHAR47] [varchar](200) NULL,
	[CHAR48] [varchar](200) NULL,
	[CHAR49] [varchar](200) NULL,
	[CHAR50] [varchar](200) NULL,
	[NUM01] [numeric](19, 6) NULL,
	[NUM02] [numeric](19, 6) NULL,
	[NUM03] [numeric](19, 6) NULL,
	[NUM04] [numeric](19, 6) NULL,
	[NUM05] [numeric](19, 6) NULL,
	[NUM06] [numeric](19, 6) NULL,
	[NUM07] [numeric](19, 6) NULL,
	[NUM08] [numeric](19, 6) NULL,
	[NUM09] [numeric](19, 6) NULL,
	[NUM10] [numeric](19, 6) NULL,
	[DATE01] [datetime2](7) NULL,
	[DATE02] [datetime2](7) NULL,
	[DATE03] [datetime2](7) NULL,
	[DATE04] [datetime2](7) NULL,
	[DATE05] [datetime2](7) NULL,
	[DATE06] [datetime2](7) NULL,
 CONSTRAINT [D_SCHEDULETRANSFER_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_D_SCHEDULETRANSFER_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_SERVICECODE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_SERVICECODE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[SERVICEID] [varchar](50) NULL,
	[SERVICECD] [varchar](50) NULL,
	[SERVICETYPE] [varchar](50) NULL,
	[SERVICESTS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
	[ROWID] [varchar](50) NULL,
 CONSTRAINT [PK_D_SERVICECODE] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_SERVICEFEE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_SERVICEFEE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[SERVICEID] [varchar](50) NULL,
	[SERVICECD] [varchar](50) NULL,
	[FEECODE] [varchar](50) NULL,
	[FEETYPE] [varchar](50) NULL,
	[STATUS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_SERVICEFEE] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_SERVICEREGISTRATION]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_SERVICEREGISTRATION](
	[SHORTNAME] [varchar](50) NULL,
	[FULLNAME] [varchar](200) NULL,
	[ID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[SERVICEID] [varchar](50) NULL,
	[SERVICECD] [varchar](50) NULL,
	[TRANCODE] [varchar](50) NULL,
	[TXCODE] [varchar](50) NULL,
	[BCODE] [varchar](50) NULL,
	[TRANTYPE] [varchar](50) NULL,
	[TXCHANNEL] [varchar](50) NULL,
	[ISFEEAPPLY] [varchar](1) NULL,
	[ISGLACT] [varchar](1) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[SERVICESTS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
	[MODIFYDT] [datetime2](7) NULL,
	[INSTALLDT] [datetime2](7) NULL,
	[LAUNCHDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_SERVICEREGISTRATION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_SERVICETYPE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_SERVICETYPE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TYPEID] [varchar](50) NULL,
	[TYPECD] [varchar](50) NULL,
	[TYPENAME] [varchar](200) NULL,
	[TYPESTS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_SERVICETYPE] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_SMSOUT]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_SMSOUT](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[SMSINFO] [varchar](500) NULL,
	[STS] [varchar](1) NULL,
	[SENTDT] [datetime2](7) NULL,
	[EXPIREDT] [datetime2](7) NULL,
	[ID] [varchar](100) NULL,
 CONSTRAINT [D_SMSOUT_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_D_SMSOUT_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_SWIFTCODE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_SWIFTCODE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[SWIFTCODE] [varchar](50) NULL,
	[BANKCD] [varchar](50) NULL,
	[ISBANK] [varchar](50) NULL,
	[BRANCHCD] [varchar](50) NULL,
	[ISBRANCH] [varchar](1) NULL,
	[CODESTS] [varchar](1) NULL,
 CONSTRAINT [PK_D_SWIFTCODE] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_TRANSCODE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_TRANSCODE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[SERVICECD] [varchar](50) NULL,
	[TRANCODE] [varchar](100) NULL,
	[TXCODE] [varchar](10) NULL,
	[BCODE] [varchar](10) NULL,
	[DRCODE] [varchar](10) NULL,
	[CRCODE] [varchar](10) NULL,
	[TXCHANNEL] [varchar](100) NULL,
	[ROWID] [varchar](50) NULL,
	[CCYID] [varchar](10) NULL,
	[FROMAMT] [decimal](19, 7) NULL,
	[TOAMT] [decimal](19, 7) NULL,
 CONSTRAINT [PK_D_TRANSCODE] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_UPLOADFILE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_UPLOADFILE](
	[FILEID] [varchar](100) NOT NULL,
	[FILENAME] [varchar](200) NULL,
	[FILEDT] [datetime2](7) NULL,
	[FILESTS] [varchar](20) NULL,
	[FILETOKEN] [varchar](500) NULL,
	[FILETYPE] [varchar](50) NULL,
	[REMARK] [varchar](500) NULL,
	[FILESIZE] [numeric](19, 2) NULL,
	[IMPROWCNT] [varchar](50) NULL,
	[BTYPE] [varchar](50) NULL,
	[IMPORTCAT] [varchar](20) NULL,
	[STS] [varchar](50) NULL,
	[USRID] [varchar](50) NULL,
	[USRAPPR] [varchar](50) NULL,
 CONSTRAINT [D_UPLOADFILE_PKEY] PRIMARY KEY CLUSTERED 
(
	[FILEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_UPLOADFILE_OFF]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_UPLOADFILE_OFF](
	[FILEID] [varchar](100) NOT NULL,
	[FILENAME] [varchar](200) NULL,
	[FILEDT] [datetime2](7) NULL,
	[FILESTS] [varchar](20) NULL,
	[FILETOKEN] [varchar](500) NULL,
	[FILETYPE] [varchar](50) NULL,
	[REMARK] [varchar](500) NULL,
	[FILESIZE] [numeric](19, 2) NULL,
	[IMPROWCNT] [varchar](50) NULL,
	[BTYPE] [varchar](50) NULL,
	[IMPORTCAT] [varchar](20) NULL,
	[STS] [varchar](50) NULL,
	[USRID] [varchar](50) NULL,
	[USRAPPR] [varchar](50) NULL,
 CONSTRAINT [D_UPLOADFILE_OFF_PKEY] PRIMARY KEY CLUSTERED 
(
	[FILEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_USERCASH]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_USERCASH](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[BANKID] [varchar](50) NULL,
	[BRANCHID] [varchar](50) NULL,
	[BRANCHCODE] [varchar](50) NULL,
	[USRID] [varchar](50) NULL,
	[CSHAMT] [decimal](19, 6) NULL,
	[CCYID] [varchar](10) NULL,
	[LAST_UPDATED] [datetime2](7) NULL,
 CONSTRAINT [PK_D_USERCASH] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_USERTOKENMAPPING]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_USERTOKENMAPPING](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[USRID] [varchar](50) NULL,
	[USRCODE] [varchar](50) NULL,
	[APP] [varchar](50) NULL,
	[DOMAIN] [varchar](50) NULL,
	[TOKEN] [varchar](500) NULL,
	[ISACTIVE] [varchar](1) NULL,
	[ISEXPIRE] [varchar](1) NULL,
	[TOKENDT] [datetime2](7) NULL,
	[EXPIREDT] [datetime2](7) NULL,
	[REFRESHDT] [datetime2](7) NULL,
 CONSTRAINT [PK_D_USERTOKENMAPPING] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_VCHEXPORT]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_VCHEXPORT](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[SERVICECD] [varchar](50) NULL,
	[TRANCODE] [varchar](50) NULL,
	[VCHREF] [varchar](100) NULL,
	[USREXPORT] [varchar](50) NULL,
	[EXPORTDT] [datetime2](7) NULL,
	[EXPORTSTS] [varchar](1) NULL,
	[EXPORTTYPE] [varchar](50) NULL,
	[ID] [varchar](100) NULL,
 CONSTRAINT [D_VCHEXPORT_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_D_VCHEXPORT_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_WORKFLOW]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_WORKFLOW](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[WFCODE] [varchar](50) NULL,
	[WFDESC] [varchar](500) NULL,
	[SERVICECD] [varchar](50) NULL,
	[WFSTS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
	[ROWID] [varchar](50) NULL,
 CONSTRAINT [PK_D_WORKFLOW] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATA_FILE_IMPORT_EX]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATA_FILE_IMPORT_EX](
	[name] [nvarchar](50) NULL,
	[alpha2] [nvarchar](50) NULL,
	[countryCallingCodes] [nvarchar](50) NULL,
	[alpha3] [nvarchar](50) NULL,
	[ioc] [nvarchar](50) NULL,
	[currencies] [nvarchar](50) NULL,
	[languages] [nvarchar](50) NULL,
	[ccTLD] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[recid] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENV_INFO]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENV_INFO](
	[ENV_CODE] [varchar](50) NULL,
	[ENV_VAL] [varchar](500) NULL,
	[E1] [varchar](500) NULL,
	[E2] [varchar](500) NULL,
	[E3] [varchar](500) NULL,
	[E4] [varchar](500) NULL,
	[E5] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[R_BILLINFO]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R_BILLINFO](
	[recid] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[fileid] [varchar](50) NULL,
	[importref] [varchar](50) NULL,
	[fileref] [varchar](50) NULL,
	[filetoken] [varchar](500) NULL,
	[importdt] [datetime2](7) NULL,
	[filedt] [datetime2](7) NULL,
	[expiredt] [datetime2](7) NULL,
	[filetype] [varchar](50) NULL,
	[importtype] [varchar](50) NULL,
	[consumerid] [varchar](50) NULL,
	[cosumerref] [varchar](50) NULL,
	[billref] [varchar](50) NULL,
	[billsts] [varchar](50) NULL,
	[billamt] [numeric](19, 6) NULL,
	[refval01] [varchar](500) NULL,
	[refval02] [varchar](500) NULL,
	[refval03] [varchar](500) NULL,
	[refval04] [varchar](500) NULL,
	[refval05] [varchar](500) NULL,
	[char01] [varchar](200) NULL,
	[char02] [varchar](200) NULL,
	[char03] [varchar](200) NULL,
	[char04] [varchar](200) NULL,
	[char05] [varchar](200) NULL,
	[char06] [varchar](200) NULL,
	[char07] [varchar](200) NULL,
	[char08] [varchar](200) NULL,
	[char09] [varchar](200) NULL,
	[char10] [varchar](200) NULL,
	[char11] [varchar](200) NULL,
	[char12] [varchar](200) NULL,
	[char13] [varchar](200) NULL,
	[char14] [varchar](200) NULL,
	[char15] [varchar](200) NULL,
	[char16] [varchar](200) NULL,
	[char17] [varchar](200) NULL,
	[char18] [varchar](200) NULL,
	[char19] [varchar](200) NULL,
	[char20] [varchar](200) NULL,
	[num01] [numeric](19, 6) NULL,
	[num02] [numeric](19, 6) NULL,
	[num03] [numeric](19, 6) NULL,
	[num04] [numeric](19, 6) NULL,
	[num05] [numeric](19, 6) NULL,
	[num06] [numeric](19, 6) NULL,
	[num07] [numeric](19, 6) NULL,
	[num08] [numeric](19, 6) NULL,
	[num09] [numeric](19, 6) NULL,
	[num10] [numeric](19, 6) NULL,
	[date01] [datetime2](7) NULL,
	[date02] [datetime2](7) NULL,
	[date03] [datetime2](7) NULL,
	[date04] [datetime2](7) NULL,
 CONSTRAINT [R_BILLINFO_PKEY] PRIMARY KEY CLUSTERED 
(
	[recid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_R_BILLINFO_CHAR03] UNIQUE NONCLUSTERED 
(
	[char03] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[R_DIRECTDEBIT]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R_DIRECTDEBIT](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[STMREF] [varchar](50) NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[SYSTEMID] [varchar](50) NULL,
	[SOURCEREF] [varchar](50) NULL,
	[DESREF] [varchar](50) NULL,
	[USRID] [varchar](50) NULL,
	[USRAPPR] [varchar](50) NULL,
	[NEXTAPPR] [varchar](50) NULL,
	[SERVICEID] [varchar](50) NULL,
	[SERVICECD] [varchar](50) NULL,
	[TRANCODE] [varchar](50) NULL,
	[TXCODE] [varchar](50) NULL,
	[BCODE] [varchar](50) NULL,
	[WFCODE] [varchar](50) NULL,
	[TXCHANNEL] [varchar](50) NULL,
	[PAYREFNO] [varchar](50) NULL,
	[TXUPDATEDT] [datetime2](7) NULL,
	[DVALUEDT] [datetime2](7) NULL,
	[BANKID] [varchar](50) NULL,
	[BRANCHCD] [varchar](50) NULL,
	[SWIFTCODE] [varchar](50) NULL,
	[NOTIFMAIL] [varchar](50) NULL,
	[INVREF] [varchar](50) NULL,
	[INVCODE] [varchar](50) NULL,
	[MERCHANTID] [varchar](50) NULL,
	[CATID] [varchar](50) NULL,
	[ID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[BACCDR] [varchar](50) NULL,
	[BACCCR] [varchar](50) NULL,
	[BILLAMT] [numeric](19, 6) NULL,
	[CCYID] [varchar](50) NULL,
	[INCACNO] [varchar](50) NULL,
	[FEECODE] [varchar](200) NULL,
	[FEEVAL] [varchar](200) NULL,
	[ERRCODE] [varchar](100) NULL,
	[TRANTYPE] [varchar](50) NULL,
	[ISOFFLINETRN] [varchar](1) NULL,
	[ISONLINETRN] [varchar](1) NULL,
	[RSTS] [varchar](1) NULL,
	[TXSTS] [varchar](1) NULL,
	[STS] [varchar](1) NULL,
	[WFSTS] [varchar](1) NULL,
	[ISOTP] [varchar](1) NULL,
	[ISVCH] [varchar](1) NULL,
	[ISSMS] [varchar](1) NULL,
	[ISEMAIL] [varchar](1) NULL,
	[REFVAL01] [varchar](500) NULL,
	[REFVAL02] [varchar](500) NULL,
	[REFVAL03] [varchar](500) NULL,
	[REFVAL04] [varchar](500) NULL,
	[REFVAL05] [varchar](500) NULL,
	[REFVAL06] [varchar](500) NULL,
	[REFVAL07] [varchar](500) NULL,
	[REFVAL08] [varchar](500) NULL,
	[REFVAL09] [varchar](500) NULL,
	[REFVAL10] [varchar](500) NULL,
	[CHAR01] [varchar](200) NULL,
	[CHAR02] [varchar](200) NULL,
	[CHAR03] [varchar](200) NULL,
	[CHAR04] [varchar](200) NULL,
	[CHAR05] [varchar](200) NULL,
	[CHAR06] [varchar](200) NULL,
	[CHAR07] [varchar](200) NULL,
	[CHAR08] [varchar](200) NULL,
	[CHAR09] [varchar](200) NULL,
	[CHAR10] [varchar](200) NULL,
	[CHAR11] [varchar](200) NULL,
	[CHAR12] [varchar](200) NULL,
	[CHAR13] [varchar](200) NULL,
	[CHAR14] [varchar](200) NULL,
	[CHAR15] [varchar](200) NULL,
	[CHAR16] [varchar](200) NULL,
	[CHAR17] [varchar](200) NULL,
	[CHAR18] [varchar](200) NULL,
	[CHAR19] [varchar](200) NULL,
	[CHAR20] [varchar](200) NULL,
	[CHAR21] [varchar](200) NULL,
	[CHAR22] [varchar](200) NULL,
	[CHAR23] [varchar](200) NULL,
	[CHAR24] [varchar](200) NULL,
	[CHAR25] [varchar](200) NULL,
	[CHAR26] [varchar](200) NULL,
	[CHAR27] [varchar](200) NULL,
	[CHAR28] [varchar](200) NULL,
	[CHAR29] [varchar](200) NULL,
	[CHAR30] [varchar](200) NULL,
	[CHAR31] [varchar](200) NULL,
	[CHAR32] [varchar](200) NULL,
	[CHAR33] [varchar](200) NULL,
	[CHAR34] [varchar](200) NULL,
	[CHAR35] [varchar](200) NULL,
	[CHAR36] [varchar](200) NULL,
	[CHAR37] [varchar](200) NULL,
	[CHAR38] [varchar](200) NULL,
	[CHAR39] [varchar](200) NULL,
	[CHAR40] [varchar](200) NULL,
	[CHAR41] [varchar](200) NULL,
	[CHAR42] [varchar](200) NULL,
	[CHAR43] [varchar](200) NULL,
	[CHAR44] [varchar](200) NULL,
	[CHAR45] [varchar](200) NULL,
	[CHAR46] [varchar](200) NULL,
	[CHAR47] [varchar](200) NULL,
	[CHAR48] [varchar](200) NULL,
	[CHAR49] [varchar](200) NULL,
	[CHAR50] [varchar](200) NULL,
	[NUM01] [numeric](19, 6) NULL,
	[NUM02] [numeric](19, 6) NULL,
	[NUM03] [numeric](19, 6) NULL,
	[NUM04] [numeric](19, 6) NULL,
	[NUM05] [numeric](19, 6) NULL,
	[NUM06] [numeric](19, 6) NULL,
	[NUM07] [numeric](19, 6) NULL,
	[NUM08] [numeric](19, 6) NULL,
	[NUM09] [numeric](19, 6) NULL,
	[NUM10] [numeric](19, 6) NULL,
	[DATE01] [datetime2](7) NULL,
	[DATE02] [datetime2](7) NULL,
	[DATE03] [datetime2](7) NULL,
	[DATE04] [datetime2](7) NULL,
	[DATE05] [datetime2](7) NULL,
	[DATE06] [datetime2](7) NULL,
 CONSTRAINT [R_DIRECTDEBIT_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_R_DIRECTDEBIT_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[R_HUBSTM]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R_HUBSTM](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[STMREF] [varchar](50) NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[SYSTEMID] [varchar](50) NULL,
	[SOURCEREF] [varchar](50) NULL,
	[DESREF] [varchar](50) NULL,
	[USRID] [varchar](50) NULL,
	[USRAPPR] [varchar](50) NULL,
	[NEXTAPPR] [varchar](50) NULL,
	[SERVICEID] [varchar](50) NULL,
	[SERVICECD] [varchar](50) NULL,
	[TRANCODE] [varchar](50) NULL,
	[TXCODE] [varchar](50) NULL,
	[BCODE] [varchar](50) NULL,
	[WFCODE] [varchar](50) NULL,
	[TXCHANNEL] [varchar](50) NULL,
	[PAYREFNO] [varchar](50) NULL,
	[TXUPDATEDT] [datetime2](7) NULL,
	[DVALUEDT] [datetime2](7) NULL,
	[BANKID] [varchar](50) NULL,
	[BRANCHCD] [varchar](50) NULL,
	[SWIFTCODE] [varchar](50) NULL,
	[NOTIFMAIL] [varchar](50) NULL,
	[INVREF] [varchar](50) NULL,
	[INVCODE] [varchar](50) NULL,
	[MERCHANTID] [varchar](50) NULL,
	[CATID] [varchar](50) NULL,
	[ID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[BACCDR] [varchar](50) NULL,
	[BACCCR] [varchar](50) NULL,
	[BILLAMT] [numeric](19, 6) NULL,
	[CCYID] [varchar](50) NULL,
	[INCACNO] [varchar](50) NULL,
	[FEECODE] [varchar](200) NULL,
	[FEEVAL] [varchar](200) NULL,
	[ERRCODE] [varchar](100) NULL,
	[TRANTYPE] [varchar](50) NULL,
	[ISOFFLINETRN] [varchar](1) NULL,
	[ISONLINETRN] [varchar](1) NULL,
	[RSTS] [varchar](1) NULL,
	[TXSTS] [varchar](1) NULL,
	[STS] [varchar](1) NULL,
	[WFSTS] [varchar](1) NULL,
	[ISOTP] [varchar](1) NULL,
	[ISVCH] [varchar](1) NULL,
	[ISSMS] [varchar](1) NULL,
	[ISEMAIL] [varchar](1) NULL,
	[REFVAL01] [varchar](500) NULL,
	[REFVAL02] [varchar](500) NULL,
	[REFVAL03] [varchar](500) NULL,
	[REFVAL04] [varchar](500) NULL,
	[REFVAL05] [varchar](500) NULL,
	[REFVAL06] [varchar](500) NULL,
	[REFVAL07] [varchar](500) NULL,
	[REFVAL08] [varchar](500) NULL,
	[REFVAL09] [varchar](500) NULL,
	[REFVAL10] [varchar](500) NULL,
	[CHAR01] [varchar](200) NULL,
	[CHAR02] [varchar](200) NULL,
	[CHAR03] [varchar](200) NULL,
	[CHAR04] [varchar](200) NULL,
	[CHAR05] [varchar](200) NULL,
	[CHAR06] [varchar](200) NULL,
	[CHAR07] [varchar](200) NULL,
	[CHAR08] [varchar](200) NULL,
	[CHAR09] [varchar](200) NULL,
	[CHAR10] [varchar](200) NULL,
	[CHAR11] [varchar](200) NULL,
	[CHAR12] [varchar](200) NULL,
	[CHAR13] [varchar](200) NULL,
	[CHAR14] [varchar](200) NULL,
	[CHAR15] [varchar](200) NULL,
	[CHAR16] [varchar](200) NULL,
	[CHAR17] [varchar](200) NULL,
	[CHAR18] [varchar](200) NULL,
	[CHAR19] [varchar](200) NULL,
	[CHAR20] [varchar](200) NULL,
	[CHAR21] [varchar](200) NULL,
	[CHAR22] [varchar](200) NULL,
	[CHAR23] [varchar](200) NULL,
	[CHAR24] [varchar](200) NULL,
	[CHAR25] [varchar](200) NULL,
	[CHAR26] [varchar](200) NULL,
	[CHAR27] [varchar](200) NULL,
	[CHAR28] [varchar](200) NULL,
	[CHAR29] [varchar](200) NULL,
	[CHAR30] [varchar](200) NULL,
	[CHAR31] [varchar](200) NULL,
	[CHAR32] [varchar](200) NULL,
	[CHAR33] [varchar](200) NULL,
	[CHAR34] [varchar](200) NULL,
	[CHAR35] [varchar](200) NULL,
	[CHAR36] [varchar](200) NULL,
	[CHAR37] [varchar](200) NULL,
	[CHAR38] [varchar](200) NULL,
	[CHAR39] [varchar](200) NULL,
	[CHAR40] [varchar](200) NULL,
	[CHAR41] [varchar](200) NULL,
	[CHAR42] [varchar](200) NULL,
	[CHAR43] [varchar](200) NULL,
	[CHAR44] [varchar](200) NULL,
	[CHAR45] [varchar](200) NULL,
	[CHAR46] [varchar](200) NULL,
	[CHAR47] [varchar](200) NULL,
	[CHAR48] [varchar](200) NULL,
	[CHAR49] [varchar](200) NULL,
	[CHAR50] [varchar](200) NULL,
	[NUM01] [numeric](19, 6) NULL,
	[NUM02] [numeric](19, 6) NULL,
	[NUM03] [numeric](19, 6) NULL,
	[NUM04] [numeric](19, 6) NULL,
	[NUM05] [numeric](19, 6) NULL,
	[NUM06] [numeric](19, 6) NULL,
	[NUM07] [numeric](19, 6) NULL,
	[NUM08] [numeric](19, 6) NULL,
	[NUM09] [numeric](19, 6) NULL,
	[NUM10] [numeric](19, 6) NULL,
	[DATE01] [datetime2](7) NULL,
	[DATE02] [datetime2](7) NULL,
	[DATE03] [datetime2](7) NULL,
	[DATE04] [datetime2](7) NULL,
	[DATE05] [datetime2](7) NULL,
	[DATE06] [datetime2](7) NULL,
 CONSTRAINT [R_HUBSTM_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_R_HUBSTM_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[R_HUBSTMW]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R_HUBSTMW](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[STMREF] [varchar](50) NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[SYSTEMID] [varchar](50) NULL,
	[SOURCEREF] [varchar](50) NULL,
	[DESREF] [varchar](50) NULL,
	[USRID] [varchar](50) NULL,
	[USRAPPR] [varchar](50) NULL,
	[NEXTAPPR] [varchar](50) NULL,
	[SERVICEID] [varchar](50) NULL,
	[SERVICECD] [varchar](50) NULL,
	[TRANCODE] [varchar](50) NULL,
	[TXCODE] [varchar](50) NULL,
	[BCODE] [varchar](50) NULL,
	[WFCODE] [varchar](50) NULL,
	[TXCHANNEL] [varchar](50) NULL,
	[PAYREFNO] [varchar](50) NULL,
	[TXUPDATEDT] [datetime2](7) NULL,
	[DVALUEDT] [datetime2](7) NULL,
	[BANKID] [varchar](50) NULL,
	[BRANCHCD] [varchar](50) NULL,
	[SWIFTCODE] [varchar](50) NULL,
	[NOTIFMAIL] [varchar](50) NULL,
	[INVREF] [varchar](50) NULL,
	[INVCODE] [varchar](50) NULL,
	[MERCHANTID] [varchar](50) NULL,
	[CATID] [varchar](50) NULL,
	[ID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[BACCDR] [varchar](50) NULL,
	[BACCCR] [varchar](50) NULL,
	[BILLAMT] [numeric](19, 6) NULL,
	[CCYID] [varchar](50) NULL,
	[INCACNO] [varchar](50) NULL,
	[FEECODE] [varchar](200) NULL,
	[FEEVAL] [varchar](200) NULL,
	[ERRCODE] [varchar](100) NULL,
	[TRANTYPE] [varchar](50) NULL,
	[ISOFFLINETRN] [varchar](1) NULL,
	[ISONLINETRN] [varchar](1) NULL,
	[RSTS] [varchar](1) NULL,
	[TXSTS] [varchar](1) NULL,
	[STS] [varchar](1) NULL,
	[WFSTS] [varchar](1) NULL,
	[ISOTP] [varchar](1) NULL,
	[ISVCH] [varchar](1) NULL,
	[ISSMS] [varchar](1) NULL,
	[ISEMAIL] [varchar](1) NULL,
	[REFVAL01] [varchar](500) NULL,
	[REFVAL02] [varchar](500) NULL,
	[REFVAL03] [varchar](500) NULL,
	[REFVAL04] [varchar](500) NULL,
	[REFVAL05] [varchar](500) NULL,
	[REFVAL06] [varchar](500) NULL,
	[REFVAL07] [varchar](500) NULL,
	[REFVAL08] [varchar](500) NULL,
	[REFVAL09] [varchar](500) NULL,
	[REFVAL10] [varchar](500) NULL,
	[CHAR01] [varchar](200) NULL,
	[CHAR02] [varchar](200) NULL,
	[CHAR03] [varchar](200) NULL,
	[CHAR04] [varchar](200) NULL,
	[CHAR05] [varchar](200) NULL,
	[CHAR06] [varchar](200) NULL,
	[CHAR07] [varchar](200) NULL,
	[CHAR08] [varchar](200) NULL,
	[CHAR09] [varchar](200) NULL,
	[CHAR10] [varchar](200) NULL,
	[CHAR11] [varchar](200) NULL,
	[CHAR12] [varchar](200) NULL,
	[CHAR13] [varchar](200) NULL,
	[CHAR14] [varchar](200) NULL,
	[CHAR15] [varchar](200) NULL,
	[CHAR16] [varchar](200) NULL,
	[CHAR17] [varchar](200) NULL,
	[CHAR18] [varchar](200) NULL,
	[CHAR19] [varchar](200) NULL,
	[CHAR20] [varchar](200) NULL,
	[CHAR21] [varchar](200) NULL,
	[CHAR22] [varchar](200) NULL,
	[CHAR23] [varchar](200) NULL,
	[CHAR24] [varchar](200) NULL,
	[CHAR25] [varchar](200) NULL,
	[CHAR26] [varchar](200) NULL,
	[CHAR27] [varchar](200) NULL,
	[CHAR28] [varchar](200) NULL,
	[CHAR29] [varchar](200) NULL,
	[CHAR30] [varchar](200) NULL,
	[CHAR31] [varchar](200) NULL,
	[CHAR32] [varchar](200) NULL,
	[CHAR33] [varchar](200) NULL,
	[CHAR34] [varchar](200) NULL,
	[CHAR35] [varchar](200) NULL,
	[CHAR36] [varchar](200) NULL,
	[CHAR37] [varchar](200) NULL,
	[CHAR38] [varchar](200) NULL,
	[CHAR39] [varchar](200) NULL,
	[CHAR40] [varchar](200) NULL,
	[CHAR41] [varchar](200) NULL,
	[CHAR42] [varchar](200) NULL,
	[CHAR43] [varchar](200) NULL,
	[CHAR44] [varchar](200) NULL,
	[CHAR45] [varchar](200) NULL,
	[CHAR46] [varchar](200) NULL,
	[CHAR47] [varchar](200) NULL,
	[CHAR48] [varchar](200) NULL,
	[CHAR49] [varchar](200) NULL,
	[CHAR50] [varchar](200) NULL,
	[NUM01] [numeric](19, 6) NULL,
	[NUM02] [numeric](19, 6) NULL,
	[NUM03] [numeric](19, 6) NULL,
	[NUM04] [numeric](19, 6) NULL,
	[NUM05] [numeric](19, 6) NULL,
	[NUM06] [numeric](19, 6) NULL,
	[NUM07] [numeric](19, 6) NULL,
	[NUM08] [numeric](19, 6) NULL,
	[NUM09] [numeric](19, 6) NULL,
	[NUM10] [numeric](19, 6) NULL,
	[DATE01] [datetime2](7) NULL,
	[DATE02] [datetime2](7) NULL,
	[DATE03] [datetime2](7) NULL,
	[DATE04] [datetime2](7) NULL,
	[DATE05] [datetime2](7) NULL,
	[DATE06] [datetime2](7) NULL,
 CONSTRAINT [R_HUBSTMW_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_R_HUBSTMW_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[R_MAILOUT]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R_MAILOUT](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[MAILINFO] [varchar](500) NULL,
	[MAILSTS] [varchar](1) NULL,
	[SENTDT] [datetime2](7) NULL,
	[EXPIREDT] [datetime2](7) NULL,
	[ID] [varchar](100) NULL,
 CONSTRAINT [R_MAILOUT_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_R_MAILOUT_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[R_OTPOUT]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R_OTPOUT](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[OTPINFO] [varchar](500) NULL,
	[OTPSTS] [varchar](1) NULL,
	[SENTDT] [datetime2](7) NULL,
	[EXPIREDT] [datetime2](7) NULL,
	[ID] [varchar](100) NULL,
 CONSTRAINT [R_OTPOUT_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_R_OTPOUT_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[R_SCHEDULETRANSFER]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R_SCHEDULETRANSFER](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[STMREF] [varchar](50) NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[SYSTEMID] [varchar](50) NULL,
	[SOURCEREF] [varchar](50) NULL,
	[DESREF] [varchar](50) NULL,
	[USRID] [varchar](50) NULL,
	[USRAPPR] [varchar](50) NULL,
	[NEXTAPPR] [varchar](50) NULL,
	[SERVICEID] [varchar](50) NULL,
	[SERVICECD] [varchar](50) NULL,
	[TRANCODE] [varchar](50) NULL,
	[TXCODE] [varchar](50) NULL,
	[BCODE] [varchar](50) NULL,
	[WFCODE] [varchar](50) NULL,
	[TXCHANNEL] [varchar](50) NULL,
	[PAYREFNO] [varchar](50) NULL,
	[TXUPDATEDT] [datetime2](7) NULL,
	[DVALUEDT] [datetime2](7) NULL,
	[BANKID] [varchar](50) NULL,
	[BRANCHCD] [varchar](50) NULL,
	[SWIFTCODE] [varchar](50) NULL,
	[NOTIFMAIL] [varchar](50) NULL,
	[INVREF] [varchar](50) NULL,
	[INVCODE] [varchar](50) NULL,
	[MERCHANTID] [varchar](50) NULL,
	[CATID] [varchar](50) NULL,
	[ID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[BACCDR] [varchar](50) NULL,
	[BACCCR] [varchar](50) NULL,
	[BILLAMT] [numeric](19, 6) NULL,
	[CCYID] [varchar](50) NULL,
	[INCACNO] [varchar](50) NULL,
	[FEECODE] [varchar](200) NULL,
	[FEEVAL] [varchar](200) NULL,
	[ERRCODE] [varchar](100) NULL,
	[TRANTYPE] [varchar](50) NULL,
	[ISOFFLINETRN] [varchar](1) NULL,
	[ISONLINETRN] [varchar](1) NULL,
	[RSTS] [varchar](1) NULL,
	[TXSTS] [varchar](1) NULL,
	[STS] [varchar](1) NULL,
	[WFSTS] [varchar](1) NULL,
	[ISOTP] [varchar](1) NULL,
	[ISVCH] [varchar](1) NULL,
	[ISSMS] [varchar](1) NULL,
	[ISEMAIL] [varchar](1) NULL,
	[REFVAL01] [varchar](500) NULL,
	[REFVAL02] [varchar](500) NULL,
	[REFVAL03] [varchar](500) NULL,
	[REFVAL04] [varchar](500) NULL,
	[REFVAL05] [varchar](500) NULL,
	[REFVAL06] [varchar](500) NULL,
	[REFVAL07] [varchar](500) NULL,
	[REFVAL08] [varchar](500) NULL,
	[REFVAL09] [varchar](500) NULL,
	[REFVAL10] [varchar](500) NULL,
	[CHAR01] [varchar](200) NULL,
	[CHAR02] [varchar](200) NULL,
	[CHAR03] [varchar](200) NULL,
	[CHAR04] [varchar](200) NULL,
	[CHAR05] [varchar](200) NULL,
	[CHAR06] [varchar](200) NULL,
	[CHAR07] [varchar](200) NULL,
	[CHAR08] [varchar](200) NULL,
	[CHAR09] [varchar](200) NULL,
	[CHAR10] [varchar](200) NULL,
	[CHAR11] [varchar](200) NULL,
	[CHAR12] [varchar](200) NULL,
	[CHAR13] [varchar](200) NULL,
	[CHAR14] [varchar](200) NULL,
	[CHAR15] [varchar](200) NULL,
	[CHAR16] [varchar](200) NULL,
	[CHAR17] [varchar](200) NULL,
	[CHAR18] [varchar](200) NULL,
	[CHAR19] [varchar](200) NULL,
	[CHAR20] [varchar](200) NULL,
	[CHAR21] [varchar](200) NULL,
	[CHAR22] [varchar](200) NULL,
	[CHAR23] [varchar](200) NULL,
	[CHAR24] [varchar](200) NULL,
	[CHAR25] [varchar](200) NULL,
	[CHAR26] [varchar](200) NULL,
	[CHAR27] [varchar](200) NULL,
	[CHAR28] [varchar](200) NULL,
	[CHAR29] [varchar](200) NULL,
	[CHAR30] [varchar](200) NULL,
	[CHAR31] [varchar](200) NULL,
	[CHAR32] [varchar](200) NULL,
	[CHAR33] [varchar](200) NULL,
	[CHAR34] [varchar](200) NULL,
	[CHAR35] [varchar](200) NULL,
	[CHAR36] [varchar](200) NULL,
	[CHAR37] [varchar](200) NULL,
	[CHAR38] [varchar](200) NULL,
	[CHAR39] [varchar](200) NULL,
	[CHAR40] [varchar](200) NULL,
	[CHAR41] [varchar](200) NULL,
	[CHAR42] [varchar](200) NULL,
	[CHAR43] [varchar](200) NULL,
	[CHAR44] [varchar](200) NULL,
	[CHAR45] [varchar](200) NULL,
	[CHAR46] [varchar](200) NULL,
	[CHAR47] [varchar](200) NULL,
	[CHAR48] [varchar](200) NULL,
	[CHAR49] [varchar](200) NULL,
	[CHAR50] [varchar](200) NULL,
	[NUM01] [numeric](19, 6) NULL,
	[NUM02] [numeric](19, 6) NULL,
	[NUM03] [numeric](19, 6) NULL,
	[NUM04] [numeric](19, 6) NULL,
	[NUM05] [numeric](19, 6) NULL,
	[NUM06] [numeric](19, 6) NULL,
	[NUM07] [numeric](19, 6) NULL,
	[NUM08] [numeric](19, 6) NULL,
	[NUM09] [numeric](19, 6) NULL,
	[NUM10] [numeric](19, 6) NULL,
	[DATE01] [datetime2](7) NULL,
	[DATE02] [datetime2](7) NULL,
	[DATE03] [datetime2](7) NULL,
	[DATE04] [datetime2](7) NULL,
	[DATE05] [datetime2](7) NULL,
	[DATE06] [datetime2](7) NULL,
 CONSTRAINT [R_SCHEDULETRANSFER_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_R_SCHEDULETRANSFER_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[R_SMSOUT]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R_SMSOUT](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[CUSCODE] [varchar](50) NULL,
	[CUSMOBILE] [varchar](50) NULL,
	[SMSINFO] [varchar](500) NULL,
	[STS] [varchar](1) NULL,
	[SENTDT] [datetime2](7) NULL,
	[EXPIREDT] [datetime2](7) NULL,
	[ID] [varchar](100) NULL,
 CONSTRAINT [R_SMSOUT_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_R_SMSOUT_UUID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSCONFIGURATION]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSCONFIGURATION](
	[FULL_PATH] [varchar](200) NULL,
	[APP] [varchar](50) NULL,
	[TYPE] [varchar](50) NULL,
	[SUB_TYPE] [varchar](50) NULL,
	[CONTENT] [varchar](max) NULL,
	[FOLDER_NAME] [varchar](200) NULL,
	[FOLDER_PATH] [varchar](500) NULL,
	[LAST_UPDATED] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSLOG]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSLOG](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[LOGREF] [varchar](50) NULL,
	[LOGDT] [datetime2](7) NULL,
	[ACTION_USR_ID] [varchar](50) NULL,
	[TARGET_USR_ID] [varchar](50) NULL,
	[ACTIONCODE] [varchar](50) NULL,
	[LOGBODY] [varchar](max) NULL,
	[REMARK] [varchar](200) NULL,
	[LOGSTS] [varchar](1) NULL,
 CONSTRAINT [SYSLOG_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSLOGHISTORY]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSLOGHISTORY](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[LOGREF] [varchar](50) NULL,
	[LOGDT] [datetime2](7) NULL,
	[ACTION_USR_ID] [varchar](50) NULL,
	[TARGET_USR_ID] [varchar](50) NULL,
	[ACTIONCODE] [varchar](50) NULL,
	[LOGBODY] [varchar](max) NULL,
	[REMARK] [varchar](200) NULL,
	[LOGSTS] [varchar](1) NULL,
 CONSTRAINT [SYSLOGHISTORY_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSPORTAL]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSPORTAL](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[PORTALID] [varchar](50) NULL,
	[PORTALCODE] [varchar](50) NULL,
	[FULLNAME] [varchar](50) NULL,
	[PORTALURL] [varchar](50) NULL,
	[SERVICETYPE] [varchar](50) NULL,
	[SERPORT] [varchar](50) NULL,
	[STATUS] [varchar](1) NULL,
	[INSTALLDT] [datetime2](7) NULL,
 CONSTRAINT [PK_SYSPORTAL] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSPORTALTOKEN]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSPORTALTOKEN](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[PORTALID] [varchar](50) NULL,
	[PORTALCD] [varchar](50) NULL,
	[TOKEN] [varchar](500) NULL,
	[ISACTIVE] [varchar](1) NULL,
	[ISEXPIRE] [varchar](1) NULL,
	[TOKENDT] [datetime2](7) NULL,
	[EXPIREDT] [datetime2](7) NULL,
	[REFRESHDT] [datetime2](7) NULL,
 CONSTRAINT [PK_SYSPORTALTOKEN] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSPWDHISTORY]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSPWDHISTORY](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[USRID] [varchar](50) NULL,
	[APP] [varchar](50) NULL,
	[DOMAIN] [varchar](50) NULL,
	[PWDSTR01] [varbinary](500) NULL,
	[PWDSTR02] [varbinary](500) NULL,
	[PWDSTR03] [varbinary](500) NULL,
	[PWDSTR04] [varbinary](500) NULL,
	[PWDSTR05] [varbinary](500) NULL,
	[LAST_UPDATED] [datetime2](7) NULL,
 CONSTRAINT [PK_SYSPWDHISTORY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSUSER]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUSER](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[USRID] [varchar](50) NULL,
	[USRCODE] [varchar](50) NULL,
	[FULLNAME] [varchar](100) NULL,
	[EMAIL] [varchar](100) NULL,
	[APP] [varchar](50) NULL,
	[DOMAIN] [varchar](50) NULL,
	[BANKID] [varchar](50) NULL,
	[BRANCHCODE] [varchar](50) NULL,
	[USRTYPE] [varchar](20) NULL,
	[ISUSRTYPE] [varchar](1) NULL,
	[ISUSRROLE] [varchar](1) NULL,
	[ISUSRPWD] [varchar](1) NULL,
	[ISUSRTOKEN] [varchar](1) NULL,
	[USRTOKEN] [varchar](500) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
	[MODIFYDT] [datetime2](7) NULL,
	[ISSYSADMIN] [varchar](1) NULL,
	[ISMERCHANT] [varchar](1) NULL,
	[ISBRNUSR] [varchar](1) NULL,
	[ISAPPRUSR] [varchar](1) NULL,
	[ISCHANNELUSR] [varchar](1) NULL,
	[ISACTIVE] [varchar](1) NULL,
	[ISBLOCKED] [varchar](1) NULL,
	[ISVERIFY] [varchar](1) NULL,
 CONSTRAINT [PK_SYSUSER] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSUSERCONFIG]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUSERCONFIG](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[USRID] [varchar](50) NULL,
	[APP] [varchar](50) NULL,
	[DOMAIN] [varchar](50) NULL,
	[USRROLE] [varchar](50) NULL,
	[USREXT] [varchar](200) NULL,
	[STATUS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_SYSUSERCONFIG] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSUSERPIN]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUSERPIN](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[USRID] [varchar](50) NULL,
	[APP] [varchar](50) NULL,
	[DOMAIN] [varchar](50) NULL,
	[SALTPIN] [varchar](10) NULL,
	[USRDEFPIN] [varchar](10) NULL,
	[HASHPIN] [varbinary](500) NULL,
	[PINSTS] [varchar](1) NULL,
	[HASHPARA] [varchar](50) NULL,
	[LASTLOGIN] [datetime2](7) NULL,
	[LAST_UPDATED] [datetime2](7) NULL,
 CONSTRAINT [PK_SYSUSERPIN] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSUSERPORTAL]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUSERPORTAL](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[USRID] [varchar](50) NULL,
	[PORTALCD] [varchar](50) NULL,
	[USRTOKEN] [varchar](500) NULL,
	[ISACTIVE] [varchar](1) NULL,
	[ISEXPIRE] [varchar](1) NULL,
	[TOKENDT] [datetime2](7) NULL,
	[EXPIREDT] [datetime2](7) NULL,
	[REFRESHDT] [datetime2](7) NULL,
 CONSTRAINT [PK_SYSUSERPORTAL] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSUSERPWD]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUSERPWD](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[USRID] [varchar](50) NULL,
	[APP] [varchar](50) NULL,
	[DOMAIN] [varchar](50) NULL,
	[SALTPWD] [varchar](30) NULL,
	[USRDEFPWD] [varchar](30) NULL,
	[HASHPWD] [varbinary](500) NULL,
	[PWDSTS] [varchar](1) NULL,
	[HASHPARA] [varchar](50) NULL,
	[LASTLOGIN] [datetime2](7) NULL,
	[LAST_UPDATED] [datetime2](7) NULL,
 CONSTRAINT [PK_SYSUSERPWD] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSUSERROLE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUSERROLE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[ROLEID] [varchar](50) NULL,
	[ROLECD] [varchar](50) NULL,
	[ROLENAME] [varchar](50) NULL,
	[ROLESTS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_SYSUSERROLE] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSUSERTOKEN]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUSERTOKEN](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[USRID] [varchar](50) NULL,
	[APP] [varchar](50) NULL,
	[DOMAIN] [varchar](50) NULL,
	[USRTOKEN] [varchar](500) NULL,
	[ISACTIVE] [varchar](1) NULL,
	[ISEXPIRE] [varchar](1) NULL,
	[TOKENDT] [datetime2](7) NULL,
	[EXPIREDT] [datetime2](7) NULL,
	[REFRESHDT] [datetime2](7) NULL,
 CONSTRAINT [PK_SYSUSERTOKEN] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSUSERTYPE]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUSERTYPE](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TYPEID] [varchar](50) NULL,
	[TYPECD] [varchar](50) NULL,
	[TYPENAME] [varchar](50) NULL,
	[TYPESTS] [varchar](1) NULL,
	[MAKER] [varchar](50) NULL,
	[APPROVER] [varchar](50) NULL,
	[CREATEDT] [datetime2](7) NULL,
 CONSTRAINT [PK_SYSUSERTYPE] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANSACTIONCODE_EX]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANSACTIONCODE_EX](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TXCODE] [varchar](100) NULL,
	[CODENAME] [varchar](500) NULL,
	[CODEIDX] [varchar](10) NULL,
	[ISUSE] [varchar](1) NULL,
	[USESTS] [varchar](1) NULL,
	[ISDEFIDX] [varchar](1) NULL,
	[SERCODE] [varchar](10) NULL,
	[CREATEDT] [datetime] NULL,
	[STATUS] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UPLOAD_FILE_EX]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPLOAD_FILE_EX](
	[code] [nvarchar](50) NULL,
	[number] [smallint] NULL,
	[decimals] [nvarchar](50) NULL,
	[name] [nvarchar](150) NULL,
	[recid] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UPLOAD_FILE_NO_EX]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPLOAD_FILE_NO_EX](
	[num_code] [smallint] NULL,
	[alpha_2_code] [nvarchar](50) NULL,
	[alpha_3_code] [nvarchar](50) NULL,
	[en_short_name] [nvarchar](100) NULL,
	[nationality] [nvarchar](50) NULL,
	[recid] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkFlow_EX]    Script Date: 6/29/2025 8:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkFlow_EX](
	[RECID] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TXDT] [datetime2](7) NULL,
	[TXREFID] [varchar](50) NULL,
	[TXCODE] [varchar](50) NULL,
	[ID] [varchar](50) NULL,
	[REQUESTMESS] [varchar](max) NULL,
	[RESPONSEMESS] [varchar](max) NULL,
	[WFCODE] [varchar](50) NULL,
	[WFDESC] [varchar](500) NULL,
	[WFSTS] [varchar](1) NULL,
	[WFDT] [datetime2](7) NULL,
	[WFREFID] [varchar](100) NULL,
 CONSTRAINT [WorkFlow_EX_PKEY] PRIMARY KEY CLUSTERED 
(
	[RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_WorkFlow_EX_UUID] UNIQUE NONCLUSTERED 
(
	[WFREFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ACCOUNTCHART_EX] ADD  CONSTRAINT [DF_ACCOUNTCHART_EX_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[ACCOUNTCHART_EX] ADD  CONSTRAINT [DF_ACCOUNTCHART_EX_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[ACCOUNTCHART_EX] ADD  CONSTRAINT [DF_ACCOUNTCHART_EX_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[ACQUIRINGBANK_EX] ADD  CONSTRAINT [DF_ACQUIRINGBANK_EX_ROWID]  DEFAULT (newid()) FOR [ROWID]
GO
ALTER TABLE [dbo].[D_BENEFDPTACT] ADD  CONSTRAINT [DF_D_BENEFDPTACT_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_BENEFDPTACT] ADD  CONSTRAINT [DF_D_BENEFDPTACT_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_BENEFDPTACT] ADD  CONSTRAINT [DF_D_BENEFDPTACT_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_BRANCHCODE] ADD  CONSTRAINT [DF_D_BRANCHCODE_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_BRANCHCODE] ADD  CONSTRAINT [DF_D_BRANCHCODE_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_BRANCHCODE] ADD  CONSTRAINT [DF_D_BRANCHCODE_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_CALENDAR] ADD  CONSTRAINT [DF_D_CALENDAR_ISCURRDT]  DEFAULT ('N') FOR [ISCURRDT]
GO
ALTER TABLE [dbo].[D_CLEANLOG] ADD  CONSTRAINT [DF_D_CLEANLOG_LOGREF]  DEFAULT (replace(newid(),'-','')) FOR [LOGREF]
GO
ALTER TABLE [dbo].[D_CODETYPE] ADD  CONSTRAINT [DF_D_CODETYPE_ROWID]  DEFAULT (newid()) FOR [ROWID]
GO
ALTER TABLE [dbo].[D_COUNTRY] ADD  CONSTRAINT [DF_D_COUNTRY_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_COUNTRY] ADD  CONSTRAINT [DF_D_COUNTRY_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_COUNTRY] ADD  CONSTRAINT [DF_D_COUNTRY_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_CURRENCY] ADD  CONSTRAINT [DF_D_CURRENCY_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_CURRENCY] ADD  CONSTRAINT [DF_D_CURRENCY_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_CURRENCY] ADD  CONSTRAINT [DF_D_CURRENCY_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_DEPOSITCATALOG] ADD  CONSTRAINT [DF_D_DEPOSITCATALOG_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_DEPOSITCATALOG] ADD  CONSTRAINT [DF_D_DEPOSITCATALOG_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_DEPOSITCATALOG] ADD  CONSTRAINT [DF_D_DEPOSITCATALOG_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_ERRORCODE] ADD  CONSTRAINT [DF_D_ERRORCODE_ROWID]  DEFAULT (newid()) FOR [ROWID]
GO
ALTER TABLE [dbo].[D_FEECODE] ADD  CONSTRAINT [DF_D_FEECODE_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_FEECODE] ADD  CONSTRAINT [DF_D_FEECODE_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_FEECODE] ADD  CONSTRAINT [DF_D_FEECODE_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_FEEDEF] ADD  CONSTRAINT [DF_D_FEEDEF_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_FEEDEF] ADD  CONSTRAINT [DF_D_FEEDEF_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_FEEDEF] ADD  CONSTRAINT [DF_D_FEEDEF_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_FEEDEF] ADD  CONSTRAINT [DF_D_FEEDEF_ROWID]  DEFAULT (newid()) FOR [ROWID]
GO
ALTER TABLE [dbo].[D_FEETYPE] ADD  CONSTRAINT [DF_D_FEETYPE_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_FEETYPE] ADD  CONSTRAINT [DF_D_FEETYPE_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_FEETYPE] ADD  CONSTRAINT [DF_D_FEETYPE_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_FILETYPE] ADD  CONSTRAINT [DF_D_FILETYPE_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_FILETYPE] ADD  CONSTRAINT [DF_D_FILETYPE_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_FILETYPE] ADD  CONSTRAINT [DF_D_FILETYPE_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_HOLIDAY] ADD  CONSTRAINT [DF_D_HOLIDAY_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_MAILOUT] ADD  CONSTRAINT [DF_D_MAILOUT_ID]  DEFAULT (replace(lower(newid()),'-','')) FOR [ID]
GO
ALTER TABLE [dbo].[D_MERCHANT] ADD  CONSTRAINT [DF_D_MERCHANT_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_MERCHANT] ADD  CONSTRAINT [DF_D_MERCHANT_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_MERCHANT] ADD  CONSTRAINT [DF_D_MERCHANT_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_MERCHANTSETTLE] ADD  CONSTRAINT [DF_D_MERCHANTSETTLE_ID]  DEFAULT (replace(lower(newid()),'-','')) FOR [ID]
GO
ALTER TABLE [dbo].[D_NATION] ADD  CONSTRAINT [DF_D_NATION_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_NATION] ADD  CONSTRAINT [DF_D_NATION_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_NATION] ADD  CONSTRAINT [DF_D_NATION_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_OTPOUT] ADD  CONSTRAINT [DF_D_OTPOUT_ID]  DEFAULT (replace(lower(newid()),'-','')) FOR [ID]
GO
ALTER TABLE [dbo].[D_SCHEDULEINFO] ADD  CONSTRAINT [DF_D_SCHEDULEINFO_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_SCHEDULEINFO] ADD  CONSTRAINT [DF_D_SCHEDULEINFO_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_SCHEDULEINFO] ADD  CONSTRAINT [DF_D_SCHEDULEINFO_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_SERVICECODE] ADD  CONSTRAINT [DF_D_SERVICECODE_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_SERVICECODE] ADD  CONSTRAINT [DF_D_SERVICECODE_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_SERVICECODE] ADD  CONSTRAINT [DF_D_SERVICECODE_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_SERVICECODE] ADD  CONSTRAINT [DF_D_SERVICECODE_ROWID]  DEFAULT (newid()) FOR [ROWID]
GO
ALTER TABLE [dbo].[D_SERVICEFEE] ADD  CONSTRAINT [DF_D_SERVICEFEE_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_SERVICEFEE] ADD  CONSTRAINT [DF_D_SERVICEFEE_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_SERVICEFEE] ADD  CONSTRAINT [DF_D_SERVICEFEE_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_SERVICEREGISTRATION] ADD  CONSTRAINT [DF_D_SERVICEREGISTRATION_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_SERVICEREGISTRATION] ADD  CONSTRAINT [DF_D_SERVICEREGISTRATION_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_SERVICEREGISTRATION] ADD  CONSTRAINT [DF_D_SERVICEREGISTRATION_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_SERVICETYPE] ADD  CONSTRAINT [DF_D_SERVICETYPE_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_SERVICETYPE] ADD  CONSTRAINT [DF_D_SERVICETYPE_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_SERVICETYPE] ADD  CONSTRAINT [DF_D_SERVICETYPE_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_SMSOUT] ADD  CONSTRAINT [DF_D_SMSOUT_ID]  DEFAULT (replace(lower(newid()),'-','')) FOR [ID]
GO
ALTER TABLE [dbo].[D_TRANSCODE] ADD  CONSTRAINT [DF_D_TRANSCODE_ROWID]  DEFAULT (newid()) FOR [ROWID]
GO
ALTER TABLE [dbo].[D_WORKFLOW] ADD  CONSTRAINT [DF_D_WORKFLOW_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[D_WORKFLOW] ADD  CONSTRAINT [DF_D_WORKFLOW_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[D_WORKFLOW] ADD  CONSTRAINT [DF_D_WORKFLOW_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[D_WORKFLOW] ADD  CONSTRAINT [DF_D_WORKFLOW_ROWID]  DEFAULT (newid()) FOR [ROWID]
GO
ALTER TABLE [dbo].[SYSUSER] ADD  CONSTRAINT [DF_SYSUSER_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[SYSUSER] ADD  CONSTRAINT [DF_SYSUSER_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[SYSUSER] ADD  CONSTRAINT [DF_SYSUSER_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[SYSUSERCONFIG] ADD  CONSTRAINT [DF_SYSUSERCONFIG_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[SYSUSERCONFIG] ADD  CONSTRAINT [DF_SYSUSERCONFIG_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[SYSUSERCONFIG] ADD  CONSTRAINT [DF_SYSUSERCONFIG_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[SYSUSERROLE] ADD  CONSTRAINT [DF_SYSUSERROLE_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[SYSUSERROLE] ADD  CONSTRAINT [DF_SYSUSERROLE_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[SYSUSERROLE] ADD  CONSTRAINT [DF_SYSUSERROLE_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[SYSUSERTYPE] ADD  CONSTRAINT [DF_SYSUSERTYPE_MAKER]  DEFAULT ('sems') FOR [MAKER]
GO
ALTER TABLE [dbo].[SYSUSERTYPE] ADD  CONSTRAINT [DF_SYSUSERTYPE_APPROVER]  DEFAULT ('sems') FOR [APPROVER]
GO
ALTER TABLE [dbo].[SYSUSERTYPE] ADD  CONSTRAINT [DF_SYSUSERTYPE_CREATEDT]  DEFAULT (getdate()) FOR [CREATEDT]
GO
ALTER TABLE [dbo].[WorkFlow_EX] ADD  CONSTRAINT [DF_WorkFlow_EX_WFREFID]  DEFAULT (replace(lower(newid()),'-','')) FOR [WFREFID]
GO
