DROP TABLE IF EXISTS dbo.t_simpsons_member_count;
GO

CREATE TABLE dbo.t_simpsons_member_count
(total_family_members INT NOT NULL,
 CONSTRAINT PK_t_simpsons_member_count PRIMARY KEY CLUSTERED(total_family_members ASC)
);
GO
