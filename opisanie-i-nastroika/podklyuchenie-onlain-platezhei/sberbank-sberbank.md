# Сбербанк (Sberbank)

## Эквайринг Сбербанк

### Описание

Поддерживаемые виды оплаты:

* **Банковская карта.**

Поддерживаемые онлайн-кассы (ФЗ-54)

* **АТОЛ.**

### Настройка <a href="#nastroika" id="nastroika"></a>

#### Личный кабинет Mportal3 <a href="#lichnyi-kabinet-yandeks-kassa" id="lichnyi-kabinet-yandeks-kassa"></a>

{% hint style="info" %}
Рекомендуется предварительно ознакомиться с инструкцией от Сбербанка  [https://securepayments.sberbank.ru/wiki/doku.php/other:54\_fz:atol:checklist](https://securepayments.sberbank.ru/wiki/doku.php/other:54\_fz:atol:checklist)
{% endhint %}

Для настройки эквайринга следует зайти на сайт Сбербанка под учетной записью оператора и открыть раздел **Настройки → Основные.** Пример меню **Настройки** личного кабинета Сбербанк представлен на рисунке ниже.

![](<../../.gitbook/assets/image-1 (5).png>)

В табличной форме **Настройки → Фискализация** необходимо заполнить:

* _**ОФД система**_ - выбрать из списка меню;
* _**Версия ФФД**_ - выбрать из списка меню;
* _**ИНН**_ - внести личные данные;
* _**Идентификатор группы ККТ**_ - внести данные, полученные из личного кабинета АТОЛ;
* _**Логин / Пароль -**_ внести личные данные;
* _**Ставка налога / Система налогообложения / Признак предмета расчета / Признак способа расчета**_ - выбрать из списка меню _(этот блок настраивается по умолчанию, т.к. данные ставки НДС, тип налогообложения и наименования товаров передаются в запросе на пробитие чека из CMS клиента)_;
* _**Наименование товара**_ - следует указать информацию о товаре _(в чек будет отображаться либо информация из данной строки, либо непосредственно содержимое корзины)_;
* _**URL / E-mail по умолчанию**_ - внести личные данные.

{% hint style="danger" %}
Для подключения возможности фискализации обратитесь в техническую поддержку по адресу _support@ecom.sberbank.ru._
{% endhint %}

После письменного запроса в техподдержку интернет-эквайринга Сбербанка с просьбой добавить фискализацию данных, на странице **Настройки → Основные → Фискализация** в нижней части формы появится возможность установки флага в **«Фискализировать по предавторизации»**.

Для перехода в рабочий режим и передачи данных следует установить флаг в **«ОФД включена»**.

#### 1С Предприятие <a href="#id-1s-predpriyatie" id="id-1s-predpriyatie"></a>

В меню 1С Предприятие откройте форму настроек платежных систем (ZetaWeb / Настройка и администрирование / Настройки оплаты, прайс-листы, YML / Настройки платежных систем.

В открывшейся форме добавьте новый элемент и заполните следующие поля:

* Наименование Значение: _Произвольное, понятное вам название настройки;_
* Платежная система _Значение:_ **Сбербанк**
* Договор эквайринга _Значение: Существующий или создайте новый договор эквайринга с поставщиком_
* Идентификатор магазина _Значение: Оставьте это поле_ _**пустым**_
* Идентификатор витрины магазина _Значение: Оставьте это поле_ _**пустым**_
* Логин _Значение: **Логин** для доступа к API, полученный от Сбербанка_\
  _(при переходе на боевой режим заменить логин на актуальный)_
* Пароль _Значение:_ **Пароль** _для доступа к API, полученный от Сбербанка_\
  _(при переходе на боевой режим заменить пароль на актуальный)_
* Требуется защищенное соединение _Значение:_ _**Да**_
* Тестовый режим оплаты: _Значение:_ _**Да**_ _- в режиме тестирования;_ _**Нет**_ _- в режиме реальной работы_
* Адрес платежного шлюза (URL) _Значение:_ **https://3dsec.sberbank.ru/** _- в режиме тестирования;_ **https://securepayments.sberbank.ru/**_- в режиме реальной работы_
* Список видов оплаты _Значение: Добавьте в список предопределенный вид оплаты_ _**Банковской картой на сайте**, затем откройте данный вид оплаты на редактирование и укажите в нем требуемый_ _**Вид оплаты чека ККМ**, который будет подставляться в документ_ _**Оплата от покупателя платежной картой**_

Если ваша онлайн-касса поддерживает интеграцию с Эквайрингом Сбербанка, также заполните следующие параметры:

* Использовать онлайн-кассу _Значение:_ _**Да**_\
  _В случае использования Яндекс.Кассы, установить "Да" для передачи в чеке информации по товарам._
* Идентификатор клиента для онлайн-кассы по умолчанию _Значение:_ _**Сначала телефон**_ _- если необходимо высылать данные об электронном чеке в виде SMS;_ _**Сначала электронная почта**_ _- если необходимо высылать данные об электронном чеке на электронную почту покупателя._

{% hint style="info" %}
После записи настроек, проверить оплату в тестовом режиме (установить созданный вид оплаты в **роли** тестового пользователя) с тестовой картой (см.[https://securepayments.sberbank.ru/wiki/doku.php/test\_cards](https://securepayments.sberbank.ru/wiki/doku.php/test\_cards)).\
Проверить корректность оформление документа "Оплата платежной картой" по заказу в базе.\
Переключить режим настроек **в рабочий режим** при успешном тестировании.
{% endhint %}
