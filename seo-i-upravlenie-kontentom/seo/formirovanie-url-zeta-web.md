# Формирование URL Zeta Web

В Zeta Web URL страницы формируется в зависимости от используемого **контрола**.

**Начальный URL** страницы задается вручную:

![](<../../.gitbook/assets/image (392).png>)

![](<../../.gitbook/assets/Image 61.png>)

Таким образом URL будет: {Имя сайта}/{Имя страницы}/ (например, [https://sitename.ru/about/](https://sitename.ru/about/))

При использовании контролов, URL может формироваться следующим образом:

### Контрол «Каталог»

URL страницы с каталогом может быть 2х видов:

1. **Статический URL**: \
   a. URL групп товаров {Имя сайта}/{Имя страницы}/catalog/groups/{Имя каталога\}}  (например, [https://sitename.ru/goods/catalog/groups/tormoznie-kolodki/](https://sitename.ru/goods/catalog/groups/tormoznie-kolodki/))  \
   b. URL перечня товаров {Имя сайта}/{Имя страницы}/goods/products/{Имя каталога\}} (например, [https://sitename.ru/goods/catalog/products/tormoznie-kolodki/](https://sitename.ru/goods/catalog/products/tormoznie-kolodki/))&#x20;
2. **Динамический URL:**  \
   a. {Имя сайта}/{Имя страницы}/?search\_cataloggroup={Имя каталога\}} (например, [https://sitename.ru/?search\_cataloggroup=](https://sitename.ru/?search\_cataloggroup=) tormoznie-kolodki/)&#x20;

**Вид URL (статический или динамический) для каталога задается в рамках домена.**

И**мя каталога** задается вручную для каждой группы каталога.\
Также есть возможность автоматической транслитерации из названия группы каталога в 1С:

![](<../../.gitbook/assets/image (350).png>)

#### SEO для страницы каталога&#x20;

Для каждой группы каталога есть возможность добавлять индивидуальные [мета-теги](nastroika-meta-tegov.md) (аналогично мета-теги формируются и для других страниц), а также 2 произвольных html-текста.

### Контрол «Поиск по автомобилю»

URL страницы формируется по заданной маске для следующих этапов:

1. **Марка** – начальная страница, на которой располагается перечень доступных марок.  \
   URL страницы задается вручную.  \
   _Например,_ [_https://sitename.ru/makes/_](https://sitename.ru/makes/)
2. **Модель**. \
   После выбора марки переход на страницу выбора модели:  \
   a. Статический URL: {Имя сайта}/{Имя страницы}/externalcatalog/models/{Тип автомобиля}/{Имя марки}/  \
   _Например,_ [_https://sitename.ru/models/externalcatalog/models/car/audi/_](https://sitename.ru/models/externalcatalog/models/car/audi/)\
   b. Динамический URL: {Имя сайта}/{Имя страницы}/?ec\_manufacturer={Имя марки}\&ec\_type={id типа автомобиля}  \
   _Например,_ [_https://sitename.ru/models/?ec\_manufacturer=audi\&ec\_type=1/_](https://sitename.ru/models/?ec\_manufacturer=audi\&ec\_type=1/)
3. **Модификация**. \
   После выбора модели переход на страницу выбора модификации:  \
   a. Статический URL: {Имя сайта}/{Имя страницы}/externalcatalog/types/{Тип автомобиля}/{Имя марки}/{id модели}  \
   _Например,_ [_https://sitename.ru/types/externalcatalog/types/car/audi/10/_](https://sitename.ru/types/externalcatalog/types/car/audi/10/)\
   b. Динамический URL: {Имя сайта}/{Имя страницы}/?ec\_manufacturer={Имя марки}\&ec\_type={id типа автомобиля}\&ec\_modelid={id модели}  \
   _Например,_ [_https://sitename.ru/types/?ec\_manufacturer=audi\&ec\_type=1\&ec\_modelid=10_](https://sitename.ru/types/?ec\_manufacturer=audi\&ec\_type=1\&ec\_modelid=10)
4. **Узлы**. \
   После выбора модификации переходим на страницы с перечнем узлов:  \
   a. Статический URL: {Имя сайта}/{Имя страницы}/externalcatalog/tree/{Тип автомобиля}/{Имя марки}/{id модели}/{id модификации} \
   _Например,_ [_https://sitename.ru/accessories/externalcatalog/tree/car/audi/10/1157/_](https://sitename.ru/accessories/externalcatalog/tree/car/audi/10/1157/)\
   b. Динамический URL: {Имя сайта}/{Имя страницы}/?ec\_manufacturer={Имя марки}\&ec\_type={id типа автомобиля}\&ec\_modelid={id модели}\&ec\_typeid={id модификации}  \
   _Например,_ [_https://sitename.ru/accessories/?ec\_manufacturer=audi\&ec\_type=1\&ec\_modelid=10\&ec\_typeid=1157_](https://sitename.ru/accessories/?ec\_manufacturer=audi\&ec\_type=1\&ec\_modelid=10\&ec\_typeid=1157)
5. **Товары**. \
   После выбора узла показываются результаты поиска по узлу:  \
   URL: {Имя сайта}/{Имя страницы}/catalog/byauto/{Тип автомобиля}/{Имя марки}/{id модели}/{id модификации}/{id узла}  \
   _Например,_ [_https://sitename.ru/codeavto/catalog/byauto/car/audi/10/1157/10102/_](https://sitename.ru/codeavto/catalog/byauto/car/audi/10/1157/10102/)

**Тип автомобиля:** \
**- легковой («car» для статического URL, «1» для динамического URL),** \
**- грузовой («truck» для статического URL, «2» для динамического URL).**

**Параметры {Имя марки}, {id модели}, {id модификации}, {id узла} задаются в модуле «Подбор по авто» в 1С для соответствующих элементов справочника.**

#### SEO для страниц модуля "Подбор по авто"

Для каждой страницы есть возможность добавлять общие для данной страницы (т.е. одинаковые данные для всех марок, одинаковые данные для всех модификаций и т.д.):

* Title;
* Description;
* Keywords;
* Картинку;
* Произвольный html-текст.

А также индивидуально для каждой марки, модели, модификации и узла:

* Картинку;
* Произвольный html-текст.

### Контрол «Товар. Детальная информация»

**URL карточки товара:** {Имя сайта}/{Имя страницы}/catalog/product/{Имя товара\}}\
_Например,_ [_https://sitename.ru/details/catalog/product/amortizator-ford-escort-vii-gal-aal-abl-escort-vii-saloon-gal-afl/_](https://sitename.ru/details/catalog/product/amortizator-ford-escort-vii-gal-aal-abl-escort-vii-saloon-gal-afl/)

В зависимости от параметров системы, устанавливаемых в настройках, наименование в URL для номенклатуры может получать дополнительно бренд и/или артикул.

#### SEO для страниц детального просмотра товара

Для каждой страницы есть возможность добавлять индивидуальные:

* Title;
* Description;
* Keywords;
* 3 произвольных html-описания;
* Имя товара в URL.

### Контрол «Информационный блок»

Информационный блок имеет:

1. **Основные атрибуты:** \
   a. Наименование;  \
   b. Наименование в URL (есть возможность копировать из наименования транслитом);  \
   c. Title;  \
   d. Вид информационного блока (в зависимости от указанного вида данный инфоблок будет располагаться на той странице, где добавлен контрол с этим видом, например, на странице «Новости» будут отображаться все инфоблоки, где указана категория «Новости»).&#x20;
2. **Анонс**, который состоит из: \
   a. Картинка анонса;  \
   b. Html-описание анонса.
3.  **Html-текст** инфоблока: &#x20;

    URL информационного блока: {Имя сайта}/{Имя страницы}/news/show/{Имя инфоблока}/ _Например,_ [_https://sitename.ru/articles/news/show/testovaya-novost/_](https://sitename.ru/articles/news/show/testovaya-novost/)

![](<../../.gitbook/assets/image (314).png>)
