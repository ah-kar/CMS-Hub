# CMS-Hub
CMS Hub Database Schema &amp; WorkFlow

## CMS-Hub Workflow List

| ID  | Name                         | Description                                 | Version |
|-----|------------------------------|---------------------------------------------|---------|
| 1   | B_DPT_DIR_TRF_ONL_EXEC       | Direct Debit Transfer Online Transaction    | 1.0     |
| 2   | B_DPT_FUD_TRF_OFF_EXEC       | Fund Transfer Offline Transaction           | 1.0     |
| 3   | B_EOD_BTH_INT_EXEC           | Clean Log                                   | 1.1     |
| 4   | B_DPT_IRT_TRF_OFF_EXEC       | Internal Transfer Offline Transaction       | 1.0     |
| 5   | B_DPT_SCH_TRF_ONL_EXEC       | Schedule Transfer Online Transaction        | 1.0     |
| 6   | B_DPT_BPM_TRF_OFF_EXEC       | Bill Payment Offline Transaction            | 1.0     |
| 7   | B_DPT_BPM_TRF_MER_EXEC       | Bill Payment by Merchant                    | 1.0     |
| 8   | B_DPT_DIR_TRF_OFF_EXEC       | Direct Debit Transfer Offline Transaction   | 1.0     |
| 9   | B_DPT_SCH_TRF_OFF_EXEC       | Schedule Transfer Offline Transaction       | 1.0     |
| 10  | B_DPT_IRT_TRF_ONL_EXEC       | Internal Transfer Online Transaction        | 1.0     |
| 11  | B_IMP_BILL_INFO_ON_EXEC      | Import Bill Online                          | 1.0     |
| 12  | B_DPT_FUD_TRF_ONL_EXEC       | Fund Transfer Online Transaction            | 1.0     |
| 13  | B_DPT_BPM_TRF_ONL_EXEC       | Bill Payment Online Transaction             | 1.0     |
| 14  | B_SYNC_BEF_DPT_ACT_EXEC      | Sync Beneficiary Deposit Account            | 1.0     |
| 15  | B_IMP_BILL_INFO_OFF_EXEC     | Import Offline Bill                         | 1.0     |

## History Data Movement List

| ID  | FROM_TABLE | TO_TABLE      | Description                          | TYPE     | FREQUENCY |
|-----|------------|---------------|--------------------------------------|----------|-----------|
| 1   | D_HUBSTM   | R_HUBSTM      | Move Hub Transaction Statement History | T-SQL    | DAILY     |
| 2   | D_OTPOUT   | R_OTPOUT      | Move OTP Info History                | T-SQL    | DAILY     |
| 3   | D_SMSOUT   | R_SMSOUT      | Move SMS Info History                | T-SQL    | DAILY     |
| 4   | D_MAILOUT  | R_MAILOUT     | Move Mail Info History               | T-SQL    | DAILY     |
| 5   | D_BILLINFO | R_BILLINFO    | Move Paid/Expire Bill Info History   | T-SQL    | DAILY     |
| 6   | SYSLOG     | SYSLOGHISTORY | Move System Log History              | Agent    | DAILY     |
| 5   | D_DIRECTDEBIT | R_DIRECTDEBIT    | Move Direct Debit History      | T-SQL    | DAILY     |
| 6   | D_SCHEDULETRANSFER | R_SCHEDULETRANSFER | Move Schedule Transfer History | T-SQL    | DAILY     |
