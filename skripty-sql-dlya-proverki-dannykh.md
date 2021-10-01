# Скрипты SQL для проверки данных

## Проверка позиции на сайте

В параметрах запроса указать \(заменить\):

* {Логин} - логин пользователя на сайте
* {Артикул} - очищенный артикул для поиска
* {Бренд} - бренд

```sql
SET NOCOUNT ON;

-- параметры
DECLARE @webUserLogin NVARCHAR(100) = N'{Логин}';
DECLARE @vendocrPurifiedCode NVARCHAR(200) = N'{Артикул}';
DECLARE @vendorName NVARCHAR(100) = N'{Бренд}';

-- проверка товара
DECLARE @productId UNIQUEIDENTIFIER;
DECLARE @restUnitId UNIQUEIDENTIFIER;
SELECT
    @productId = [product].[ArtID]
  , @restUnitId = [restUnit].[RestUnitOfIssueID]
FROM
    [dbo].[Articles] [product]
LEFT JOIN [dbo].[RestUnitsOfIssue] [restUnit]
    ON [restUnit].[RestUnitOfIssueID] = [product].[RestUnitOfIssueID]
WHERE
    [product].[SearchArticle] = @vendocrPurifiedCode
    AND [product].[BrandName] = @vendorName;

IF @productId IS NULL
    BEGIN
        IF NOT EXISTS
        (
            SELECT
                1
            FROM
                [dbo].[SiteVirtualStorePriceLists] [priceList]
            WHERE
                [priceList].[ProductSearchArticle] = @vendocrPurifiedCode
                AND [priceList].[ProductBrandAlias] = @vendorName
        )
            BEGIN
                PRINT 'Товар не найден в списке номенклатуры и в прайс-листе';
                RETURN;
            END;
    END;

-- проверка единицы измерений
IF @productId IS NOT NULL
   AND @restUnitId IS NULL
    BEGIN
        PRINT 'Для товара не указана единица измерения';
    END;

-- проверка кросса "сам на себя"
IF NOT EXISTS
(
    SELECT
        1
    FROM
        [dbo].[ArticlesCrosses] AS [cross]
    WHERE
        [cross].[CrossSearchArticle] = @vendocrPurifiedCode
        AND [cross].[CrossBrandName] = @vendorName
        AND [cross].[CrossType] = 1
)
    BEGIN
        PRINT 'Не найден кросс "сам на себя"';
        RETURN;
    END;

-- проверка белых списков
IF EXISTS
(
    SELECT
        1
    FROM
        zw.[WhitelistedProducts]
)
    BEGIN
        IF NOT EXISTS
        (
            SELECT
                1
            FROM
                [zw].[WhitelistedProducts] [whiteList]
            WHERE
                [whiteList].[ProductSearchArticle] = @vendocrPurifiedCode
                AND [whiteList].[ProductBrandName] = @vendorName
        )
            BEGIN
                PRINT 'Белые списки включены. ТОвар не включен в белый список';
                RETURN;
            END;
    END;

-- проверка черных списков
IF EXISTS
(
    SELECT
        1
    FROM
        [zw].[BlacklistedProducts] [blackList]
    WHERE
        [blackList].[ProductSearchArticle] = @vendocrPurifiedCode
        AND [blackList].[ProductBrandName] = @vendorName
)
    BEGIN
        PRINT 'Товар находится в черном списке';
        RETURN;
    END;

-- поиск и проверка пользователя
DECLARE @webUserId UNIQUEIDENTIFIER;
DECLARE @webUserRestGroupId UNIQUEIDENTIFIER;
SELECT
    @webUserId = [webUser].[UserID]
  , @webUserRestGroupId = [webUser].[RestGroupId]
FROM
    [dbo].[SiteUsers] [webUser]
WHERE
    [webUser].[UserLogin] = @webUserLogin;

IF @webUserId IS NULL
    BEGIN
        PRINT 'Не найден веб-пользователь';
        RETURN;
    END;

-- поиск и проверка роли
DECLARE @roleId UNIQUEIDENTIFIER;
SELECT
    @roleId = [webUserWebRole].[RoleID]
FROM
    [dbo].[UsersRoles] [webUserWebRole]
WHERE
    [webUserWebRole].[UserID] = @webUserId;

IF @roleId IS NULL
    BEGIN
        PRINT 'Не найдена роль веб-пользователя';
        RETURN;
    END;

DECLARE @webRoleRestGroupId UNIQUEIDENTIFIER;
SELECT
    @webRoleRestGroupId = [webRole].[SiteUserStoresAvailabilityGroupsID]
FROM
    [dbo].[SiteRoles] [webRole]
WHERE
    [webRole].[RoleID] = @roleId;

-- поиск и проверка договоров
DECLARE @customerId UNIQUEIDENTIFIER;
DECLARE @customerContractId UNIQUEIDENTIFIER;
DECLARE @customerContractPriceTypeId UNIQUEIDENTIFIER;
DECLARE @customerContractBasePriceTypeId UNIQUEIDENTIFIER;
DECLARE @restGroupId UNIQUEIDENTIFIER;
DECLARE @pksd NVARCHAR(300);

DECLARE [customerTreatiesCursor] CURSOR FOR
SELECT
    [customer].[ContractorID] AS [customerId]
  , [customerContract].[ContractorsTreatiesID] AS [customerContractId]
  , [customerContract].[ArticlesPriceTypesID] AS [customerContractPriceTypeId]
  , [priceType].[BasePriceType] AS [customerContracBasetPriceTypeId]
  , ISNULL([customer].[Name], '') + ' (' + ISNULL([customer].[Code], '') + '), ' + ISNULL([customerContract].[Name], '') + ' (' + ISNULL([customerContract].[Code], '') + '), ' + [priceType].[Name]
    + ' (' + CAST([customerContract].[ArticlesPriceTypesID] AS NVARCHAR(100)) + ')' + CHAR(10) AS [Name]
  , COALESCE([customerContract].[SiteRestGroupId], [customer].[SiteRestGroupId], @webUserRestGroupId, @webRoleRestGroupId) AS [RestGroupId]
FROM
    [dbo].[SiteUsersContractors] [webUserCustomer]
INNER JOIN [dbo].[Contractors] [customer]
    ON [customer].[ContractorID] = [webUserCustomer].[ContractorID]
INNER JOIN [dbo].[ContractorsTreaties] [customerContract]
    ON [customerContract].[ContractorID] = [customer].[ContractorID]
INNER JOIN [dbo].[ArticlesPriceTypes] [priceType]
    ON [priceType].[ArticlesPriceTypesID] = [customerContract].[ArticlesPriceTypesID]
WHERE
    [webUserCustomer].[UserID] = @webUserId;

OPEN [customerTreatiesCursor];

FETCH NEXT FROM [customerTreatiesCursor]
INTO
    @customerId
  , @customerContractId
  , @customerContractPriceTypeId
  , @customerContractBasePriceTypeId
  , @pksd
  , @restGroupId;

IF @@FETCH_STATUS <> 0
    BEGIN
        PRINT 'Не найдены догвооры контрагента';
        RETURN;
    END;
WHILE @@FETCH_STATUS = 0
    BEGIN

        PRINT @pksd;

        DECLARE @stockAvailability TABLE
            (
                RepositoryId UNIQUEIDENTIFIER
              , SupplierId UNIQUEIDENTIFIER
              , Quantity DECIMAL(15, 3)
            );

        IF @restGroupId IS NULL
            BEGIN
                INSERT INTO
                    @stockAvailability
                (
                    [RepositoryId]
                  , [SupplierId]
                  , [Quantity]
                )
                SELECT
                    [stockAvailability].[RepositoryId]
                  , [stockAvailability].[SupplierId]
                  , [stockAvailability].[Quantity]
                FROM
                    [dbo].[SiteRests2] [stockAvailability]
                WHERE
                    [stockAvailability].[ProductSearchArticle] = @vendocrPurifiedCode
                    AND [stockAvailability].[ProductBrand] = @vendorName;
            END;
        ELSE
            BEGIN
                INSERT INTO
                    @stockAvailability
                (
                    [RepositoryId]
                  , [SupplierId]
                  , [Quantity]
                )
                SELECT
                    [stockAvailability].[RepositoryId]
                  , [stockAvailability].[SupplierId]
                  , [stockAvailability].[Quantity]
                FROM
                    [dbo].[SiteRestGroupRests2] [stockAvailability]
                WHERE
                    [stockAvailability].[ProductSearchArticle] = @vendocrPurifiedCode
                    AND [stockAvailability].[ProductBrand] = @vendorName
                    AND [stockAvailability].[RestGroupId] = @restGroupId;
            END;

        DECLARE @quantity NVARCHAR(MAX) = N'Остатки:' + CHAR(10) + CHAR(13);
        SELECT
            @quantity = @quantity + COALESCE([stock].[Name], [order].[Number], [supplier].[Name]) + N': ' + CAST([stockAcailability].[Quantity] AS NVARCHAR(10)) + CHAR(10)
        FROM
            @stockAvailability [stockAcailability]
        LEFT JOIN [dbo].[Stores] [stock]
            ON [stockAcailability].[RepositoryId] = [stock].[StoreID]
        LEFT JOIN [dbo].[OrderToSupplier] [order]
            ON [stockAcailability].[RepositoryId] = [order].[OrderToSupplierID]
        LEFT JOIN [dbo].[Contractors] [supplier]
            ON [stockAcailability].[SupplierId] = [supplier].[ContractorID]
        WHERE
            [stockAcailability].[Quantity] <> 0;

        PRINT @quantity;

        DECLARE @price DECIMAL(15, 2);

        IF @productId IS NOT NULL
            BEGIN

                SELECT TOP 1
                       @price = [price].[Price]
                FROM
                    [dbo].[LC_ArticlesPrices] [price]
                WHERE
                    (
                        [price].[ArticlesPriceTypesID] = @customerContractPriceTypeId
                        OR [price].[ArticlesPriceTypesID] = @customerContractBasePriceTypeId
                    )
                    AND [price].[ArtID] = @productId
                    AND [price].[ArticleDescriptionID] IS NULL
                    AND [price].[Period] <= GETDATE()
                ORDER BY
                    CASE
                        WHEN [price].[ArticlesPriceTypesID] = @customerContractPriceTypeId THEN
                            1
                        ELSE
                            0
                    END DESC
                  , [price].[Period] DESC;

                IF @price IS NULL
                    BEGIN
                        PRINT 'Цена компании в срезе цен не указана' + CHAR(10);

                        SELECT TOP 1
                               @price = [price].[Price]
                        FROM
                            [dbo].[ArticlesPrices] [price]
                        WHERE
                            (
                                [price].[ArticlesPriceTypesID] = @customerContractPriceTypeId
                                OR [price].[ArticlesPriceTypesID] = @customerContractBasePriceTypeId
                            )
                            AND [price].[ArtID] = @productId
                            AND [price].[ArticleDescriptionID] IS NULL
                            AND [price].[Period] <= GETDATE()
                        ORDER BY
                            CASE
                                WHEN [price].[ArticlesPriceTypesID] = @customerContractPriceTypeId THEN
                                    1
                                ELSE
                                    0
                            END DESC
                          , [price].[Period] DESC;

                        IF @price IS NULL
                            BEGIN
                                PRINT 'Цена компании не указана' + CHAR(10);
                            END;
                        ELSE
                            BEGIN
                                PRINT 'Цена компании: ' + CAST(@price AS NVARCHAR(10)) + CHAR(10);
                            END;
                    END;
                ELSE
                    BEGIN
                        PRINT 'Цена компании в срезе цен: ' + CAST(@price AS NVARCHAR(10)) + CHAR(10);
                    END;
            END;

        DECLARE @priceListPrices NVARCHAR(MAX) = N'Цены поставщиков:' + CHAR(10) + CHAR(13);

        SELECT
            @priceListPrices
            = @priceListPrices + COALESCE([priceList].[StoreName], [order].[Number], [supplier].[Name], 'Прайс-лист') + N': ' + CAST([supplierPrice].[Price] AS NVARCHAR(10)) + CHAR(10)
        FROM
            [dbo].[LC_ContractorsArticlesPrices] [supplierPrice]
        LEFT JOIN [dbo].[OrderToSupplier] [order]
            ON [supplierPrice].[ArticlesPriceTypesID] = [order].[OrderToSupplierID]
        LEFT JOIN [dbo].[SiteVirtualStorePriceLists] [priceList]
            ON [supplierPrice].[ProductSearchArticle] = [priceList].[ProductSearchArticle]
               AND [supplierPrice].[ProductBrand] = [priceList].[ProductBrandAlias]
               AND [supplierPrice].[ArticlesPriceTypesID] = [priceList].[StoreUid]
               AND [supplierPrice].[Price] = [priceList].[Price]
        LEFT JOIN [dbo].[Contractors] [supplier]
            ON [priceList].[SupplierId] = [supplier].[ContractorID]
        WHERE
            (
                @productId IS NOT NULL
                AND [supplierPrice].[ArtID] = @productId
                OR @productId IS NULL
                   AND [supplierPrice].[ProductSearchArticle] = @vendocrPurifiedCode
                   AND [supplierPrice].[ProductBrand] = @vendorName
                   AND [supplierPrice].[ArtID] IS NULL
            );

        PRINT @priceListPrices;

        FETCH NEXT FROM [customerTreatiesCursor]
        INTO
            @customerId
          , @customerContractId
          , @customerContractPriceTypeId
          , @customerContractBasePriceTypeId
          , @pksd
          , @restGroupId;
    END;
CLOSE [customerTreatiesCursor];
DEALLOCATE [customerTreatiesCursor];
```

