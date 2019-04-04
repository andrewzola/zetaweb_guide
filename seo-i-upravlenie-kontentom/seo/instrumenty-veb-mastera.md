# Инструменты веб-мастера

## Инструменты веб-мастера: Яндекс Вебмастер, Google Search Console, Яндекс Метрика, Google Аналитика

{% hint style="info" %}
Для работы с Яндекс Вебмастер и Google Search Console необходимо подтвердить права на домен.

В Zeta Web для подтверждения прав используется метод с добавлением мета-тега в head или body.
{% endhint %}

Рассмотрим 2 варианта добавления:

1. Добавление в head или body напрямую через Панель управления сайтом Zeta Web
2. Через [Диспетчер тегов \(Google Tag Manager\)](https://www.google.com/intl/ru/tagmanager/)

### Яндекс Вебмастер. Добавление в head или body напрямую через Панель управления сайтом Zeta Web

{% hint style="warning" %}
При подтверждении прав на сайт в Яндекс Вебмастере обязательным условием является размещение мета-тега в head. Диспетчер тегов не позволяет этого делать, поэтому Яндекс Вебмастер можно подключить только через Панель управления сайтом Zeta Web
{% endhint %}

Для подключение Яндекс Вебмастер необходимо:

* Перейти на сайт [Яндекс Вебмастер](https://webmaster.yandex.ru)
* Авторизоваться или зарегистрироваться \(учетная запись Яндекс\)
* Добавить новый сайт
* Скопировать мета-тег в разделе "Права доступа"

![](../../.gitbook/assets/image%20%284%29.png)

* В Панели управления сайтом Zeta Web перейти в раздел Настройки, открыть нужный домен и вставить мета-тег в раздел head

![](../../.gitbook/assets/image%20%28142%29.png)

* Выполните обмен с сайтом и нажмите "Проверить" на странице Яндекс Вебмастер
* После успешной проверки вы сможете использовать Яндекс Вебмастер

{% hint style="info" %}
Инструкции по работе с Яндекс Вебмастер доступны на сайте [https://yandex.ru/support/webmaster/](https://yandex.ru/support/webmaster/)
{% endhint %}

### Диспетчер тегов \(Google Tag Manager\)

{% hint style="info" %}
Использование Диспетчера тегов Google позволяет добавлять теги, счетчики, скрипты и плагины не заходя в Панель управления сайтом.

О всех возможностях Google Tag Manager на сайте [https://www.google.com/intl/ru/tagmanager/features.html](https://www.google.com/intl/ru/tagmanager/features.html)

Информация о начале работы - [https://www.google.com/intl/ru/tagmanager/get-started.html](https://www.google.com/intl/ru/tagmanager/get-started.html)
{% endhint %}

Для подключения Диспетчера тегов необходимо:

* Перейти на сайт [https://tagmanager.google.com](https://tagmanager.google.com)
* Авторизоваться или зарегистрироваться \(учетная запись Google\)
* Создайте аккаунт и контейнер, выбрав использование на веб-сайте
* После этого из появившегося окна скопируйте данные и вставьте в соответствующие разделы через Панель управления сайтом Zeta Web

![&#x41E;&#x43A;&#x43D;&#x43E; &#x43D;&#x430; &#x441;&#x430;&#x439;&#x442; &#x414;&#x438;&#x441;&#x43F;&#x435;&#x442;&#x447;&#x435;&#x440;&#x430; &#x442;&#x435;&#x433;&#x43E;&#x432;](../../.gitbook/assets/image%20%28155%29.png)

![&#x414;&#x43E;&#x431;&#x430;&#x432;&#x43B;&#x435;&#x43D;&#x438;&#x435; &#x432; head](../../.gitbook/assets/image%20%28365%29.png)

![&#x414;&#x43E;&#x431;&#x430;&#x432;&#x43B;&#x435;&#x43D;&#x438;&#x435; &#x432; body](../../.gitbook/assets/image%20%28366%29.png)

* Выполните обмен с сайтом
* В случае, если все шаги были выполнены верно, Диспетчер тегов будет доступен на сайте. Можно создавать теги.

### Google Search Console. Подключение с помощью Диспетчера тегов.

Для использования Google Search Console необходимо:

* Перейти на сайт [https://www.google.com/webmasters/tools/](https://search.google.com/search-console/welcome)
* Авторизоваться или зарегистрироваться \(учетная запись Google\)
* Добавьте свой сайт \(ресурс\)
* При использовании Диспетчера тегов и работе в той же учетной записи права будут подтверждены автоматически.

### Яндекс Метрика и Google Аналитика. Подключение с помощью Диспетчера тегов.

Яндекс Метрика и Google Аналитика - счетчики от двух самых популярных поисковых систем с большими возможностями аналитики в личном кабинете. Подключение через Диспетчер тегов подробно рассмотрено в различных статьях, например:

* [https://web-specialist.info/wordpress/ustanovka-jandeks-metriki-pri-pomoshhi-gtm](https://web-specialist.info/wordpress/ustanovka-jandeks-metriki-pri-pomoshhi-gtm)
* [https://ppc.world/articles/ustanovka-google-analytics-na-sayt-s-pomoschyu-google-tag-manager/](https://ppc.world/articles/ustanovka-google-analytics-na-sayt-s-pomoschyu-google-tag-manager/)

### Полезные функции

* Переобход страниц Яндекс - [https://webmaster.yandex.ru/blog/prioritetnyy-pereobkhod-stranits-sayta-zapuschen-v-yandeks-vebmastere](https://webmaster.yandex.ru/blog/prioritetnyy-pereobkhod-stranits-sayta-zapuschen-v-yandeks-vebmastere)
* Переобход страниц Google - [https://support.google.com/webmasters/answer/6065812?hl=ru](https://support.google.com/webmasters/answer/6065812?hl=ru)

