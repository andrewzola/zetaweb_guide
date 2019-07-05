# Карта сайта \(Sitemap\)

Термин "Карта сайта \(Sitemap\)" в рамках системы Zeta Web имеет два значения:

* Автоматически генерируемый файл sitemap.xml \([для поисковых систем](https://ru.wikipedia.org/wiki/Sitemaps)\)
* Контрол [SEO. Карта сайта](../../tekhnicheskaya-dokumentaciya/opisanie-kontrolov/5-seo/seo-karta-saita.md), который позволяет выводить иерархию страниц.

## Для поисковых систем

### Автоматически генерируемый файл sitemap.xml

Zeta Web автоматически создает xml-файл sitemap.xml по адресу _http\(или https\)://domain-name/sitemap.xml \(например, https://www.zetasoft.ru/sitemap.xml\)._

При формировании используется следующий формат:

```markup
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <url>
        <loc> URL страницы (например, https://www.zetasoft.ru/products-zetaweb/) </loc>
    </url>
    ...
    <url>
        <loc> URL страницы </loc>
    </url>
</urlset>
```

В файл попадают все ссылки на страницы, которые [не скрыты](../menyu-karty-ssylki/dobavlenie-stranicy-v-kartu-saita.md#skryvat-ili-otobrazhat) для карты сайта и принадлежат выбранной в домене группе.

![](../../.gitbook/assets/image%20%28223%29.png)

### Добавление других файлов \*.xml

Для добавления нескольких файлов sitemap требуется:

1\) Создать другие xml-файлы sitemap;

2\) Сгенерировать карту сайта с N-количеством ссылок \(например, _sitemap1.xml_\);

3\) Для удобства, при наличии нескольких файлов sitemap, существует возможность объединить их в файл индекса sitemap и отправить одновременно. Для этого необходимо создать файл _**sitemapindex.xml**_, _****_внутри которого следует прописать домен \(файл _sitemap.xml_, который генерирует Zeta Web\);

```text
<?xml version="1.0" encoding="UTF-8"?>
   <sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
   <sitemap>
      <loc>http://demo.zetaweb.ru:8888/sitemap.xml</loc>
      <lastmod>2004-10-01T18:23:17+00:00</lastmod>
   </sitemap>
   <sitemap>
      <loc>http://demo.zetaweb.ru:8888/i/sitemap1.xml</loc>
      <lastmod>2005-01-01</lastmod>
   </sitemap>
   </sitemapindex>
```

{% hint style="info" %}
Более подробно с информацией о файле **sitemapindex.xml** Вы можете ознакомиться по ссылкам на сайты [https://support.google.com/webmasters/answer/75712?hl=ru](https://support.google.com/webmasters/answer/75712?hl=ru) и [https://www.sitemaps.org/protocol.html\#index](https://www.sitemaps.org/protocol.html#index).
{% endhint %}

4\) Загрузить файлы на сайт посредством **1С→Управление сайтом→**вкладка **Наименование сайта→**вкладка **Картинк**и→папка **Разное** добавить основной файл ****_**sitemapindex.xml**_ \(при его наличии\)**,** а также дополнительную карту _**sitemap1.xml.**_ 

5\) Открыть загруженные xml-файлы и **получить ссылку**, путем нажатия на соответствующую кнопку;

![&#x414;&#x43E;&#x431;&#x430;&#x432;&#x43B;&#x435;&#x43D;&#x438;&#x435;  xml-&#x444;&#x430;&#x439;&#x43B;&#x430; &#x43D;&#x430; &#x441;&#x430;&#x439;&#x442;](../../.gitbook/assets/image-7.png)

6\) Сообщить поисковой системе о наличии xml-файлов посредством robots.txt.

### Robots.txt

Для того, чтобы сообщить поисковой системе о наличии xml-файлов необходимо открыть **1С→Управление сайтом**→вкладка **Настройки**→вкладка **Домены**→вкладка **Наполнение robots.txt.** 

При этом можно указать путь к sitemap как к основному файлу _**sitemapindex.xml**_, так и к каждому из файлов в отдельности.

![](../../.gitbook/assets/image-2%20%281%29.png)

![](../../.gitbook/assets/image-6.png)