## Проверка собственных остатков

В параметрах запроса указать \(заменить\):

* {Артикул} - очищенный артикул для поиска
* {Бренд} - бренд

```sql
SET NOCOUNT ON;
DECLARE @VendorCode NVARCHAR(200) = N'{Артикул}';
DECLARE @VendorName NVARCHAR(100) = N'{Бренд}';
DECLARE @ProductId UNIQUEIDENTIFIER = NULL;
DECLARE @ProductDescriptionId UNIQUEIDENTIFIER = NULL;

IF @ProductId IS NULL
    BEGIN
        SELECT
            @ProductId = [product].[ArtID]
        FROM
            [dbo].[Articles] [product]
        WHERE
            [product].[SearchArticle] = @VendorCode
            AND [product].[BrandName] = @VendorName;
        IF @@ROWCOUNT > 1
            BEGIN
                PRINT 'Найдено более одного товара с указанными артикулом и брендом. Пожалуйста, укажите идентификатор товара. Выбранный идентификатор товара: ' + CAST(@ProductId AS NVARCHAR(50));
            END;

    END;

IF @ProductId IS NULL
    BEGIN
        PRINT 'Не найден товар с указанным артикулом и брендом.';
        RETURN;
    END;

DECLARE @productMovement TABLE
    (
        [MovementType] NVARCHAR(50)
      , [StockId] UNIQUEIDENTIFIER
      , [StockName] NVARCHAR(250)
      , [StockType] NVARCHAR(20)
      , [RegistratorId] UNIQUEIDENTIFIER
      , [Quantity] DECIMAL(15, 3)
      , [Date] DATETIME2(7)
    );

WITH [productStockMovement]
AS (SELECT
        [productOnStcok].[MovementType]
      , [productOnStcok].[RegistratorId]
      , [productOnStcok].[StockId]
      , SUM([productOnStcok].[Quantity]) AS [Quantity]
      , MAX([productOnStcok].[Period]) AS [Date]
    FROM
    (
        SELECT
            'Остатки' AS [MovementType]
          , [productOnStcok].[Registrator] AS [RegistratorId]
          , [productOnStcok].[StoreID] AS [StockId]
          , [productOnStcok].[Quantity]
          , [productOnStcok].[Period]
        FROM
            [dbo].[ArticlesInStores] [productOnStcok]
        WHERE
            @ProductId = [productOnStcok].[ArtID]
            AND
            (
                @ProductDescriptionId IS NULL
                AND [productOnStcok].[ArticleDescriptionID] IS NULL
                OR @ProductDescriptionId = [productOnStcok].[ArticleDescriptionID]
            )
        UNION ALL
        SELECT
            'Перемещение' AS [MovementType]
          , [productTransfer].[Registrator] AS [RegistratorId]
          , [productTransfer].[StoreID] AS [StockId]
          , -[productTransfer].[Quantity]
          , [productTransfer].[Period]
        FROM
            [dbo].[ToTransferArticlesFromStores] [productTransfer]
        WHERE
            @ProductId = [productTransfer].[ArtID]
            AND
            (
                @ProductDescriptionId IS NULL
                AND [productTransfer].[ArticleDescriptionID] IS NULL
                OR @ProductDescriptionId = [productTransfer].[ArticleDescriptionID]
            )
        UNION ALL
        SELECT
            'Резерв' AS [MovementType]
          , [productReserve].[Registrator] AS [RegistratorId]
          , [productReserve].[StoreID] AS [StockId]
          , -[productReserve].[Quantity]
          , [productReserve].[Period]
        FROM
            [dbo].[ReservedArticlesInStores] [productReserve]
        WHERE
            @ProductId = [productReserve].[ArtID]
            AND
            (
                @ProductDescriptionId IS NULL
                AND [productReserve].[ArticleDescriptionID] IS NULL
                OR @ProductDescriptionId = [productReserve].[ArticleDescriptionID]
            )
        UNION ALL
        SELECT
            'Остатки' AS [MovementType]
          , [productRetailStock].[Registrator] AS [RegistratorId]
          , [productRetailStock].[StoreID] AS [StockId]
          , [productRetailStock].[Quantity]
          , [productRetailStock].[Period]
        FROM
            [dbo].[ArticlesInRetails] [productRetailStock]
        WHERE
            @ProductId = [productRetailStock].[ArtID]
            AND
            (
                @ProductDescriptionId IS NULL
                AND [productRetailStock].[ArticleDescriptionID] IS NULL
                OR @ProductDescriptionId = [productRetailStock].[ArticleDescriptionID]
            )
    ) [productOnStcok]
    GROUP BY
        [productOnStcok].[MovementType]
      , [productOnStcok].[StockId]
      , [productOnStcok].[RegistratorId])
INSERT INTO
    @productMovement
(
    [StockId]
  , [StockName]
  , [StockType]
  , [Date]
  , [MovementType]
  , [RegistratorId]
  , [Quantity]
)
SELECT
    [stock].[StoreID]
  , [stock].[Name]
  , [stock].[StoreType]
  , [productStockMovement].[Date]
  , [productStockMovement].[MovementType]
  , [productStockMovement].[RegistratorId]
  , [productStockMovement].[Quantity]
FROM
    [productStockMovement]
LEFT JOIN [dbo].[Stores] [stock]
    ON [productStockMovement].[StockId] = [stock].[StoreID];

DECLARE @StockId UNIQUEIDENTIFIER;

DECLARE [StockCursor] CURSOR FOR
SELECT
    [t].[StockId]
FROM
    @productMovement [t]
GROUP BY
    [t].[StockId];

OPEN [StockCursor];
FETCH NEXT FROM [StockCursor]
INTO
    @StockId;
WHILE @@FETCH_STATUS = 0
    BEGIN

        SELECT
            [t].[StockName] AS [Склад]
          , [t].[StockType] AS [ТипСклада]
          , [t].[MovementType] AS [ТипДвижения]
          , [t].[Date] AS [ДатаДвижения]
          , [t].[RegistratorId] AS [Регистратор]
          , [t].[Quantity] AS [Количество]
          , SUM([t].[Quantity]) OVER (ORDER BY
                                          [t].[StockName]
                                        , [t].[Date]
                                      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                                     ) AS [Итог]
        FROM
            @productMovement [t]
        WHERE
            @StockId = [t].[StockId]
        ORDER BY
            [t].[Date];

        SELECT
            [t].[StockName] AS [Склад]
          , [t].[StockType] AS [ТипСклада]
          , [t].[MovementType] AS [ТипДвижения]
          , SUM([t].[Quantity]) AS [Количество]
        FROM
            @productMovement [t]
        WHERE
            @StockId = [t].[StockId]
        GROUP BY
            [t].[StockName]
          , [t].[StockType]
          , [t].[MovementType];

        SELECT
            [productTotal].[StockName] AS [Склад]
          , [productTotal].[StockType] AS [ТипСклада]
          , [productTotal].[Quantity] AS [ВычесленноеКоличество]
          , [productStockTotalTrigger].[Quantity] AS [КоличествоВСрезе]
          , CASE
                WHEN [productTotal].[Quantity] <> [productStockTotalTrigger].[Quantity] THEN
                    'Да'
                ELSE
                    'Нет'
            END AS [Ошибка]
        FROM
        (
            SELECT
                [t].[StockId]
              , [t].[StockName]
              , [t].[StockType]
              , SUM([t].[Quantity]) AS [Quantity]
            FROM
                @productMovement [t]
            WHERE
                @StockId = [t].[StockId]
            GROUP BY
                [t].[StockId]
              , [t].[StockName]
              , [t].[StockType]
        ) [productTotal]
        LEFT JOIN [dbo].[SiteRests2] [productStockTotalTrigger]
            ON [productTotal].[StockId] = [productStockTotalTrigger].[RepositoryId]
               AND @ProductId = [productStockTotalTrigger].[ProductId]
               AND
               (
                   @ProductDescriptionId IS NULL
                   AND [productStockTotalTrigger].[ProductDescriptionId] IS NULL
                   OR @ProductDescriptionId = [productStockTotalTrigger].[ProductDescriptionId]
               );

        FETCH NEXT FROM [StockCursor]
        INTO
            @StockId;
    END;
CLOSE [StockCursor];
DEALLOCATE [StockCursor];

SELECT
    [productTotalTrigger].[QuantityFromStore] AS [КоличествоВСрезеБезГруппДоступности]
  , [productTotalTrigger].[IsFromStore] AS [ЕстьВНаличииВСрезеБезГруппДоступности]
  , CASE
        WHEN [productTotalTrigger].[IsFromStore] = 0
             AND [productTotalTrigger].[QuantityFromStore] > 0
             OR [productTotalTrigger].[IsFromStore] = 1
                AND [productTotalTrigger].[QuantityFromStore] = 0 THEN
            'Да'
        ELSE
            'Нет'
    END AS [Ошибка]
FROM
    [dbo].[SiteRestsSummary2] [productTotalTrigger]
WHERE
    @ProductId = [productTotalTrigger].[ProductId]
    AND
    (
        @ProductDescriptionId IS NULL
        AND [productTotalTrigger].[ProductDescriptionId] IS NULL
        OR @ProductDescriptionId = [productTotalTrigger].[ProductDescriptionId]
    );

SELECT
    [productTotalTrigger].[RestGroupId] [ГруппаДоступности]
  , [productTotalTrigger].[QuantityFromStore] AS [КоличествоВСрезеCГруппамиДоступности]
  , [productTotalTrigger].[IsFromStore] AS [ЕстьВНаличииВСрезеСГруппамиДоступности]
  , CASE
        WHEN [productTotalTrigger].[IsFromStore] = 0
             AND [productTotalTrigger].[QuantityFromStore] > 0
             OR [productTotalTrigger].[IsFromStore] = 1
                AND [productTotalTrigger].[QuantityFromStore] = 0 THEN
            'Да'
        ELSE
            'Нет'
    END AS [Ошибка]
FROM
    [dbo].[SiteRestGroupRestsSummary2] [productTotalTrigger]
WHERE
    @ProductId = [productTotalTrigger].[ProductId]
    AND
    (
        @ProductDescriptionId IS NULL
        AND [productTotalTrigger].[ProductDescriptionId] IS NULL
        OR @ProductDescriptionId = [productTotalTrigger].[ProductDescriptionId]
    );

-- раскомментировать и запустить для перерасчета остатков
--EXEC [dbo].[RecalculateFromRetailRests];
--GO
--EXEC [dbo].[RecalculateFromStoreRests];
--GO
--EXEC [dbo].[RecalculateRestGroupSummary];
```

