# API 1.0

[http://demo.zetaweb.ru/webservices/api.asmx](http://demo.zetaweb.ru:8888/webservices/api.asmx)

[http://demo.zetaweb.ru/webservices/api.asmx?WSDL](http://demo.zetaweb.ru:8888/webservices/api.asmx?WSDL)

## Примеры методов

### Авторизация

 Получение cookie для дальнейшего использования в методах, требующих авторизации.

Пример кода на C\#:

```csharp
   public async Task<Cookie> AuthorizeAsync(string login, string password, CancellationToken cancellationToken)
    {
        using (var client = new Api.Api())
        {
            if (string.IsNullOrEmpty(login))
            {
                throw new Exception("Не указано значение параметра 'Login'");
            }

            if (string.IsNullOrEmpty(password))
            {
                throw new Exception("Не указано значение параметра 'Password'");
            }

            client.UserAgent = "Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko";
            client.CookieContainer = new CookieContainer();

            var url = "http://demo.zetaweb.ru/webservices/api.asmx";

            client.Url = url;

            client.AuthenticationValue = new Authentication { User = login, Password = password };
            var success = await Task.Run(() => client.Authenticate(), cancellationToken);
            if (!success)
            {
                throw new Exception("Ошибка авторизации");
            }

            var cookie = client.CookieContainer
                .GetCookies(new UriBuilder(client.Url).Uri)
                .Cast<Cookie>()
                .First(x => ".ZETAWEBAUTH" == x.Name);
            return cookie;
        }
    }
```

### Получение списка производителей \(брендов\) по коду \(артикулу\)

Получение списка деталей по коду \(артикулу\). 

Пример кода на C\#:

```csharp
public async Task<IEnumerable<Part>> GetPartsAsync(string vendorCode, string login, string password, CancellationToken cancellationToken)
    {
        try
        {
            using (var client = new Api.Api())
            {
                var cookie = await AuthorizeAsync(login, password, cancellationToken);

                client.CookieContainer.Add(cookie);

                var result = await Task.Run(() => client.ProductsBySearchStringGet(vendorCode, 0, false, false, null, null, 1, 1000), cancellationToken);

                if (result == null)
                    throw new Exception("Ошибка при получении ответа");

                if (!result.Any())
                    return new Part[0];

                var list = result
                    .Where(x => x.IsClarify)
                    .Select(row => new Part
                    {
                        Name = row.ProductName,
                        OriginalVendorName = row.ProductBrand,
                        VendorCode = row.ProductArticle
                    })
                    .ToList();

                return list;
            }
        }
        catch (Exception e)
        {
            // handle exception here
        }
    }
```

### Получение списка предложений \(цен и наличия\)

Получение списка деталей по коду \(артикулу\) и наименованию производителя с ценами, наличием и сроками поставки. 

Пример кода на C\#:

```csharp
public async Task<IEnumerable<PartOffer>> GetPartsOffersAsync(string vendorCode, string vendorName,
        bool searchedPartOffersOnly, string login, string password, CancellationToken cancellationToken)
    {
        try
        {
            using (var client = new Api.Api())
            {
                var cookie = await AuthorizeAsync(login, password, cancellationToken);

                client.CookieContainer.Add(cookie);

                // получение списка производителей (брендов)
                var result = await Task.Run(() => client.ProductsBySearchStringGet(vendorCode, 0, false, false, null, null, 1, 1000), cancellationToken);

                if (result == null)
                    throw new Exception("Ошибка при получении ответа");

                if (!result.Any())
                    return new PartOffer[0];

                var hasClarify = result
                    .Any(x => x.IsClarify);

                if (hasClarify)
                {
                    // если имеются уточнения - получаем идентификатор производителя
                    var brandId = result
                        .Where(x => x.IsClarify && string.Equals(vendorName, x.ProductBrand, StringComparison.OrdinalIgnoreCase))
                        .Select(x => x.ProductBrandId)
                        .FirstOrDefault();

                    // позвращаем пустой ответ, если производитель не найден
                    if (brandId == null)
                        return new PartOffer[0];

                    // получение предложений по коду (артикулу) и производителю (бренду)
                    result = await Task.Run(() => client.ProductsBySearchStringGet(vendorCode, 0, false, false, brandId, null, 1, 1000), cancellationToken);
                }
                else
                {
                    if (!result.Any(x => string.Equals(vendorCode, x.ProductArticle.ToPurifiedString(), StringComparison.OrdinalIgnoreCase)
                        && string.Equals(vendorName, x.ProductBrand, StringComparison.OrdinalIgnoreCase)))
                    {
                        // получаем идентификатор производителя
                        var brandId = result
                            .Where(x => string.Equals(vendorName, x.ProductBrand, StringComparison.OrdinalIgnoreCase))
                            .Select(x => x.ProductBrandId)
                            .FirstOrDefault();

                        if (brandId == null)
                            return new PartOffer[0];

                        // получение предложений по коду (артикулу) и производителю (бренду)
                        result = await Task.Run(() => client.ProductsBySearchStringGet(vendorCode, 0, false, false, brandId, null, 1, 1000), cancellationToken);
                    }
                }

                if (result == null)
                    throw new Exception("Ошибка при получении ответа");

                if (!result.Any())
                    return new PartOffer[0];

                // если нужны толкьо предложения по искомой запчасти без аналогов
                if (searchedPartOffersOnly)
                {
                    result = result
                        .Where(x => string.Equals(vendorCode, x.ProductArticle.ToPurifiedString(), StringComparison.OrdinalIgnoreCase)
                                && string.Equals(vendorName, x.ProductBrand, StringComparison.OrdinalIgnoreCase))
                        .ToArray();
                }

                var list = rows
                    .SelectMany(x => x.Stores, (x, z) => new PartOffer
                    {
                        Id = JsonConvert.SerializeObject(new
                        {
                            x.ProductId,
                            x.ProductDescriptionId
                        }),
                        Part = new Part
                        {
                            Name = string.Concat(string.Empty, x.ProductName, string.IsNullOrEmpty(x.ProductDescriptionName) 
                                ? string.Empty 
                                : ", ", x.ProductDescriptionName),
                            OriginalVendorName = x.ProductBrand,
                            VendorCode = x.ProductArticle,
                        },
                        StoreMeasureUnitName = x.ProductRestUnit,
                        StoreSaleMultiplicity = 1,
                        StoreId = z.StoreId == null
                            ? string.Empty
                            : z.StoreId.ToString(),
                        StoreName = string.Join(", ", z.StoreDescription, z.StoreAbbreviation),
                        StoreQuantity = z.StoreProductQuantity ?? 0,
                        StorePrice = z.StoreProductPrice ?? 0,
                        StoreMinimumDeliveryTime = z.StoreProductDeliveryTime,
                        StoreMaximumDeliveryTime = z.StoreProductDeliveryTime,
                        StoreSuccessfulDeliveryPercentage = null,
                        StoreType = StoreType.Unknown,
                    })
                    .ToList();

                return list;
            }
        }
        catch (Exception e)
        {
            // handle exception here
        }
    }
```

