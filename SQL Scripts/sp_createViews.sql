USE chinook_gold  
GO  

CREATE OR ALTER PROCEDURE create_view  
    @view_name NVARCHAR(128)  
AS  
BEGIN  
    DECLARE @sql NVARCHAR(MAX);

    SET @sql = N'CREATE OR ALTER VIEW ' + QUOTENAME(@view_name) + N' AS  
SELECT * FROM  
OPENROWSET(  
    BULK ''https://adlschinook.dfs.core.windows.net/gold/dbo/' + @view_name + N'/'',  
    FORMAT = ''DELTA''  
) AS [result];';

    EXEC sp_executesql @sql;  
END  
GO