## Проверка корректности пересчета среза цен

Если используется механизм подтяжки цен предложений поставщиков до собственных цен

```sql
SELECT * FROM [dbo].[SiteRestsSummary2]
WHERE [SiteRestsSummary2].[QuantityFromStore] = 0 AND [SiteRestsSummary2].[IsFromStore] = 1
```

## Очистка остатков и отключение триггеров \(перед полным обменом\)

Позволяет очистить остатки и отключить триггеры \(для ускорения полного обмена\)

```sql
-- Выполнить на базе перед полным обменом ВСЕМИ остатками
-- очистка срезов и отключение индексов
TRUNCATE TABLE [dbo].[SiteRestGroupRests2];
ALTER INDEX ALL ON [SiteRestGroupRests2] DISABLE;
GO
TRUNCATE TABLE [dbo].[SiteRestGroupRestsSummary2];
ALTER INDEX ALL ON [SiteRestGroupRestsSummary2] DISABLE;
GO
TRUNCATE TABLE [dbo].[SiteRests2];
ALTER INDEX ALL ON [SiteRests2] DISABLE;
GO
TRUNCATE TABLE [dbo].[SiteRestsSummary2];
ALTER INDEX ALL ON [SiteRestsSummary2] DISABLE;
GO

-- очистка ВС
TRUNCATE TABLE [dbo].[SiteVirtualStorePriceLists]; -- закомментируйте эту строку, если не требуется полный обмен ВС
DISABLE TRIGGER ALL ON [SiteVirtualStorePriceLists]; -- закомментируйте эту строку, если не требуется полный обмен ВС
GO

-- очитска собственных остатков и отключение триггеров
TRUNCATE TABLE [dbo].[OrderingBuyers];
DISABLE TRIGGER ALL ON [OrderingBuyers];
GO
TRUNCATE TABLE [dbo].[OrdersToSuppliers];
DISABLE TRIGGER ALL ON [OrdersToSuppliers];
GO
TRUNCATE TABLE [dbo].[ArticlesInRetails];
DISABLE TRIGGER ALL ON [ArticlesInRetails];
GO
TRUNCATE TABLE [dbo].[ArticlesInStores];
DISABLE TRIGGER ALL ON [ArticlesInStores];
GO
TRUNCATE TABLE [dbo].[ToTransferArticlesFromStores];
DISABLE TRIGGER ALL ON [ToTransferArticlesFromStores];
GO
TRUNCATE TABLE [dbo].[ReservedArticlesInStores];
DISABLE TRIGGER ALL ON [ReservedArticlesInStores];
```

