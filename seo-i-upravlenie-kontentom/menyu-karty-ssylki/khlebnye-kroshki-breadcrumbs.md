# Хлебные крошки \(breadcrumbs\)

## Хлебные крошки \(breadcrumbs\)

**Хлебные крошки \(breadcrumbs\)** - элемент интерфейса на сайте, показывающий навигационную цепочку от начальной страницы \(например, главной страницы сайта\), до текущей страницы.

За создание на сайте хлебных крошек отвечают несколько контролов:

* [SEO. Хлебные крошки]()
* [Автокаталог. Текущий автомобиль]() - для страниц, на которых используются контролы из группы [Поиск. Автокаталог]()
* [Laximo. Этапы 1, 2, 3, 4. Текущее состояние поиска]() - для страниц, на которых используются контролы из группы [Laximo]()

Для отображения хлебных крошек необходимо добавить контрол на страницу и выбрать необходимые параметры контрола:

![](../../.gitbook/assets/image%20%28467%29.png)

Хлебные крошки, как и [URL страницы](../seo/formirovanie-url-zeta-web.md), создаются по-разному в зависимости от используемых [контролов](../../tekhnicheskaya-dokumentaciya/kontroly.md) на текущей странице.

### Хлебные крошки статических страниц

За формирование хлебных крошек у статических страниц отвечает структура в карте сайта, которая доступна через _Панель управления сайтом - Наполнение сайта - Меню_

![](../../.gitbook/assets/image%20%28496%29.png)

В данном разделе задается иерархия страниц, а также есть возможность для каждой страницы указать следующие параметры. На вкладке "Основные":

![](../../.gitbook/assets/image%20%28122%29.png)

* Название для отображения на сайте
* Родитель \(для отображения навигационной цепочки\)
* Адрес - ссылка в хлебных крошках
* Порядок сортировки - позволяет настроить произвольный порядок отображения в дереве \(по умолчанию одинаковый у всех и сортируется по алфавиту\)
* Картинка - при использовании картинок в хлебных крошках

На вкладке "Участие в картах":

![](../../.gitbook/assets/image%20%28548%29.png)

* Скрывать из карты страницы - если мы не хотим отображать данный элемент на странице сайта в хлебных крошках.
* Скрывать из карты сайта - если мы не хотим, чтобы ссылка на эту страницу генерировалась контролом [карта сайта]().

На вкладке "Доступ ролей" мы можем указать каким ролям будет доступен для отображения данный элемент хлебных крошек на сайте:

![](../../.gitbook/assets/image%20%2861%29.png)

Пример отображения в типовом дизайне:

![](../../.gitbook/assets/image%20%286%29.png)

### Хлебные крошки динамических страниц

При наличии на странице контролов, которые создают страницы, хлебные крошки генерируются автоматически и добавляются к хлебным крошкам статической страницы, на которой располагается контрол.

Для всех контролов, кроме Laximo и Поиск. Автокаталог, используется общий контрол [SEO. Хлебные крошки]().

Рассмотрим на примере использования контрола [Поиск. Каталог товаров](). На страницу _catalog_ добавлен соответствующий контрол. Для самой страницы _catalog_ хлебные крошки [статической страницы](khlebnye-kroshki-breadcrumbs.md#khlebnye-kroshki-staticheskikh-stranic).

![](../../.gitbook/assets/image%20%28134%29.png)

После перехода в любой раздел страница создается и хлебные крошки создаются контролом.

![](../../.gitbook/assets/image%20%28283%29.png)

{% hint style="info" %}
В типовом дизайне хлебные крошки добавлены в переменную **breadcrumbs** и на страницы добавлена данная переменная \(за исключение страниц с оригинальными каталогами Laximo и модуля "Подбор по авто"\).
{% endhint %}

## Основной каталог для домена

В случае, если одна номенклатура входит в разные разделы, то к данной номенклатуре на сайте будет несколько путей, но хлебные крошки будут показываться только одни.

Основной каталог для домена задается в настройках домена _Панель управления сайтом - Настройки - Домены_

![](../../.gitbook/assets/image%20%28137%29.png)

{% hint style="info" %}
Если основной каталог не задан, то для хлебные крошки будут формироваться из первой попавшейся группы, в которую входит данный товар.
{% endhint %}

{% hint style="info" %}
Если на сайте используется несколько страниц c контролом каталог, то для исключения дублей необходимо чтобы вся номенклатура была представлена в основном каталоге.
{% endhint %}

## Частые вопросы

{% page-ref page="../../faq/kak-skryt-gruppu-kataloga-iz-khlebnykh-kroshek.md" %}

{% page-ref page="../../faq/gde-nastroit-stranicu-kataloga-dlya-khlebnykh-kroshek.md" %}

