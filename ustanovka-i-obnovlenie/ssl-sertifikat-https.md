# SSL-сертификат \(https\)

## Установка SSL-сертификата \(https\)

{% hint style="info" %}
Общая информация о SSL и HTTPS на wiki:

* SSL - [https://ru.wikipedia.org/wiki/SSL](https://ru.wikipedia.org/wiki/SSL)
* HTTPS - [https://ru.wikipedia.org/wiki/HTTPS](https://ru.wikipedia.org/wiki/HTTPS)
{% endhint %}

{% hint style="warning" %}
Для установки SSL-сертификата необходим сертификат в формате PFX.
{% endhint %}

### Конвертация сертификата в PFX

Для конвертации сертификата воспользуйтесь одним из сервисов, например [ssl4less](https://ssl4less.ru/ssl-tools/convert-certificate.html).

Рассмотрим на примере SSL-сертификата, предоставленного Reg.ru.

* После покупки или получения бесплатного сертификата на сайте reg.ru на почту приходит сообщение с ключами \(наборы символов\), необходимыми для получения сертификата.
* Письмо содержит 5 ключей:
  * Сертификат
  * Корневой сертификат
  * Промежуточный сертификат
  * Запрос на получение сертификата
  * Приватный ключ \(PRIVATE KEY\)
* Для создания сертификата PFX необходимы ключ основного сертификата \(первый ключ\) и приватный ключ.
* Копируем текст сертификата вместе с "-----BEGIN CERTIFICATE-----" и " -----END CERTIFICATE-----" в новый текстовый файл Блокнот и сохраняем с расширением CRT \(например, mydomainname.crt\)

![](../.gitbook/assets/image%20%2843%29.png)

* Копируем текст приватного ключа вместе с " -----BEGIN RSA PRIVATE KEY-----" и " ----- END RSA PRIVATE KEY-----" в новый текстовый файл Блокнот и сохраняем с расширением TXT \(например, myprivatekey.txt\)

![](../.gitbook/assets/image%20%28408%29.png)

* Открываем сервис по конвертации SLL-сертификатов \(например [ssl4less](https://ssl4less.ru/ssl-tools/convert-certificate.html)\)
* Прикрепляем файл сертификата и приватного ключа, задаем пароль \(пароль обязательно запишите, понадобится при установке PFX сертификата на хостинге\) и конвертируем

![](../.gitbook/assets/image%20%28461%29.png)

* Сохраняем полученный сертификат в формате PFX

### Подключение SSL-сертификата на хостинг

Установка полученного сертификата в формате PFX в IIS на хостинге состоит из 2 шагов:

* Импорт сертификата
* Привязка сертификата \(Bindings\)

Оба шага выполняется штатным для IIS способом и зависят от используемой версии IIS. Пример инструкций:

* Для IIS 7 - [на сайте reg.ru](https://www.reg.ru/support/ssl-sertifikaty/ustanovka-ssl-sertifikata/ustanovka-SSL-sertifikata-na-Microsoft-IIS-7)
* Для IIS 8 - [на сайте 1cloud.ru](https://1cloud.ru/help/ssl/installssliis)

Рекомендуем делать привязку https для домена с www и без www.

![](../.gitbook/assets/image%20%28193%29.png)

### Настройка использования https для домена в настройках Zeta Web

После установки SSL-сертификата на хостинге для выбранного домена в панели управления сайтом необходимо установить флаг "Использовать HTTPS" и выполнить обмен с сайтом.

![](../.gitbook/assets/image%20%28490%29.png)

![](../.gitbook/assets/image%20%2865%29.png)

## Рекомендации при переносе сайта и переходе с HTTP на HTTPS

{% hint style="info" %}
Рекомендации от поисковых систем.

**Google:**

* [Что такое перенос сайта?](https://support.google.com/webmasters/answer/34437?hl=ru)
* [Основные сведения о переносе сайта](https://support.google.com/webmasters/answer/6033049?hl=ru)
* [Защитите свой сайт с помощью HTTPS](https://support.google.com/webmasters/answer/6073543)

**Yandex:**

* [Переезд сайта](https://yandex.ru/support/webmaster/yandex-indexing/moving-site.html)
{% endhint %}

Несколько статей, в которых, на наш взгляд, собрана полезная информация для общего понимания:

* Переход с http на https - [https://seo.artox-media.ru/wiki/pereezd-na-https.html](https://seo.artox-media.ru/wiki/pereezd-na-https.html)
* Смена домена - [https://hostiq.ua/blog/how-to-change-domain/](https://hostiq.ua/blog/how-to-change-domain/) \(в статье рекомендуем обратить внимание на пример чек-листа\)