## Включение триггеров и пересчет остатков \(после полного обмена\)

После полного обмена, если перед этим выключали триггеры

```sql
-- Выполнить на базе после полного обмена ВСЕМИ остатками
-- перерерасчет срезов
ALTER INDEX [PK_SiteRestGroupRests2] ON [SiteRestGroupRests2] REBUILD;
GO
ALTER INDEX [PK_SiteRestGroupRestsSummary2]
ON [SiteRestGroupRestsSummary2]
REBUILD;
GO
ALTER INDEX [PK_SiteRests2] ON [dbo].[SiteRests2] REBUILD;
GO
ALTER INDEX [PK_SiteRestsSummary2] ON [dbo].[SiteRestsSummary2] REBUILD;
GO
EXEC [dbo].[RecalculateFromPriceRests];
GO
EXEC [dbo].[RecalculateFromRetailRests];
GO
EXEC [dbo].[RecalculateFromStoreRests];
GO
EXEC [dbo].[RecalculateInTransitRests];
GO
EXEC [dbo].[RecalculateRestGroupSummary];
GO

-- включение триггеров
ENABLE TRIGGER ALL ON [OrderingBuyers];
GO
ENABLE TRIGGER ALL ON [OrdersToSuppliers];
GO
ENABLE TRIGGER ALL ON [ArticlesInRetails];
GO
ENABLE TRIGGER ALL ON [ArticlesInStores];
GO
ENABLE TRIGGER ALL ON [ToTransferArticlesFromStores];
GO
ENABLE TRIGGER ALL ON [ReservedArticlesInStores];
GO
ENABLE TRIGGER ALL ON [SiteVirtualStorePriceLists];
GO

-- включение индексов
ALTER INDEX ALL ON [SiteRestGroupRests2] REBUILD;
GO
ALTER INDEX ALL ON [SiteRestGroupRestsSummary2] REBUILD;
GO
ALTER INDEX ALL ON [SiteRests2] REBUILD;
GO
ALTER INDEX ALL ON [SiteRestsSummary2] REBUILD;
GO
```

