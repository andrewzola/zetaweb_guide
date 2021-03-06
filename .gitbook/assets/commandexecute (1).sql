USE [master];
GO
/****** Object:  StoredProcedure [dbo].[CommandExecute]    Script Date: 07.08.2018 18:34:13 ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

CREATE PROCEDURE dbo.CommandExecute
    @Command NVARCHAR(MAX),
    @CommandType NVARCHAR(MAX),
    @Mode INT,
    @Comment NVARCHAR(MAX) = NULL,
    @DatabaseName NVARCHAR(MAX) = NULL,
    @SchemaName NVARCHAR(MAX) = NULL,
    @ObjectName NVARCHAR(MAX) = NULL,
    @ObjectType NVARCHAR(MAX) = NULL,
    @IndexName NVARCHAR(MAX) = NULL,
    @IndexType INT = NULL,
    @StatisticsName NVARCHAR(MAX) = NULL,
    @PartitionNumber INT = NULL,
    @ExtendedInfo XML = NULL,
    @LogToTable NVARCHAR(MAX),
    @Execute NVARCHAR(MAX)
AS
BEGIN

    ----------------------------------------------------------------------------------------------------
    --// Source: https://ola.hallengren.com                                                          //--
    ----------------------------------------------------------------------------------------------------

    SET NOCOUNT ON;

    DECLARE @StartMessage NVARCHAR(MAX);
    DECLARE @EndMessage NVARCHAR(MAX);
    DECLARE @ErrorMessage NVARCHAR(MAX);
    DECLARE @ErrorMessageOriginal NVARCHAR(MAX);

    DECLARE @StartTime DATETIME;
    DECLARE @EndTime DATETIME;

    DECLARE @StartTimeSec DATETIME;
    DECLARE @EndTimeSec DATETIME;

    DECLARE @ID INT;

    DECLARE @Error INT;
    DECLARE @ReturnCode INT;

    SET @Error = 0;
    SET @ReturnCode = 0;

    ----------------------------------------------------------------------------------------------------
    --// Check core requirements                                                                    //--
    ----------------------------------------------------------------------------------------------------

    IF @LogToTable = 'Y'
       AND NOT EXISTS
    (
        SELECT *
        FROM sys.objects objects
            INNER JOIN sys.schemas schemas
                ON objects.schema_id = schemas.schema_id
        WHERE objects.type = 'U'
              AND schemas.name = 'dbo'
              AND objects.name = 'CommandLog'
    )
    BEGIN
        SET @ErrorMessage
            = N'The table CommandLog is missing. Download https://ola.hallengren.com/scripts/CommandLog.sql.'
              + CHAR(13) + CHAR(10) + N' ';
        RAISERROR(@ErrorMessage, 16, 1) WITH NOWAIT;
        SET @Error = @@ERROR;
    END;

    IF @Error <> 0
    BEGIN
        SET @ReturnCode = @Error;
        GOTO ReturnCode;
    END;

    ----------------------------------------------------------------------------------------------------
    --// Check input parameters                                                                     //--
    ----------------------------------------------------------------------------------------------------

    IF @Command IS NULL
       OR @Command = ''
    BEGIN
        SET @ErrorMessage = N'The value for the parameter @Command is not supported.' + CHAR(13) + CHAR(10) + N' ';
        RAISERROR(@ErrorMessage, 16, 1) WITH NOWAIT;
        SET @Error = @@ERROR;
    END;

    IF @CommandType IS NULL
       OR @CommandType = ''
       OR LEN(@CommandType) > 60
    BEGIN
        SET @ErrorMessage = N'The value for the parameter @CommandType is not supported.' + CHAR(13) + CHAR(10) + N' ';
        RAISERROR(@ErrorMessage, 16, 1) WITH NOWAIT;
        SET @Error = @@ERROR;
    END;

    IF @Mode NOT IN ( 1, 2 )
       OR @Mode IS NULL
    BEGIN
        SET @ErrorMessage = N'The value for the parameter @Mode is not supported.' + CHAR(13) + CHAR(10) + N' ';
        RAISERROR(@ErrorMessage, 16, 1) WITH NOWAIT;
        SET @Error = @@ERROR;
    END;

    IF @LogToTable NOT IN ( 'Y', 'N' )
       OR @LogToTable IS NULL
    BEGIN
        SET @ErrorMessage = N'The value for the parameter @LogToTable is not supported.' + CHAR(13) + CHAR(10) + N' ';
        RAISERROR(@ErrorMessage, 16, 1) WITH NOWAIT;
        SET @Error = @@ERROR;
    END;

    IF @Execute NOT IN ( 'Y', 'N' )
       OR @Execute IS NULL
    BEGIN
        SET @ErrorMessage = N'The value for the parameter @Execute is not supported.' + CHAR(13) + CHAR(10) + N' ';
        RAISERROR(@ErrorMessage, 16, 1) WITH NOWAIT;
        SET @Error = @@ERROR;
    END;

    IF @Error <> 0
    BEGIN
        SET @ReturnCode = @Error;
        GOTO ReturnCode;
    END;

    ----------------------------------------------------------------------------------------------------
    --// Log initial information                                                                    //--
    ----------------------------------------------------------------------------------------------------

    SET @StartTime = GETDATE();
    SET @StartTimeSec = CONVERT(DATETIME, CONVERT(NVARCHAR, @StartTime, 120), 120);

    SET @StartMessage = N'Date and time: ' + CONVERT(NVARCHAR, @StartTimeSec, 120) + CHAR(13) + CHAR(10);
    SET @StartMessage = @StartMessage + N'Command: ' + @Command;
    IF @Comment IS NOT NULL
        SET @StartMessage = @StartMessage + CHAR(13) + CHAR(10) + N'Comment: ' + @Comment;
    SET @StartMessage = REPLACE(@StartMessage, '%', '%%');
    RAISERROR(@StartMessage, 10, 1) WITH NOWAIT;

    IF @LogToTable = 'Y'
    BEGIN
        INSERT INTO dbo.CommandLog
        (
            DatabaseName,
            SchemaName,
            ObjectName,
            ObjectType,
            IndexName,
            IndexType,
            StatisticsName,
            PartitionNumber,
            ExtendedInfo,
            CommandType,
            Command,
            StartTime
        )
        VALUES
        (@DatabaseName, @SchemaName, @ObjectName, @ObjectType, @IndexName, @IndexType, @StatisticsName,
         @PartitionNumber, @ExtendedInfo, @CommandType, @Command, @StartTime);
    END;

    SET @ID = SCOPE_IDENTITY();

    ----------------------------------------------------------------------------------------------------
    --// Execute command                                                                            //--
    ----------------------------------------------------------------------------------------------------

    IF @Mode = 1
       AND @Execute = 'Y'
    BEGIN
        EXECUTE (@Command);
        SET @Error = @@ERROR;
        SET @ReturnCode = @Error;
    END;

    IF @Mode = 2
       AND @Execute = 'Y'
    BEGIN
        BEGIN TRY
            EXECUTE (@Command);
        END TRY
        BEGIN CATCH
            SET @Error = ERROR_NUMBER();
            SET @ReturnCode = @Error;
            SET @ErrorMessageOriginal = ERROR_MESSAGE();
            SET @ErrorMessage = N'Msg ' + CAST(@Error AS NVARCHAR) + N', ' + ISNULL(@ErrorMessageOriginal, '');
            RAISERROR(@ErrorMessage, 16, 1) WITH NOWAIT;
        END CATCH;
    END;

    ----------------------------------------------------------------------------------------------------
    --// Log completing information                                                                 //--
    ----------------------------------------------------------------------------------------------------

    SET @EndTime = GETDATE();
    SET @EndTimeSec = CONVERT(DATETIME, CONVERT(VARCHAR, @EndTime, 120), 120);

    SET @EndMessage = N'Outcome: ' + CASE
                                         WHEN @Execute = 'N' THEN
                                             'Not Executed'
                                         WHEN @Error = 0 THEN
                                             'Succeeded'
                                         ELSE
                                             'Failed'
                                     END + CHAR(13) + CHAR(10);
    SET @EndMessage
        = @EndMessage + N'Duration: '
          + CASE
                WHEN DATEDIFF(ss, @StartTimeSec, @EndTimeSec) / (24 * 3600) > 0 THEN
                    CAST(DATEDIFF(ss, @StartTimeSec, @EndTimeSec) / (24 * 3600) AS NVARCHAR) + '.'
                ELSE
                    ''
            END + CONVERT(NVARCHAR, @EndTimeSec - @StartTimeSec, 108) + CHAR(13) + CHAR(10);
    SET @EndMessage
        = @EndMessage + N'Date and time: ' + CONVERT(NVARCHAR, @EndTimeSec, 120) + CHAR(13) + CHAR(10) + N' ';
    SET @EndMessage = REPLACE(@EndMessage, '%', '%%');
    RAISERROR(@EndMessage, 10, 1) WITH NOWAIT;

    IF @LogToTable = 'Y'
    BEGIN
        UPDATE dbo.CommandLog
        SET EndTime = @EndTime,
            ErrorNumber = CASE
                              WHEN @Execute = 'N' THEN
                                  NULL
                              ELSE
                                  @Error
                          END,
            ErrorMessage = @ErrorMessageOriginal
        WHERE ID = @ID;
    END;

    ReturnCode:
    IF @ReturnCode <> 0
    BEGIN
        RETURN @ReturnCode;
    END;

----------------------------------------------------------------------------------------------------

END;
