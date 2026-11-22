DROP TABLE IF EXISTS dbo.t_myfc_record_count;
GO

CREATE TABLE dbo.t_myfc_record_count
(total_myfc_records INT NOT NULL,
 CONSTRAINT PK_t_myfc_record_count PRIMARY KEY CLUSTERED(total_myfc_records ASC)
);
GO
