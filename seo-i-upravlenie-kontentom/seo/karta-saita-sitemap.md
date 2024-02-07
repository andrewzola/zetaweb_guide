# Карта сайта (Sitemap)

Термин "Карта сайта (Sitemap)" в рамках системы Zeta Web имеет два значения:

* Автоматически генерируемый файл sitemap.xml ([для поисковых систем](https://ru.wikipedia.org/wiki/Sitemaps));
* Контрол [SEO. Карта сайта](../../tekhnicheskaya-dokumentaciya/opisanie-kontrolov/5-seo/seo-karta-saita.md), который позволяет выводить иерархию страниц.

## Для поисковых систем

### Автоматически генерируемый файл sitemap.xml

Zeta Web автоматически создает xml-файл **sitemap.xml** по адресу http(или https)://domain-name/sitemap.xml.\
_Например, https://www.zetasoft.ru/sitemap.xml._

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

### Добавление других файлов \*.xml

Для добавления нескольких файлов **sitemap** требуется:

1\) Создать другие xml-файлы sitemap;

2\) Загрузить файлы на сайт;

{% hint style="info" %}
#### Zeta Web 2.x **Zeta Web → Панель управления сайтом → Наполнение сайта →** **Картинки.** 

#### **Zeta Web 3.x** **Zeta Web → Панель управления "Контент" → Наполнение сайта →** **Картинки и файлы.**
{% endhint %}

3\) Открыть загруженные xml-файлы и **получить ссылку**, путем нажатия на соответствующую кнопку;

![](<../../.gitbook/assets/image-11 (3).png>)

4\) Сообщить поисковой системе о наличии xml-файлов посредством **robots.txt.**&#x20;

{% hint style="info" %}
#### Zeta Web 2.x **Zeta Web → Панель управления сайтом → Наcтройки →** **Домены →Наполнение robots.txt.**

#### &#x20;**Zeta Web 3.x** **Zeta Web → Панель управления "Контент" → Сайты→ Robots.txt.**
{% endhint %}

![](<../../.gitbook/assets/image-6 (4).png>)

### **Sitemapindex.xml**

Другим способом для добавления нескольких страниц sitemap является создание **основного файла индекса sitemap**, где будут прописаны пути к остальным файлам.

{% hint style="info" %}
Более подробно с информацией о файле **sitemapindex.xml** можете ознакомиться по ссылкам на сайты [https://support.google.com/webmasters/answer/75712?hl=ru](https://support.google.com/webmasters/answer/75712?hl=ru) и [https://www.sitemaps.org/protocol.html#index](https://www.sitemaps.org/protocol.html#index).
{% endhint %}

Для этого необходимо создать файл **sitemapindex.xml**, пример, которого представлен ниже:

```
<?xml version="1.0" encoding="UTF-8"?>
   <sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
   <sitemap>
      <loc>http://demo.zetaweb.ru:8888/sitemap.xml</loc>
      <lastmod>2004-10-01T18:23:17+00:00</lastmod>
   </sitemap>
   <sitemap>
      <loc>http://demo.zetaweb.ru:8888/f/sitemap1.xml</loc>
      <lastmod>2005-01-01</lastmod>
   </sitemap>
   </sitemapindex>
```

Добавить основной файл **sitemapindex.xml** на сайт.&#x20;

{% hint style="info" %}
#### Zeta Web 2.x **Zeta Web → Панель управления сайтом → Наполнение сайта →** **Картинки.** 

#### **Zeta Web 3.x** **Zeta Web → Панель управления "Контент" → Наполнение сайта →** **Картинки и файлы.**
{% endhint %}

Открыть загруженный xml-файл и **получить ссылку на просмотр.**

В **robots.txt** указать путь к основному файлу **sitemapindex.xml.**

{% hint style="info" %}
#### Zeta Web 2.x **Zeta Web → Панель управления сайтом → Наcтройки →** **Домены →Наполнение robots.txt.** 

#### **Zeta Web 3.x** **Zeta Web → Панель управления "Контент" → Сайты→ Robots.txt.**
{% endhint %}

![](../../.gitbook/assets/image-2.png)
